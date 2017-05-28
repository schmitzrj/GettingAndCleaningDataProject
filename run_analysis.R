## Loads the dplyr and tidyr packages
library(dplyr)
library(tidyr)

## Read the training and test data into memory and combine them, then remove the unneeded data
trainingData = read.table("./UCI HAR Dataset/train/X_train.txt")
testingData = read.table("./UCI HAR Dataset/test/X_test.txt")
observations = rbind(trainingData, testingData)
rm("trainingData")
rm("testingData")

## Read the file of column names to find and extract the mean and standard deviation columns
columns = read.table("./UCI HAR Dataset/features.txt")
columns = mutate(columns, meanOrStd = grepl("(mean\\(\\)|std\\(\\))", columns$V2))
measurements = observations[,columns[columns$meanOrStd == TRUE,1]]
rm("observations")

## Apply descriptive names to the columns
colnames(measurements) <- columns[columns$meanOrStd == TRUE, 2]
rm("columns")

## Add subject and activity values to the data set
subjectTraining = read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = c("subject"))
subjectTesting = read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = c("subject"))
subjectData = rbind(subjectTraining, subjectTesting)
rm("subjectTraining")
rm("subjectTesting")
activityTraining = read.table("./UCI HAR Dataset/train/y_train.txt", col.names = c("activityID"))
activityTesting = read.table("./UCI HAR Dataset/test/y_test.txt", col.names = c("activityID"))
activityData = rbind(activityTraining, activityTesting)
rm("activityTraining")
rm("activityTesting")
activityNames = read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("activityID", "activityName"))
activityData = left_join(activityData, activityNames, by = "activityID")
rm("activityNames")
measurements = cbind(subjectData, activityData$activityName, measurements)
colnames(measurements)[2] <- "activity"
rm("subjectData")
rm("activityData")

## create a tidy data set
tidyMeasurements <- measurements %>%
  gather(variable, value, -c(subject, activity)) %>%
  separate(variable, c("variable", "measure", "axis"), "-", fill = "right")
tidyMeasurements$measure = gsub("[()]", "", tidyMeasurements$measure)
tidyMeasurements <- tidyMeasurements %>%
  group_by(subject, activity, variable, measure, axis) %>%
  summarise(meanValue = mean(value)) %>%
  spread(measure, meanValue)
write.table(tidyMeasurements, "tidyMeasurements.txt", row.names = FALSE)
