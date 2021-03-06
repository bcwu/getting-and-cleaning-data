# README


[run_analysis.R](./run_analysis.R) transforms the Human Activity Recognition Using Smartphones Data Set into a tidy dataset using the the principles of tidy data as outlined in Hadley Wickham's paper "Tidy Data":

http://www.jstatsoft.org/v59/i10/paper

The R script uses the following packages to help in transforming messy data into tidy data:

* dplyr
* tidyr
* stringr
* reshape2


## Output

The result output is [tidy_data.txt](./tidy_data.txt)


## Source data

[run_analysis.R](./run_analysis.R) will download the source data into the ./data folder

The Human Activity Recognition Using Smartphones Data Set is collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the following website:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data was downloaded from the following location:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


## Description of run_analysis.R

[run_analysis.R](./run_analysis.R) performs the following tasks (though not necessarily in order).

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Codebook

[codebook.md](./codebook.md) describes the specific details of variables, values, and units in the tidy data set.


## Links

The foolowing links contain information on the R packages used in [run_analysis.R](./run_analysis.R)

* [Data Processing with dplyr & tidyr](https://rpubs.com/bradleyboehmke/data_wrangling)
* [stringr: modern, consistent string processing](http://journal.r-project.org/archive/2010-2/RJournal_2010-2_Wickham.pdf)
* [An Introduction to reshape2](http://seananderson.ca/2013/10/19/reshape.html)