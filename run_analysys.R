##Before running thhis scrpit:
##download the worlking file from the following link:
##https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##extraxt the file in your workgin directory

##load the library(dplyr)


## Assigning dataframes from the unzipped files UCI HAR Dataset
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activity <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subj_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subj_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

##Merging the training and the test sets to create one data set.
Xtt <- rbind(x_train, x_test)
Ytt <- rbind(y_train, y_test)
Subject <- rbind(subj_train, subj_test)
Merged_Data <- cbind(Subject, Ytt, Xtt)

## Extracting the measurements on the mean and standard deviation for each measurement.
TData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))

TData$code <- activity[TData$code, 2]

names(TData)[2] = "activity"
names(TData)<-gsub("Acc", "Accelerometer", names(TData))
names(TData)<-gsub("Gyro", "Gyroscope", names(TData))
names(TData)<-gsub("BodyBody", "Body", names(TData))
names(TData)<-gsub("Mag", "Magnitude", names(TData))
names(TData)<-gsub("^t", "Time", names(TData))
names(TData)<-gsub("^f", "Frequency", names(TData))
names(TData)<-gsub("tBody", "TimeBody", names(TData))
names(TData)<-gsub("-mean()", "Mean", names(TData), ignore.case = TRUE)
names(TData)<-gsub("-std()", "STD", names(TData), ignore.case = TRUE)
names(TData)<-gsub("-freq()", "Frequency", names(TData), ignore.case = TRUE)
names(TData)<-gsub("angle", "Angle", names(TData))
names(TData)<-gsub("gravity", "Gravity", names(TData))

Finale <- TData %>%
  group_by(subject, activity) %>%
  summarise_all( list(mean))
write.table(Finale, "Finale.txt", row.name=FALSE)