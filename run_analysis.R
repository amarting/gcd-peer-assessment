zip <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
if (!file.exists("data")) {
  dir.create("data")
}

## Be wary to finish the destfile with the zip extension to download properly, instead of just writing down a dir path, which may cause an error

download.file(zip, destfile = 'C:\\Users\\gutieral\\Desktop\\data\\project.zip')

## Unzip and record date of download
unzip(zipfile = 'C:\\Users\\gutieral\\Desktop\\data\\project.zip', exdir = 'C:\\Users\\gutieral\\Desktop')

date_downloaded <- date()
date_downloaded

## [1] "Wed Apr 22 12:24:17 2015"

setwd("C:\\Users\\gutieral\\Desktop\\UCI\\train")

train_data <- read.table( 'X_train.txt')
train_label <- read.table('y_train.txt')
train_subject <- read.table('subject_train.txt')

setwd("C:\\Users\\gutieral\\Desktop\\UCI\\test")

## Merge two datasets, data and labels separately

test_data <- read.table('X_test.txt')
test_label <- read.table('y_test.txt')
test_subject <- read.table('subject_test.txt')

data_set <- rbind(train_data, test_data)
label_set <- rbind(train_label, test_label)
subject_set <- rbind(train_subject, test_subject)

dim(data_set)
dim(label_set)
dim(subject_set)



###  Step 2, extract measurements for Mean and St Deviation for each feature

features <- read.table('C:\\Users\\gutieral\\Desktop\\UCI\\features.txt')
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
data_set <- data_set[, meanStdIndices]
dim(data_set) # 10299*66



names(data_set) <- gsub("\\(\\)", "", features[meanStdIndices, 2]) # remove "()"
names(data_set) <- gsub("mean", "Mean", names(data_set)) # capitalize M
names(data_set) <- gsub("std", "Std", names(data_set)) # capitalize S
names(data_set) <- gsub("-", "", names(data_set)) # remove "-" in column names 


# Step3. Uses descriptive activity names to name the activities in dataset

activity <- read.table("C:\\Users\\gutieral\\Desktop\\UCI\\activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[label_set[, 1], 2]
label_set[, 1] <- activityLabel
names(label_set) <- "activity"

# Step4. Appropriately labels the data set with descriptive activity 
# names. 
names(subject_set) <- "subject"
cleanedData <- cbind(subject_set, label_set, data_set)
dim(cleanedData) # 10299*68
write.table(cleanedData, "merged_data.txt") # write out the 1st dataset

# Step5. Creates a second, independent tidy data set with the average of 
# each variable for each activity and each subject. 
subjectLen <- length(table(subject_set)) # 30
activityLen <- dim(activity)[1] # 6
columnLen <- dim(cleanedData)[2]
result <- matrix(NA, nrow=subjectLen*activityLen, ncol=columnLen) 
result <- as.data.frame(result)
colnames(result) <- colnames(cleanedData)
row <- 1
for(i in 1:subjectLen) {
  for(j in 1:activityLen) {
    result[row, 1] <- sort(unique(subject_set)[, 1])[i]
    result[row, 2] <- activity[j, 2]
    bool1 <- i == cleanedData$subject
    bool2 <- activity[j, 2] == cleanedData$activity
    result[row, 3:columnLen] <- colMeans(cleanedData[bool1&bool2, 3:columnLen])
    row <- row + 1
  }
}
head(result)
write.table(result, "data_with_means.txt") # write out the 2nd dataset

data <- read.table("./data_with_means.txt")
data[1:12, 1:3]
