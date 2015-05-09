# Code book

The data in [tidy_data.txt](./tidy_data.txt) can be read into R with the following code:

        read.table("tidy_data.txt", header=TRUE)


## Overview

[run_analysis.R](./run_analysis.R) transforms the Human Activity Recognition Using Smartphones Data Set into a tidy dataset.


## Source data

[run_analysis.R](./run_analysis.R) will download the source data into the ./data folder

The Human Activity Recognition Using Smartphones Data Set is collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the following website:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data was downloaded from the following location:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Only the following subsets of data were used, since subsequent steps deselected of all the variables that are not related to mean or standard deviation

* ./data/UCI HAR Dataset/activity_labels.txt
* ./data/UCI HAR Dataset/features.txt
* ./data/UCI HAR Dataset/test/subject_test.txt
* ./data/UCI HAR Dataset/test/y_test.txt
* ./data/UCI HAR Dataset/test/X_test.txt
* ./data/UCI HAR Dataset/train/subject_train.txt
* ./data/UCI HAR Dataset/train/y_train.txt
* ./data/UCI HAR Dataset/train/X_train.txt


## Output

The result output is [tidy_data.txt](./tidy_data.txt)


## Data Dictionary

This tidy data set contains the mean and standard deviation variables described in the [features_info.txt](./data/UCI HAR Dataset/features_info.txt) file of the original data set. 

There are three important identifier variables:

* **subject_id** - Identifies the corresponding volunteer
* **activity_id** - Identifies the activity
* **activity_name** - Names of the corresponding activity


### Transformations

* "BodyBody" in original variable names were replaced by "Body"
* "std" in original variable names were replaced by "StandardDeviation"
* "Acc" in original variable names were replaced by "Acceleration"
* "Gyro" in original variable names were replaced by "AngularVelocity"
* "Mag" in original variable names were replaced by "Magnitude"

Example mappings:

* original:"tBodyGyroMag.std"
* tidy:"tBodyAngularVelocityMagnitude.StandardDeviation"