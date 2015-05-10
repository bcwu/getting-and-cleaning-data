# View README.md for more information
# This project analyzes a wearable computing data set collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
#         
#         http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
# 
# The data for the project was downloaded from the following location:
#         
#         https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

library(dplyr)
library(tidyr)
library(stringr)
library(reshape2)

# Download and unzip the data in the /data sub folder of the working directory
if(!file.exists("data")){dir.create("data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/HARDataset.zip", mode = "wb")
list.files("./data")

dateDownloaded <-date()
dateDownloaded

unzip("./data/HARDataset.zip", exdir = "./data")

# Map directory path
dataDirectory <- "./data"

# creates file names lists with full directory path, recursively search through all sub folders
files_list <- list.files(dataDirectory, full.names=TRUE, recursive = TRUE)

## read the relevant data sets
# read.csv() does not parse the data correctly; read.table is used instead
activity_labels <-read.table("./data/UCI HAR Dataset/activity_labels.txt")
feature_names <- read.table("./data/UCI HAR Dataset/features.txt")

test_subject_id <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
test_activity_id <- read.table("./data/UCI HAR Dataset/test/y_test.txt") # links to subject_test
test_data <- read.table("./data/UCI HAR Dataset/test/X_test.txt")

train_subject_id <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
train_activity_id <- read.table("./data/UCI HAR Dataset/train/y_train.txt") # links to subject_train
train_data <- read.table("./data/UCI HAR Dataset/train/X_train.txt")


## 1) merge the training and test sets to create one data set
# rbind test and training data sets

bind_data <- rbind(test_data, train_data)
bind_activity_ids <- rbind(test_activity_id, train_activity_id)
bind_subject_ids <- rbind(test_subject_id, train_subject_id)

# label the variables with feature labels
names(bind_data) <- feature_names$V2


## 3) use descriptive activity names to name the activites in the data set
# merge activity ids and activity labels
merged_activity <- merge(bind_activity_ids, activity_labels, by.x = "V1", by.y = "V1", all = TRUE)
names(merged_activity) <- c("activity_id","activity_name")

# cbind merged activity
bind_data <- cbind(merged_activity, bind_data)

# cbind subject ids
names(bind_subject_ids) <- c("subject_id")
bind_data <- cbind(bind_subject_ids, bind_data)


## 2) extract only the measurements on the mean and standard deviation for each measurement

# Variable Name Restrictions in R applies to column names. Force unique column names with valid characters, with make.names()
valid_column_names <- make.names(names=names(bind_data), unique=TRUE, allow_ = TRUE)
names(bind_data) <- valid_column_names

mean_std_index <- grep("[Mm]ean|std", names(bind_data)) 
selected_data <- select(bind_data, subject_id, activity_id, activity_name, mean_std_index)

# alternative method without select
# mean_std_names <- grep("[Mm]ean|std", names(bind_data), value = TRUE) 
# mean_std_data <- bind_data[,c("subject_id", "activity_id", mean_std_names)] 


## 4) appropriately label the data set with descriptive variable names

names(selected_data) <- str_replace_all(names(selected_data), "[.][.]", "")
names(selected_data) <- str_replace_all(names(selected_data), "BodyBody", "Body")
names(selected_data) <- str_replace_all(names(selected_data), "std", "StandardDeviation")
names(selected_data) <- str_replace_all(names(selected_data), "Acc", "Acceleration")
names(selected_data) <- str_replace_all(names(selected_data), "Gyro", "AngularVelocity")
names(selected_data) <- str_replace_all(names(selected_data), "Mag", "Magnitude")


## 5) from the data set in step 4, create a second, independent tidy data set with 
#       the average of each variable for each activity and each subject.

# tidyr code: spread doesn't perform aggregation and will produce errors 
# tidy_data <- selected_data %>%
#         gather(measurements, value, -subject_id, -activity_id, -activity_name) %>%
#         spread(measurements, value) # Error: Duplicate identifiers for rows

# tidyr code with group_by and summarize from dplyr
# tidy_data <- selected_data %>%
#         gather(measurements, value, -subject_id, -activity_id, -activity_name) %>%
#         group_by(subject_id, activity_id, activity_name, measurements) %>%
#         summarize(average = mean(value)) %>%
#         spread(measurements, average) 

# reshape2 code
tidy_data <- selected_data %>%
        melt(c("subject_id", "activity_id", "activity_name")) %>%
        dcast(subject_id + activity_id + activity_name ~ variable, mean)
                        
# Create the new tidy dataset
write.table(tidy_data,"./tidy_data.txt", row.name=FALSE)