# Getting and Cleaning Data Course Project

Assignment: 
1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names. 
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

## Instructions to run

Clone this repository
Download ```UCI HAR Dataset``` folder at same location as the clone (not inside it). 
Navigate to the repository-folder in your terminal.
Run ```r``` command to start the R console
Run the ```source("run_analysis.R")``` command to run the script and generate the tidy data in ```analysis_data.txt```.

## Dependencies

This script uses the ```plyr``` package.

