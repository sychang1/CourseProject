# Read the raw data.
  
features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
datX_Test <- read.table("./UCI HAR Dataset/test/X_test.txt")
datX_Train <- read.table("./UCI HAR Dataset/train/X_train.txt")
datY_Test <- read.table("./UCI HAR Dataset/test/y_test.txt")
datY_Train <- read.table("./UCI HAR Dataset/train/y_train.txt")
datSubject_Test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
datSubject_Train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
