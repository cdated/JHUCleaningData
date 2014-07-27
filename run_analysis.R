# This script does the following
# 1) Merges the training and the test sets to create one data set.
# 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3) Uses descriptive activity names to name the activities in the data set
# 4) Appropriately labels the data set with descriptive variable names. 
# 5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

# Will download data if it isn't already present
source("get_data.R")

# Used for inner_join()
if (!require("dplyr")) 
{
  install.packages("dplyr")
  require("dplyr")
}

# Used for melt()
if (!require("reshape2")) 
{
  install.packages("reshape2")
  require("reshape2")
}

# Ensure all the data is downloaded and available
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
zip_file <- "./data/getdata-projectfiles-UCI HAR Dataset.zip"
dataset_path <- "./data/UCI HAR Dataset"

# Download if zip is not found and unzip if dataset_path is not found
get_data(url, zip_file, dataset_path)

test_path <- paste(dataset_path, "test", sep='/')
train_path <- paste(dataset_path, "train", sep='/')

# Load all of the data into memory
#train_x <- read.table(paste(train_path, "X_train.txt", sep='/'))
#train_y <- read.table(paste(train_path, "y_train.txt", sep='/'))
#train_subject <- read.table(paste(train_path, "subject_train.txt", sep='/'))

#test_x <- read.table(paste(test_path, "X_test.txt", sep='/'))
#test_y <- read.table(paste(test_path, "y_test.txt", sep='/'))
#test_subject <- read.table(paste(test_path, "subject_test.txt", sep='/'))

#features <- read.table(paste(dataset_path, "features.txt", sep='/'))[,2]
#activity <- read.table(paste(dataset_path, "activity_labels.txt", sep='/'))

names(activity) = c("activity_id", "activity")

group_data <- function(x, y, subject) {
  names(x) = features
  names(y) = "activity_id"
  names(subject) = "subject"
  
  cbind(subject, y, x)
}

# Put together all the test and training data
test_data <- group_data(test_x, test_y, test_subject)
train_data <- group_data(test_x, test_y, test_subject)
full_data <- rbind(test_data, train_data)

# Use an inner join from dplr package to replace activity id with activity label 
full_data <- inner_join(full_data, activity)
full_data <- full_data[, -which(names(full_data) %in% c("activity_id"))  ]

# Separate all the mean and std data
stdmean_features <- grepl("mean|std", names(full_data))
stdmean_data <- full_data[,stdmean_features]

write.csv(stdmean_data, "./data/stdmean.csv")

# Use melt as mentioned in http://vita.had.co.nz/papers/tidy-data.pdf by Hadley Wickham
# to give each experiment variable a column and ensure each row has one observation.
# Also favor grouping by fixed variables like subject and activity
id_labels = c("subject", "activity")
data_labels = setdiff(colnames(full_data), id_labels)
tidy_data = melt(full_data, id = id_labels, measure.vars = data_labels)

write.csv(tidy_data, "./data/tidy_all.csv")

# Calculate the mean value by subject and activity for each measurable variable
tidy_data_mean = dcast(tidy_data, subject + activity ~ variable, mean)

write.csv(tidy_data_mean, "./data/tidy_data_mean.csv")