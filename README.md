---
title: "Peer Graded Project README"
author: "Jess"
date: "12/31/2020"
output: html_document
---

This repository is created as required by the coursera course on Getting and Cleaning Data course project. 

### Dataset
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Files
 * `CodeBook.md` is the markdown file that contains the detailed information about the data used, preparation and cleaning, and aggregation and transformation performed on the extracted data.
 * `run_analysis.R` contains the actual script used to perform prepare the data as require in the project. This also includes how the zip file was imported and extracted in the working directory.
   1. Step 1: Merges the training and the test sets to create one data set.
   1. Extracts only the measurements on the mean and standard deviation for each measurement.
   1. Uses descriptive activity names to name the activities in the data set.
   1. Appropriately labels the data set with descriptive variable names.
   1. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
   
 * `FinalData.txt` is the final output after performing the preparation of the data.
