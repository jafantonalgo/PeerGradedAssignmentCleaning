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

