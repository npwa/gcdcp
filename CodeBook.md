# Code Book

This project contains the resulting merged data after tidying it up from the original files

* train/X_train.txt
* train/y_train.txt
* train/subject_train.txt

It contains all the 7352 observations of 563 variables (Subject and Activity was added in column 1 and 2)
 Subject : int  1 1 1 1 1 1 1 1 1 1 ...
 Activity: int  5 5 5 5 5 5 5 5 5 5 ...
 V1      : num  0.289 0.278 0.28 0.279 0.277 ...
 [...]


## Activity Labels

* "WALKING" (value=1): Subject was walking during the test
* "WALKING_UPSTAIRS" (value=2): Subject was walking up a staircase during the test
* "WALKING_DOWNSTAIRS" (value=3): Subject was walking down a staircase during the test
* "SITTING" (value=4): Subject was sitting during the test
* "STANDING" (value=5): Subject was standing during the test
* "LAYING" (value=6): Subject was laying down during the test
