---
title: "Codebook"
author: "Kate Stohr"
date: "January 25, 2015"
output: html_document
---

Codebook
========
Codebook was generated on `r as.character(Sys.time())` during the same process that generated the dataset. See `run_analysis.md` or `run_analysis.html` for details on dataset creation.


Data Source 
============
The data was downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Date: `r as.character(date())`

The original source of the data is: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Human Activity Recognition Using Smartphones Dataset
Version 1.0

Authors: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.


Information about the variables
================================
Variable list, including descriptions, source and filename source

|variable.name                        |description                              |source_media    |filename                                       |
|:------------------------------------|:--------------------------------------|:---------------|:----------------------------------------------|
|subjectID                            |Subject Id                             |UCI HAR Dataset |test/subject_test.txt, train/subject_train.txt |
|activityName                         |Activity Name                          |UCI HAR Dataset |activity_labels.txt                            |
|dataType                             |Data Type    (test data/training data) |UCI HAR Dataset |test/y_test.txt, train/y_train.txt             |
|tBodyAcc.mean...X                    |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyAcc.mean...Y                    |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyAcc.mean...Z                    |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tGravityAcc.mean...X                 |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tGravityAcc.mean...Y                 |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tGravityAcc.mean...Z                 |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyAccJerk.mean...X                |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyAccJerk.mean...Y                |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyAccJerk.mean...Z                |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyGyro.mean...X                   |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyGyro.mean...Y                   |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyGyro.mean...Z                   |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyGyroJerk.mean...X               |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyGyroJerk.mean...Y               |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyGyroJerk.mean...Z               |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyAccMag.mean..                   |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tGravityAccMag.mean..                |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyAccJerkMag.mean..               |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyGyroMag.mean..                  |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyGyroJerkMag.mean..              |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyAcc.mean...X                    |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyAcc.mean...Y                    |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyAcc.mean...Z                    |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyAcc.meanFreq...X                |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyAcc.meanFreq...Y                |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyAcc.meanFreq...Z                |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyAccJerk.mean...X                |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyAccJerk.mean...Y                |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyAccJerk.mean...Z                |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyAccJerk.meanFreq...X            |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyAccJerk.meanFreq...Y            |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyAccJerk.meanFreq...Z            |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyGyro.mean...X                   |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyGyro.mean...Y                   |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyGyro.mean...Z                   |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyGyro.meanFreq...X               |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyGyro.meanFreq...Y               |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyGyro.meanFreq...Z               |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyAccMag.mean..                   |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyAccMag.meanFreq..               |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyBodyAccJerkMag.mean..           |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyBodyAccJerkMag.meanFreq..       |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyBodyGyroMag.mean..              |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyBodyGyroMag.meanFreq..          |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyBodyGyroJerkMag.mean..          |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyBodyGyroJerkMag.meanFreq..      |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|angle.tBodyAccMean.gravity.          |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|angle.tBodyAccJerkMean..gravityMean. |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|angle.tBodyGyroMean.gravityMean.     |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|angle.tBodyGyroJerkMean.gravityMean. |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|angle.X.gravityMean.                 |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|angle.Y.gravityMean.                 |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|angle.Z.gravityMean.                 |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyAcc.std...X                     |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyAcc.std...Y                     |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyAcc.std...Z                     |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tGravityAcc.std...X                  |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tGravityAcc.std...Y                  |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tGravityAcc.std...Z                  |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyAccJerk.std...X                 |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyAccJerk.std...Y                 |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyAccJerk.std...Z                 |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyGyro.std...X                    |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyGyro.std...Y                    |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyGyro.std...Z                    |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyGyroJerk.std...X                |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyGyroJerk.std...Y                |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyGyroJerk.std...Z                |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyAccMag.std..                    |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tGravityAccMag.std..                 |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyAccJerkMag.std..                |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyGyroMag.std..                   |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|tBodyGyroJerkMag.std..               |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyAcc.std...X                     |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyAcc.std...Y                     |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyAcc.std...Z                     |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyAccJerk.std...X                 |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyAccJerk.std...Y                 |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyAccJerk.std...Z                 |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyGyro.std...X                    |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyGyro.std...Y                    |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyGyro.std...Z                    |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyAccMag.std..                    |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyBodyAccJerkMag.std..            |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyBodyGyroMag.std..               |Feature Vector                         |UCI HAR Dataset |features.txt                                   |
|fBodyBodyGyroJerkMag.std..           |Feature Vector                         |UCI HAR Dataset |features.txt                                   |


Summary Information 
===================

The following steps were taken to summarize the data: 

1. The test and training datasets were combined into a single dataset, with names applied from the file "feature.txt"
2. The feature vectors corresponding to "mean" (mean) and "standard deviation"(std) were selected and the remaing feature vectors were dropped.
3. The data was grouped by Subject Id, Activity Name, and Data Type using the group_by fundtion.
4. Each variable in the grouped data was summarized (using the "summarize" function) by mean. 

Note: Data could have been made "tall" by melting column data by factor within the feature vectors, but this step was not required.  


