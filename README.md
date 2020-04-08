# Readme.MD
Submission for JHU Getting and Cleaning Data course by Coursera.

The content of this (coursera_data_exercise) repository and its objective/purpose are underlined below

1. run_analysis.R
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive activity names.
Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

2. CodeBook.md
Explains the data that was produced by the "run_analysis.R" script, its variables, and the processes needed to achieve the objective.


# Guide on using the script
1. Ensure R and RStudio is installed on the computer.
2. Initiate the session by opening "coursera_data_exercise.Rproj"
(Optional ; Skip this part if you wish to do things automatically)
3.  You can download the zipped folder manually by clicking this link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
4.  Unzip the folder into the directory.
5. If you wish to skip step 3 and 4, you can open the run_analysis.R and let it do step 3 and 4 for you.
6. Run the script till the end to reproduce the tidydata.
7. If you manage to finish it until the end, the code will save the tidy data into the directory. The file name should be tidy_data.txt
8. For more explanation about the approach taken and the structure of the data, refer to CodeBook.md


Citations:
Jorge-L. Reyes-Ortiz, Luca Oneto, Albert SamÃ , Xavier Parra, Davide Anguita. Transition-Aware Human Activity Recognition Using Smartphones. Neurocomputing. Springer 2015.
