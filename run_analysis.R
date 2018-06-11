##
## The script run_analysis.R does the following:
##
##  1 Merges the training and the test sets to create one data set.
##  2 Extracts only the measurements on the mean and standard deviation for each measurement.
##  3 Uses descriptive activity names to name the activities in the data set
##  4 Appropriately labels the data set with descriptive variable names.
##  5 From the data set in step 4, creates a second, independent tidy
##    data set with the average of each variable for each activity and
##    each subject.

source_file <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filename <- basename(source_file)
download.file(source_file, filename, method="curl")
unzip(filename)
setwd("UCI HAR Dataset")

#
# Read in features and activity labels
labels <- read.table("activity_labels.txt")
labels[,2] <- as.character(labels[,2])

features <- read.table("features.txt")
features[,2] <- as.character(features[,2])


#
# Get the indicies of the data for mean and stdev simplify the names
# of the required features (remove dashes and parenthesis, capitalize
# the name)
required_features <- grep(".*mean.*|.*std.*", features[,2])
required_features.names <- features[required_features,2]
required_features.names = gsub('-mean', 'Mean', required_features.names)
required_features.names = gsub('-std', 'Std', required_features.names)
required_features.names <- gsub('[-()]', '', required_features.names)


# Read the training dataset, add subject and activities column
train <- read.table("train/X_train.txt")[required_features]
train_activities <- read.table("train/y_train.txt")
train_subjects <- read.table("train/subject_train.txt")
train <- cbind(train_subjects, train_activities, train)

# Read the test dataset, add subject and activities column
test <- read.table("test/X_test.txt")[required_features]
test_activities <- read.table("test/y_test.txt")
test_subjects <- read.table("test/subject_test.txt")
test <- cbind(test_subjects, test_activities, test)

# Merge the two datasets and add labels
all_data <- rbind(train, test)
colnames(all_data) <- c("Subject", "Activity", required_features.names)

#
# Convert Activities and Subjects into factors
all_data$Activity <- factor(all_data$Activity, levels = labels[,1], labels = labels[,2])
all_data$Subject <- as.factor(all_data$Subject)

all_data.melted <- melt(all_data, id = c("Subject", "Activity"))
all_data.mean <- dcast(all_data.melted, Subject + Activity ~ variable, mean)

write.table(all_data.mean, "tidy_data.txt", row.names = FALSE, quote = FALSE)
