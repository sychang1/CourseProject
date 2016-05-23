# 1). Merge the training and the test sets.

# Initial combination.
datY <- rbind(datY_Train, datY_Train)
datX <- rbind(datX_Train, datX_Train)
datSubject <- rbind(datSubject_Train, datSubject_Train)

# Rename the variables.
names(datX) <- features$V2
names(datY)[1] <- "Activity"
names(datSubject)[1] <- "Subject"

# Combine them all.
datMain_raw <- cbind(cbind(datSubject,datY),datX)

# 2). Extract only the measuremnts on the mean and standard deviation for each movement.

# Filter those that contain "mean()" or "std()" in the feature names.

datMain_pos <- grep("mean\\(\\)|std\\(\\)",features$V2)
datMain_pos <- c(1,2,datMain_pos+2)               # Add the first two columns and adjust for the shift.
datMain <- datMain_raw[,datMain_pos]

# 3). USe descriptive activity anmes to name the activities in the data set.
activity_temp <- as.character(activity_labels$V2[datMain$Activity])
datMain$Activity <- activity_temp 

# 4). Appropriately name the data set with descriptive variable names.
names(datMain) <- gsub("^t", "Time of ", names(datMain))
names(datMain) <- gsub("^f", "Frequency of ", names(datMain))
names(datMain) <- gsub("mean\\(\\)", "Mean", names(datMain))
names(datMain) <- gsub("std\\(\\)", "StandardDev.", names(datMain))

# 5). Create a second independent itidy data set with the average of each variable for each activity and each subject.
datTidy <- aggregate( . ~Subject + Activity, datMain, mean)
write.table(datTidy, file = "tidy_data.txt")

