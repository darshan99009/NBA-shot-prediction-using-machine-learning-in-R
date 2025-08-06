**Predicting Shot Success in NBA Games Using Decision Tree and Random Forest**

This project uses Decision Tree and Random Forest models to predict whether an NBA shot attempt will be successful based on factors such as shot distance, defender proximity, game clock, and shot clock. The analysis is performed using R and is part of the R Programming for Data Science (CSE3035) course at Presidency University, Bengaluru.

-----
**Project Details**

- Student: Darshan Gowda S (20221IST0055)
- Guide: Dr. A.K. Sampath
- Course: R Programming for Data Science
- Institution: Presidency University
- Dataset: Kaggle – NBA Shot Logs (<https://www.kaggle.com/datasets/dansbecker/nba-shot-logs>)
-----
**Dataset Overview**

The dataset contains over 100,000 rows of player shot attempts with features like:

- SHOT\_DIST – Distance of the shot in feet
- CLOSE\_DEF\_DIST – Distance of the closest defender
- SHOT\_CLOCK – Remaining time on the shot clock
- GAME\_CLOCK – Remaining time in the quarter
- FGM – Whether the field goal was made (1) or missed (0)
-----
**Tools & Libraries**

- Language: R
- IDE: RStudio
- Libraries:
  - dplyr
  - ggplot2
  - rpart
  - randomForest
  - caret
  - ROCR
-----
**Data Preprocessing**

- Removed missing values in key columns
- Converted time columns to seconds for uniformity
- Engineered new features like 'success' and 'home\_game' indicators
- Removed irrelevant variables like player names for model training
-----


**Exploratory Data Analysis (EDA)**

1. ![](Aspose.Words.675c289e-91cf-43e3-8c3d-40200a8ad260.001.png)Shot Distance Distribution\
   Description: This graph visualizes the distribution of shots taken at different distances and how success rates drop with longer shots.




1. ![](Aspose.Words.675c289e-91cf-43e3-8c3d-40200a8ad260.002.png)Defender Distance vs Shot Success\
   Description: This line chart shows that the farther the defender, the higher the success rate of the shot.








1. ![](Aspose.Words.675c289e-91cf-43e3-8c3d-40200a8ad260.003.png)Game Clock vs Shot Success\
   Description: Analyzes whether players are more or less successful as the quarter runs down.





1. ![](Aspose.Words.675c289e-91cf-43e3-8c3d-40200a8ad260.004.png)Feature Importance (Random Forest)\
   Description: Bar plot showing which features contributed most to the shot success prediction.
1. ![](Aspose.Words.675c289e-91cf-43e3-8c3d-40200a8ad260.005.png)ROC Curve Comparison\
   Description: Compares Decision Tree and Random Forest models using ROC curves.



-----
**Model Training & Evaluation**

Two models were trained using the caret package:

|**Metric**|**Decision Tree**|**Random Forest**|
| :-: | :-: | :-: |
|Accuracy|60\.45%|58\.32%|
|Sensitivity|80\.70%|71\.46%|
|Specificity|36\.30%|42\.66%|
|Kappa Score|0\.1758|0\.1438|

Confusion Matrix – Decision Tree\
[Insert image: confusion\_matrix\_decision\_tree.png]

Confusion Matrix – Random Forest\
[Insert image: confusion\_matrix\_random\_forest.png]

-----
**Conclusion**

- Shot Distance and Defender Distance were the most important predictors.
- Decision Tree slightly outperformed Random Forest in accuracy and sensitivity.
- Random Forest was better in specificity, suggesting fewer false positives.
-----
**Future Work**

- Integrate more player-level stats (e.g., fatigue, play type)
- Use more advanced models like XGBoost
- Build a web interface to predict shot success in real time

