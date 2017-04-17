---
title: "README.md"

Output : a tidy dataset summarizing the averages for each  feature mean and Standard Deviation related column variable grouped by Subject and their respective activity 

---
Information about the R scripts used for the data cleaning project. The project is based on data collected from the accelerometers  from the samsung galaxy smarphone. Full description of the dataset is available at 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


# Run_analysis.R

This is the main script that is called to performed the cleaning and tidying of the dataset as described in the excercise and listed below.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This file assumes that datazip file has been downloaded and unzipped.

# tidydata.txt

This is the written output file of the cleaned dataset upon completion of the trasformation  of the traiing and test observations


# Permission to use the dataset is granted under the following acknowledgement:


[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012