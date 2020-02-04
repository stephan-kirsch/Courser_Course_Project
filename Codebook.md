======================================================================================================
Course Project "Getting and Cleaning data"
Stephan K.
======================================================================================================

This R script was compiled as part of the Coursera Course "Getting and Cleaning Data". It accesses 
and downloads a data set on Human Activity Recognition Using Smartphones Dataset (Version 1.0) compiled 
by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto from the 
Smartlab - Non Linear Complex Systems Laboratory

The data set can also be accessed here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The R-script run_analysis.R downloads the data set and processes it in the following steps
All steps are indicated by comments lines in the R code

1. Unzip the file and create a subdirectory (if already done, please change code to comment)
2. Read the list of variables/ features and change titles into a more descriptive format 
3. Read and merge training and test data sets, add subject and activity labels
4. Changes activity labels into activity descriptions
5. Extracts the variables that represent means and standard variations of the meaured parameters
6. Determines the average values per subject and activity
7. Exports 3 test files, containing the processed datasets obtained by steps 4., 5., and 6.


To access and further analyze the differently processed data in R, use the following commands

1. complete_dataset: 10299x564 data frame containing the combined test and trainings set
2. means_and_std: 10299x82 data frame containing all mean or std variables of the complete data set
3. summary: 180x80 data frame containing data from means_and_std where every line represents the mean of every variable for all possible subject/activity type combinations





