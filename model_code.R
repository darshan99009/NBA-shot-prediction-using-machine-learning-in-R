# Load required libraries 
library(dplyr) 
library(ggplot2) 
library(randomForest) 
library(rpart) 
library(caret) 
library(ROCR) 

# Load dataset  
nba <- read.csv("nba_shot_logs.csv") 

# Data Preprocessing 
nba <- nba %>% 
  mutate( 
    remaining_seconds = sapply(GAME_CLOCK, function(clock) { 
      parts <- unlist(strsplit(as.character(clock), ":")) 
      as.integer(parts[1]) * 60 + as.integer(parts[2]) 
    }), 
    shot_dist = SHOT_DIST * 0.3048,  # Convert feet to meters 
    defender_dist = CLOSE_DEF_DIST * 0.3048, 
    success = as.factor(SHOT_RESULT == "made"),  # Binary target: made 
    (TRUE), missed (FALSE) 
    is_home = as.factor(LOCATION == "H")  # Home or away 
  ) %>% 
  select(remaining_seconds, shot_dist, defender_dist, success, is_home, 
         SHOT_CLOCK) 

# Train-Test Split (70% train, 30% test) 
set.seed(123) 
trainIndex <- createDataPartition(nba$success, p = 0.7, list = FALSE) 
train <- nba[trainIndex, ] 
test <- nba[-trainIndex, ] 

# Model 1: Decision Tree 
tree_model <- rpart(success ~ ., data = train, method = "class") 
tree_pred <- predict(tree_model, newdata = test, type = "class") 

# Model 2: Random Forest 
rf_model <- randomForest(success ~ ., data = train, ntree = 100) 
rf_pred <- predict(rf_model, newdata = test) 

# Comparison of Accuracy 
results <- data.frame( 
  Model = c("Decision Tree", "Random Forest"), 
) 
Accuracy = c(tree_conf$overall["Accuracy"], rf_conf$overall["Accuracy"]) 
# ROC Curves for Model Comparison 
tree_prob <- predict(tree_model, newdata = test, type = "prob")[, 2] 
rf_prob <- predict(rf_model, newdata = test, type = "prob")[, 2] 
# Plot ROC Curves 
plot(tree_perf, col = "red", main = "ROC Curve Comparison", lwd = 2) 
plot(rf_perf, col = "blue", add = TRUE, lwd = 2) 
legend("bottomright", legend = c("Decision Tree", "Random Forest"), col = 
         c("red", "blue"), lty = 1, lwd = 2)