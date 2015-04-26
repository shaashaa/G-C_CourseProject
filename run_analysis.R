library(plyr)


# (1) Merging the training and the test sets to create one data set
###################################################################

# Reading and viewing x_train data
x_train <- read.table("Dataset/train/X_train.txt")
head(x_train)

# Reading and viewing y_train data
y_train <- read.table("Dataset/train/y_train.txt")
head(y_train)

# Reading and viewing subject_train data
subject_train <- read.table("Dataset/train/subject_train.txt")
head(subject_train)

# Reading and viewing x_test data
x_test <- read.table("Dataset/test/X_test.txt")
head(x_test)

# Reading and viewing y_test data
y_test <- read.table("Dataset/test/y_test.txt")
head(y_test)

# Reading and viewing subject_test data
subject_test <- read.table("Dataset/test/subject_test.txt")
head(subject_test)

# Merging x train & test data into x_data
x_data <- rbind(x_train, x_test)

# Merging y train & test data into y_data
y_data <- rbind(y_train, y_test)

# Merging subject train & test data into subject_data
subject_data <- rbind(subject_train, subject_test)

# Merging x, y & subject data into one data (all_data)
all_data <- cbind(subject_data, y_data, x_data)


# (2) Extracting only the measurements on the mean and standard deviation for each measurement
##############################################################################################

# Reading and viewing features data
features <- read.table("Dataset/features.txt")
head(features)

# Extracting columns which has mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# Extracting the mean and standard deviation for each measurement
x_data <- x_data[, mean_and_std_features]

# Naming the columns appropiately
names(x_data) <- features[mean_and_std_features, 2]


# (3) Using descriptive activity names to name the activities in the data set
#############################################################################

# Reading and viewing activities_label data
activities_lables <- read.table("Dataset/activity_labels.txt")

# Updating with correct activity names
y_data[, 1] <- activities_lables[y_data[, 1], 2]

# Naming the column
names(y_data) <- "activity"


# (4) Appropriately labeling the data set with descriptive variable names
######################################################################

# Naming the columns appropiately
names(subject_data) <- "subject"


# (5) creating a second, independent tidy data set with the average of each variable for each activity and each subject 
####################################################################################################################

# Merging latest x, y & subject data into one data (all_data)
all_data <- cbind(x_data, y_data, subject_data)

# Getting average of each variable for each activity and each subject on all the columns (1:66) except subject & activity
average_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

# Writing into a table
write.table(average_data, "average_data.txt", row.name=FALSE)
