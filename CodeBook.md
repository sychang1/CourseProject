#Code Book for the "Getting and Cleaning Data" Course Project.

run0.R
------

* Reads in the raw data.
* The variable names preserve the file names of the raw data with minor modifications.

run_analysis.R
--------------

* Step by step transformation of the raw data sets.
* Merge the training and the test sets. Also merge the activity and subject vectors. Variable "datMain_raw".
* Extract only the measuremnts on the mean and standard deviation for each movement. Variable "datMain".
* Use easier to understand names for the variables: prefix "t" -> "Time of", prefix "f" -> "Frequency of", etc.
* Create a tidy data "datTidy" by aggregating in terms of "Subject" and "Acitivity" and applying the function mean.
* Save the final result as "tidy_data.txt".
