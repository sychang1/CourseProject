#Code Book for the "Getting and Cleaning Data" Course Project.

run0.R
------

* Reads in the raw data.
* The variable names preserve the file names of the raw data with minor modifications.

run_analysis.R
--------------

* Step by step transformation of the raw data sets.
1. Merge the training and the test sets. Also merge the activity and subject vectors.
   -> variable "datMain_raw".
2. Extract only the measuremnts on the mean and standard deviation for each movement.
   -> variable "datMain".

3. Use more easy to understand names for the variables.


# 4). Appropriately name the data set with descriptive variable names.
names(datMain) <- gsub("^t", "Time of ", names(datMain))
names(datMain) <- gsub("^f", "Frequency of ", names(datMain))
names(datMain) <- gsub("mean\\(\\)", "Mean", names(datMain))
names(datMain) <- gsub("std\\(\\)", "StandardDev.", names(datMain))

# 5). Create a second independent itidy data set with the average of each variable for each activity and each subject.
datTidy <- aggregate( . ~Subject + Activity, datMain, mean)
write.table(datTidy, file = "tidy_data.txt")