# libraries
library(dplyr)

# Download the dataset
filename <- "getdata_projectfiles_UCI HAR Dataset.zip"

# Checking if folder exists
if (!file.exists("getdata_projectfiles_UCI HAR Dataset")) { 
  unzip(filename) 
}

# Assigning all data frames
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
xtest <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
ytest <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")
# Step 1: Merges the training and the test sets to create one data set.
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
mergedData <- cbind(subject, y, x)

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
data <- mergedData %>% select(subject, code, contains("mean"), contains("std"))

# Step 3: Uses descriptive activity names to name the activities in the data set.
data$code <- activities[data$code, 2]

# Step 4: Appropriately labels the data set with descriptive variable names.
names(data)[2] = "activity"
names(data)<-gsub("Acc", "Accelerometer", names(data))
names(data)<-gsub("gravity", "Gravity", names(data))
names(data)<-gsub("Body|body", "Body", names(data))
names(data)<-gsub("^t", "Time", names(data))
names(data)<-gsub("^f", "Frequency", names(data))
names(data)<-gsub("Gyro", "Gyroscope", names(data))
names(data)<-gsub("BodyBody", "Body", names(data))
names(data)<-gsub("Mag", "Magnitude", names(data))
names(data)<-gsub("angle", "Angle", names(data))

# Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
FinalData <- data %>%
  group_by(subject, activity) %>%
  summarise_all(mean)
write.table(FinalData, "FinalData.txt", row.name=FALSE)

# Final Data Check
str(FinalData)

FinalData
