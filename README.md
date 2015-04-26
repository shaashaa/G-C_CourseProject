# G-C_CourseProject
-Data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

-The R script run_analysis.R,
-(1) Reads the training and test data; And then Merges the training and the test sets using rbind
-(2) Reads the festures data; Extracts the columns which has mean() or std() in their names; And then extracts the mean and standard deviation for each measurement
-(3) Reads the activities_label data; Updates with correct activity names and also update the column name
-(4) Appropriately labels the data set with descriptive variable names
-(5) Merges all the data into one;  Getting average of each variable for each activity and each subject using ddply; Writing the obtained average data into a table (average_data.txt)
