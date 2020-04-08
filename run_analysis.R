# Getting and Cleaning Data Assignment
# 8th of April 2020

# 1.0 Download the data 

### 1.1 Declaring filenames and path for download to commence
file_name = "UCIdata.zip"
zipped_url ="http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dir ="UCI HAR Dataset"

### 1.2 Check. If file doesn't exist, it will download the file into working directory
if(!file.exists(file_name)){
  download.file(url = zipped_url,destfile = file_name,mode = "wb") 
}else{
  # If file does exist, it will check whether the folder exists
  #  If folder didn't exist, it will unzip the zipped file from 1.2
  if(!file.exists(dir)){
    unzip("UCIdata.zip", files = NULL, exdir=".")
  }
}

# 2.0 Read Files
test_filenames = list.files("UCI HAR Dataset/test/",full.names = T)
train_filenames = list.files("UCI HAR Dataset/train/",full.names = T)
### 2.1 Test Dataset
x_test = read.table(test_filenames[3])
y_test = read.table(test_filenames[4])
### 2.2 Train Dataset
x_train = read.table(train_filenames[3])
y_train = read.table(train_filenames[4])
### 2.3 Subject Dataset
subject_test = read.table(test_filenames[2])
subject_train = read.table(train_filenames[2])
### 2.4 Supporting Dataset
activity_labels = read.table("UCI HAR Dataset/activity_labels.txt")
features = read.table("UCI HAR Dataset/features.txt")  


# 3.0 Processing the files
### 3.1 Check the structure of the data
str(x_test)
str(y_test)

str(x_train)
str(y_train)

str(subject_test)
str(subject_train)

str(activity_labels)
str(features)

#* 3.2 Merges the training and the test sets to create one data set. Also sets the variable names accordingly

# Understanding what the data represents:
# The unique person in this experiment will be referred as subjects_df
subject_df = rbind(subject_train, subject_test)
names(subject_df) = "subject"
# The activity labels of the experiment will be called activity_df 
activity_df = rbind(y_train, y_test)
names(activity_df) = "activity"
# The activity measurements will be called features_df
features_df = rbind(x_train, x_test)
features_colnames = features %>% select(V2) %>% pull()
names(features_df) = features_colnames


#* 3.3 Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_std_index = grep("mean()|std()", features$V2) 
features_df = features_df[,mean_std_index] # subset only necessary columns



#* 3.4 Uses descriptive activity names to name the activities in the data set
activity_df$activity = factor(activity_df$activity,labels=activity_labels[,2])

#* 3.5 Appropriately labels the data set with descriptive variable names.
# Pull the names out into a vector so that if there is a mistake, you can always go back to the original

features_colnames = names(features_df)

# Subbing out characters for better readability
features_colnames = gsub("^t", "t_", features_colnames)
features_colnames = gsub("^f", "f_", features_colnames)
features_colnames = gsub("Acc", "accelerometer_", features_colnames)
features_colnames = gsub("Gyro", "gyroscope_", features_colnames)
features_colnames = gsub("Mag", "magnitude_", features_colnames)
features_colnames = gsub("BodyBody|Body", "body_", features_colnames)
features_colnames = gsub("Gravity", "gravity_", features_colnames)
features_colnames = gsub("Jerk", "jerk_", features_colnames)

features_colnames = gsub("-X", "_x", features_colnames)
features_colnames = gsub("-Y", "_y", features_colnames)
features_colnames = gsub("-Z", "_z", features_colnames)

# Clear or change unwanted symbols
features_colnames = gsub("[()]", "", features_colnames)
features_colnames = gsub("-", "", features_colnames)
# Trim any whitespaces (whitespaces can compromise your work during analysis if you are not careful)
features_colnames = trimws(features_colnames)
# Tolower (Personally for me, i prefer if there are no caps in the variable names)
features_colnames = tolower(features_colnames)

# Putting back into the dataset
names(features_df) = features_colnames

# Combining all datasets together
combine_df = cbind(subject_df,activity_df, features_df)

combine_df$subject = as.factor(combine_df$subject)


#* 3.6 From the data set in step 4, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.
tidy_data=aggregate(formula = . ~subject + activity,data = combine_df,FUN= mean)
# Credit to this helpful video to make it a one liner:
# https://www.youtube.com/watch?v=zmiC7X9fUmo

# Rearrange into order
tidy_data=tidy_data[order(tidy_data$subject,tidy_data$activity),]
# Save Data
write.table(tidy_data, "tidy_data.txt", sep = ",")
