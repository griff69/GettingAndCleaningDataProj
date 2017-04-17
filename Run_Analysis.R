######################################################################################################
##   NAME: Eric Griffin                                                          Date: Apr-15-2017  ##
## course: Coursera - Getting and Cleaning Data                                                     ##  
##   Assn: Week 4 - Project Assignment                                                              ##
##   File: Run_Analysis.R                                                                           ##
##                                                                                                  ##
## Purpose:                                                                                         ##
##          1. Merge the training and the test sets to create one data set.                         ##
##          2. Extracts only the measurements for the mean and Std.Deviation for each measurement.  ## 
##          3. Uses descriptive activitty names to identfy activities in the data set               ##
##          4. Appropriately labels the data set with descriptive variable names.                   ##
##          5. From the data set in step 4, creates a second, independent tidy data set with the    ##
##             average of each variable for each activity and each subject.                         ## 
##                                                                                                  ##
## License: [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz  ##
##              Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly      ##
##              Support Vector Machine. International Workshop of Ambient Assisted Living           ##
##              (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012                                      ##
##                                                                                                  ##
######################################################################################################

## load needed libraries
library(dplyr)
library(tidyverse)
library(data.table)

## file and Path based Variables
working_dir   <- "C:\\Users\\Griff\\Documents\\Coursera\\CleaningData"
data_folder   <- "./data"
source_data   <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"  
dest_datafile <- "Dataset.zip"
dest_path     <-  paste(data_folder, dest_datafile, sep = "/")
proj_data_dir <-  "C:\\Users\\Griff\\Documents\\Coursera\\CleaningData\\data\\UCI HAR Dataset"  



## Set working Directory
setwd(working_dir)

#check that data target folder exisi or create it.
if(!file.exists(data_folder))
{
  dir.create(data_folder)
}

## Download zipped project data file
fileUrl1 <- source_data
download.file(fileUrl1,destfile = dest_path)

## Uncompress project zip file
unzip(dest_path, exdir = data_folder)
setwd(proj_data_dir)

activity_labels_table <- read.table("./activity_labels.txt", header = FALSE)
features_table        <- read.table("./features.txt",header = FALSE)

## Features contain duplicate variables, by concatenating  column 1 and2
##into a new Variable in column 3, uniqueness is maintained
features_table <- cbind(features_table, V3 =paste0( as.character(features_table$V2), 
                                                                      as.character( features_table$V1) ))


#reading the files in the folder with read.table

#Features 
 x_test<-read.table("./test/X_test.txt",header = FALSE)
 x_train<-read.table("./train/X_train.txt",header = FALSE)

#Activities
 y_test<-read.table("./test/Y_test.txt",header=FALSE)
 y_train<-read.table("./train/Y_train.txt",header=FALSE)

#Subjects
 sub_test<-read.table("./test/subject_test.txt",header=FALSE)
 sub_train<-read.table("./train/subject_train.txt",header=FALSE)




## Apply feature column names to test and train sets
names(x_train)<-features_table$V3
names(x_test)<-features_table$V3

## single column variable  for activity labeled 
names(y_train)<-"activity"
names(y_test)<-"activity"

## single colmmn variable  for subject labeled  
names(sub_train)<-"subject"
names(sub_test)<-"subject"


# combine  subject ,acitivity and features for  train and test sets
syx_train=cbind(sub_train,y_train,x_train)
syx_test=cbind(sub_test,y_test,x_test)



####################################################################################################
##                                      Grading Objectives                                        ##   
##                                                                                                ## 
####################################################################################################

#Objective #1 : Merge all observations from training and test sets

subActFeatures<-rbind(syx_train,syx_test)



#Objective #2 : subActMeanStd is the extraction of all mean and standard deviation variables
#               for each measurement

subActMeanStd  <- subActFeatures[,grep("subject|activity|mean|std",colnames(subActFeatures))]


#Objective #3 : replace activity ordinal value with the descriptive activity name

SubActFeatures_Descriptive<-subActMeanStd%>%  
  arrange(activity) %>%  
  mutate(activity = as.character(factor(activity, levels=1:6,  
                                        labels= activity_labels_table$V2)))


#Objective #4 : data set with descriptive variable names.

names(SubActFeatures_Descriptive)<-gsub("tBodyAcc-","TimedBodyAcceleration-",
                                                                 names(SubActFeatures_Descriptive))
names(SubActFeatures_Descriptive)<-gsub("tBodyAccMag-","TimedBodyAccelerationMagnitude-",
                                                                 names(SubActFeatures_Descriptive))
names(SubActFeatures_Descriptive)<-gsub("tBodyAccJerk-","TimedBodyAccelerationJerkSignal-",
                                                                 names(SubActFeatures_Descriptive))
names(SubActFeatures_Descriptive)<-gsub("tBodyAccJerkMag-","TimedBodyAccelerationJerkSignalMagnitude-",
                                                                 names(SubActFeatures_Descriptive))
names(SubActFeatures_Descriptive)<-gsub("tGravityAcc-","TimedGravityAcceleration-",
                                                                 names(SubActFeatures_Descriptive))
names(SubActFeatures_Descriptive)<-gsub("tGravityAccMag-","TimedGravityAccelerationMagnitude-",
                                                                 names(SubActFeatures_Descriptive))
names(SubActFeatures_Descriptive)<-gsub("tBodyGyro-","TimedBodyGyroscopeMeasured-",
                                                                 names(SubActFeatures_Descriptive))
names(SubActFeatures_Descriptive)<-gsub("tBodyGyroMag-","TimedBodyGyroscopeMeasuredMagnitude-",
                                                                 names(SubActFeatures_Descriptive))
names(SubActFeatures_Descriptive)<-gsub("tBodyGyroJerk-","TimedBodyGyroscopeMeasuredJerkSignal-",
                                                                 names(SubActFeatures_Descriptive))
names(SubActFeatures_Descriptive)<-gsub("tBodyGyroJerkMag-","TimedBodyGyroscopeMeasuredJerkSignalMagnitude-",
                                                                 names(SubActFeatures_Descriptive))
names(SubActFeatures_Descriptive)<-gsub("fBodyAcc-","FrequencyBodyAcceleration-",
                                                                 names(SubActFeatures_Descriptive))
names(SubActFeatures_Descriptive)<-gsub("fBodyAccMag-","FrequencyBodyAccelerationMagnitude-",
                                                                 names(SubActFeatures_Descriptive))
names(SubActFeatures_Descriptive)<-gsub("fBodyAccJerk-","FrequencyBodyAccelerationJerkSignal-",
                                                                 names(SubActFeatures_Descriptive))
names(SubActFeatures_Descriptive)<-gsub("fBodyGyro-","FrequencyBodyGyroscopeMeasured-",
                                                                 names(SubActFeatures_Descriptive))
names(SubActFeatures_Descriptive)<-gsub("fBodyAccJerkMag-","FrequencyBodyAccelerationJerkMagnitude-",
                                                                 names(SubActFeatures_Descriptive))
names(SubActFeatures_Descriptive)<-gsub("fBodyGyroMag-","FrequencyBodyGyroscopeMeasuredMagnitude-",
                                                                 names(SubActFeatures_Descriptive))



#Objective #5 : tidy dataset with the average of each variable for each activity and each subject
#               written out to file also.                     
tidydata<-SubActFeatures_Descriptive%>%group_by(subject,activity)%>%summarise_all(mean)
write.table(tidydata, "TidyData.txt", row.name=FALSE)


#####################################################################################################
#####################################################################################################