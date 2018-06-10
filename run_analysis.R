##
## The script run_analysis.R does the following:
##
##  1  Merges the training and the test sets to create one data set.
##  2  Extracts only the measurements on the mean and standard deviation for each measurement.
##  3  Uses descriptive activity names to name the activities in the data set
##  4  Appropriately labels the data set with descriptive variable names.
##  5 From the data set in step 4, creates a second, independent tidy
##    data set with the average of each variable for each activity and
##    each subject.

FilePath="/home/nick/projects/Coursera/Getting-and-Cleaning-Data/UCI_HAR_Dataset/"
train_activity <- read.table(paste0(FilePath,"train/y_train.txt")) ## 7352 lines
colnames(train_activity) <- "Activity"

labels <- read.table(paste0(FilePath,"activity_labels.txt"))
colnames(labels) <- c("Activity","Activity_name")


xtrain <- read.table(paste0(FilePath,"train/X_train.txt"))
subject <- read.table(paste0(FilePath,"train/subject_train.txt"))
colnames(subject) <- "Subject"
train <- cbind(subject,train_activity,xtrain)

## > str(train)
## 'data.frame':	7352 obs. of  563 variables:
##  $ Subject : int  1 1 1 1 1 1 1 1 1 1 ...
##  $ Activity: int  5 5 5 5 5 5 5 5 5 5 ...
##  $ V1      : num  0.289 0.278 0.28 0.279 0.277 ...
##  [...]
