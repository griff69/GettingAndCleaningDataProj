---
title: "CodeBook.md"
output: html_document
---
Codebook explaining the different variables used and any transformations applied in scripts for data cleaning project.

# run_analysis.R

## file names

- working_dir           : Parent course folder and working directory 
- data_folder           : Designated data folder for all datafiles
- source_data           : Location of the remote datafile
- dest_datafile         : Local file name of recieved data file
- dest_path             : Location of Downloaded Datafile 
- proj_data_dir         : Unzipped Project Folder for all data files 



## variables

- activity_labels_table : table of activity text labels 
- features_table        : table of all unique features
 
- x_test                : test set of feature Observations
- x_train               ; training set of feature  Observations

- y_test                : test Activity      
- y_train               : training Activity 

- sub_train             : table for subject numbers for training observations
- sub_test              : table for subject numbers for test observations


## transformations

- syx_train                  : Combine subject,acitivity and features for training sets
- syx_test                   : Combine subject,acitivity and features for test sets
- subActFeatures             : Merging of all observations from training and Test into aa single set of Subject Activity Features
- subActMeanStd              : grep extract of mean and standard deviation measurment feature variable columns from subActFeatures 
- SubActFeatures_Descriptive : Mutation of subActMeanStd  which  includes descriptive Activity and Feature names 


## Final Result    

- tidydata	 : clean data set with the average of each variable group by subject and their activity
- tidydata.txt   : written table file of clean data set in data_folder

       

