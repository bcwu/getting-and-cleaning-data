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


## Codebook

[codebook.md](./codebook.md) describes the specific details of variables, values, and units in the tidy data set.