---
title: "Peer Graded Project Code Book"
author: "Jess"
date: "12/31/2020"
output: html_document
---

run_analysis.R is a script that performs data import and/or preparation of the downloaded data then the 5 steps required by the project.

1. Download the dataset
   1. zipped file data is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
   1. zip file is unzip using R.
  
1. Assign each data to variables <br/>
   1. `activities` <- `activity_labels.txt` <br/>
  Dimension: 6 rows, 2 columns <br/>
  *Links the class labels with their activity name.*
  
   1. `features` <- `features.txt` <br/>
  Dimension: 561 rows, 2 columns <br/>
  *List of all features. A 561-feature vector with time and frequency domain variables.*
  
   1. `subject_test` <- `test/subject.txt` <br/>
  Dimension: 2947 rows, 1 column <br/>
  *This is the test data. Each row identifies the subject who performed the activity for each window sample. There are 9/30 subjects included*
  
   1. `xtest` <- `test/X_test.txt` <br/>
  Dimension: 2947 rows, 561 columns <br/>
  *includes recorded features test data*
   1. `ytest` <- `test/Y_test.txt` <br/>
  Dimension: 2947 rows, 1 column <br/>
  *includes test data of activities’ code labels*
   1. `subject_train` <- `test/subject_train.txt` <br/>
  Dimension: 7352 rows, 1 column <br/>
  *This is the train data. Each row identifies the subject who performed the activity for each window sample. There are 21/30 subjects included*
   1. `xtrain` <- `test/X_train.txt` <br/>
  Dimension: 7352 rows, 561 column <br/>
  *includes recorded features train data*
   1. `ytrain` <- `test/y_train.txt` <br/>
  Dimension: 7352 rows, 1 column <br/>
  *includes train data of activities’ code labels*

1. Merges the training and the test sets to create one data set
   1. Combine test and train data for `x` by merging `xtrain` and `xtest` using `rbind()` function.
   1. Combine test and train data for `y` by merging `ytrain` and `ytest` using `rbind()` function.
   1. Combine all `subject` data by merging `subject_test` and `subject_train` using `rbind()` function.
   1. `mergedData` contains the merged data of `subject`, `x`, `y` through the `cbind()` function.
   
1. Extracts only the measurements of the mean and standard deviation for measurement
   * `data` is created after subsetting `mergedData` and selecting only the columns, `subject`, `code` and the measurements on the `mean` and `std` for each measurement.
   
1. Uses descriptive activity names to name the activities in the data set
   * Entire number in `code` column of the `data` replaced corresponding activity taken from the second column of the `activities` variable.
   
1. Appropriately labels the data set with descriptive variable names
   * `code` column name is renamed to `activities`
   * All `Acc` characters found in the column names is replaced to `Accelerometer`
   * All `gravity` characters found in the column names is replaced to `Gravity`
   * All `Body|body` characters found in the column names is replaced to `Body`
   * The first instant `t`s in column names are changed to `Time`
   * The first instant `f`s in column names are changed to `Frequency`
   * All `Gyro` characters found in the column names is replaced to `Gyroscope`
   * All `Mag` characters found in the column names is replaced to `Magnitute`
   * All `angle` characters found in the column names is replaced to `Angle`

1. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

   * `FinalData` is created by getting the means per group after grouping the `data` per `activity` and `subject`.
   * Finally, `FinalData` is exported using `write.table` into `FileData.txt` file.
  
  