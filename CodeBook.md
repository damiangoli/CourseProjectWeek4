The run_analysis.R script performs the data preparation and then the steps required as described in the course project’s definition.

Assign each data to variables

features <- features.txt

The features come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

activities <- activity_labels.txt

List of activities performed when the corresponding measurements were taken and its codes (labels)

subj_test <- test/subject_test.txt, contains test data of subjects being observed

x_test <- test/X_test.txt, contains recorded features test data

y_test <- test/y_test.txt, contains test data of activities’code labels

subject_train <- test/subject_train.txt, contains train data of subjects being observed

x_train <- test/X_train.txt, contains recorded features train data

y_train <- test/y_train.txt, contains train data of activities’code labels


Training and the test sets merging to create one data set

Xtt is created by merging x_train and x_test using rbind() function

Ytt is created by merging y_train and y_test using rbind() function

Subject is created by merging subj_train and subj_test using rbind() function
Merged_Data is created by merging Subject, Y and X using cbind() function

TData is created by subsetting Merged_Data, selecting only columns: subject, 
code and the mean and standard deviation for each measurement

Descriptive activity names are assigned with corresponding activity from the second column of the activity variable

Code column in TData renamed into activities

All Acc in column’s name replaced by Accelerometer

All Gyro in column’s name replaced by Gyroscope

All BodyBody in column’s name replaced by Body

All Mag in column’s name replaced by Magnitude

All start with character f in column’s name replaced by Frequency

All start with character t in column’s name replaced by Time

Finale is created by sumarizing TData taking the means of each variable for each activity and each subject, after groupped by subject and activity.

Export Finale into Finale.txt file.
