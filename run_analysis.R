## 1. Merge the training and the test sets to create one data set.

subject_train <- read.table("../UCI\ HAR\ Dataset/train/subject_train.txt")
X_train <- read.table("../UCI\ HAR\ Dataset/train/X_train.txt")
y_train <- read.table("../UCI\ HAR\ Dataset/train/y_train.txt")

subject_test <- read.table("../UCI\ HAR\ Dataset/test/subject_test.txt")
X_test <- read.table("../UCI\ HAR\ Dataset/test/X_test.txt")
y_test <- read.table("../UCI\ HAR\ Dataset/test/y_test.txt")

## Combining into data set
subject_data <- rbind(subject_train, subject_test)
X_data <- rbind(X_train, X_test)
y_data <- rbind(y_train, y_test)

## 2. Extract only the measurements on the mean and standard deviation for each measurement.

features <- read.table("../UCI\ HAR\ Dataset/features.txt")
## Looking for lines with the word mean or std from the second collumn in features
mean_std <- grep("(mean|std)", features[, 2])
X_data <- X_data[, mean_std]
names(X_data) <- features[mean_std, 2]
feature_length <- length(mean_std)

## 3. Use descriptive activity names to name the activities in the data set.

## We want to take the activity labels from our activity_labels.txt file
## and replace their numbers with the numbers in y_data
## y_data:				activity_labels:			Result y_data:
## 5							5  WALKING						WALKING

activity_labels <- read.table("../UCI\ HAR\ Dataset/activity_labels.txt")
## Set first column of y_data to second column of activity_labels after first column of y_data indices
y_data[, 1] <- activity_labels[y_data[, 1], 2]

## 4. Appropriately label the data set with descriptive variable names.

names(subject_data) <- "subject"
names(y_data) <- "activity"

data <- cbind(X_data, y_data, subject_data)

## 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject. 

library(plyr)
tidy_data <- ddply(data, .(subject, activity), function(x) colMeans(x[, 1:feature_length]))

write.table(tidy_data, "tidy_data.txt", row.name=FALSE)
