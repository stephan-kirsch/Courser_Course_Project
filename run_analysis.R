##Set local folder, download file, unzip and change to unzipped folder
home_dir <- getwd()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","dataset.zip",method="curl")
unzip("dataset.zip")
setwd("UCI HAR Dataset")
library(dplyr)
library(stringr)
work_dir <- getwd()

##gather and make feature list more descriptive
feature_list <- read.table("features.txt")
header <- c("overall_id","subject_id","activity_label")
for (i in 1:561) {
  header <- c(header,as.character(feature_list[[i,2]]))
}

rem_Acc <- function(x) {str_replace(x,"Acc","Accelererometer")}
header <- sapply(header,rem_Acc)
rem_Gyro <- function(x) {str_replace(x,"Gyro","Gyroscope")}
header <- sapply(header,rem_Gyro)
rem_t <- function(x) {str_replace(x,"^t","time")}
header <- sapply(header,rem_t)
rem_f <- function(x) {str_replace(x,"^f","frequency")}
header <- sapply(header,rem_f)
rem_Mag <- function(x) {str_replace(x,"Mag","Magnitude")}
header <- sapply(header,rem_Mag)

##gather test files and build data table
setwd("test")
subjects_test <- read.table("subject_test.txt")
x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
test_set <- cbind(subjects_test,y_test,x_test)
rm(subjects_test,y_test,x_test)
setwd(work_dir)

##gather train files and build data table
setwd("train")
subjects_train <- read.table("subject_train.txt")
x_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
train_set <- cbind(subjects_train,y_train,x_train)
rm(subjects_train,y_train,x_train)
setwd(work_dir)

##combine both data sets
complete_dataset <- rbind(test_set,train_set)
complete_dataset <- cbind(1:10299,complete_dataset)
colnames(complete_dataset) <- header


## extract mean and std parameters and combinte to data subset
selectMeans <- function(x){as.logical(sum(grep("mean()",x)))}
mean_col <- sapply(header, selectMeans, USE.NAMES = FALSE)
parameter_means <- complete_dataset[,mean_col]

selectStds <- function(x){as.logical(sum(grep("std()",x)))}
std_col <- sapply(header, selectStds, USE.NAMES = FALSE)
parameter_stds <- complete_dataset[,std_col]

means_and_std <- cbind(complete_dataset[1:3],parameter_means, parameter_stds)

##calculate averages per subject and activity
summary <- c(rep(0,81))
for (i in 1:30){
  subset <- filter(means_and_std[,1:81], subject_id==i)
  for (j in 1:6){
    summary <- rbind(summary,sapply(filter(subset, activity_label==j),mean)) 
  }
}
summary <- summary[2:181,]
summary <- summary[,2:81]
summary <- as.data.frame(summary,row.names = "")

##exchange activity lables with description
activity <- read.table("activity_labels.txt")
descrActivity <- function(x){activity[x,2]}
complete_dataset$activity_label <- sapply(complete_dataset$activity_label,descrActivity)
means_and_std$activity_label <- sapply(means_and_std$activity_label,descrActivity)
summary$activity_label <- sapply(summary$activity_label,descrActivity)

##exporting data
write.table(complete_dataset, file.path(home_dir, "complete_dataset.txt"))
write.table(means_and_std, file.path(home_dir, "extracted_means_and_stds.txt"))
write.table(summary, file.path(home_dir, "summarized_means_and_stds.txt"))

setwd(home_dir)

