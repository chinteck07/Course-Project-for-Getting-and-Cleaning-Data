#step1:Merges the training and the test sets to create one data set.

#setting the working directory
setwd("C:\\Users\\USER\\Documents\\My Learning\\External\\Assignment\\Assignment_3\\Getting and Cleaning Data Course Project")

#create a folder name "data" 
if(!file.exists("./data")){dir.create("./data")}

#download the file from website and perform unzip to the "data" folder
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")

#create a reference path
ref_path <- file.path("./data" , "UCI HAR Dataset")
files<-list.files(ref_path, recursive=TRUE)
files

#Get the activity file and perform concatenate the data tables by rows
test_act <- read.table(file.path(ref_path, "test" , "Y_test.txt" ),header = FALSE)
train_act <- read.table(file.path(ref_path, "train", "Y_train.txt"),header = FALSE)
dt_act <- rbind(test_act, train_act)

#Get the test file and perform concatenate the data tables by rows
test_sub  <- read.table(file.path(ref_path, "test" , "subject_test.txt"),header = FALSE)
train_sub <- read.table(file.path(ref_path, "train", "subject_train.txt"),header = FALSE)
dt_sub <- rbind(test_sub, train_sub)


#Get the features file and perform concatenate the data tables by rows
test_features<- read.table(file.path(ref_path, "test" , "X_test.txt" ),header = FALSE)
train_features <- read.table(file.path(ref_path, "train", "X_train.txt"),header = FALSE)
dt_features<- rbind(test_features, train_features)






##Step2:Extracts only the measurements on the mean and standard deviation for each measurement
#Subset Name of Features by measurements on the mean and standard deviation
dataFeaturesNames <- read.table(file.path(ref_path, "features.txt"),head=FALSE)
names(dt_features)<- dataFeaturesNames$V2
subdataFeaturesNames<-dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]



#Step3: Uses descriptive activity names to name the activities in the data set
activity<- read.table(file.path(ref_path, "activity_labels.txt"))
activityLabel <- activity[dt_act[, 1], 2]
dt_act[, 1] <- activityLabel
names(dt_act) <- "activity"

#Step4: Appropriately labels the data set with descriptive variable names.
names(dt_sub)<-c("subject")
selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
dt_sub_act <- cbind(dt_sub, dt_act)
dt_overall <- cbind(dt_features, dt_sub_act)
dt_overall<-subset(dt_overall,select=selectedNames)

#Step 5: creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr);
dt_mean<-aggregate(. ~subject + activity, dt_overall, mean)
dt_mean<-dt_mean[order(dt_mean$activity),]
write.table(dt_mean, file = "tidydata.txt",row.name=FALSE)

