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

Supplementary files of the zip-archive provide further information. The file feature_info.txt summarizes 
details on the measurements, units and the performed pre-processing. 

All values in the original data set are not modified by the R-skript.

Variable names in the data set are changed by the R-script into a more decscriptive fashion based on the
information provided in feature_info.txt. The script thereby replaces the following abbreviations in the 
original variable names by their free-text counter-parts, i.e."Acc" = Accelerometer, "Gyro" = Gyroscope,
"Mag" = Magnitude, "t" = time, "f" = frequency.