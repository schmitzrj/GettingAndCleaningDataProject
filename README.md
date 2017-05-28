## run_analysis.R
### The R script does the following

1. Loads the X_train.txt and X_test.txt files and merges them into one table
2. Adds column names to the table from the features.txt files
3. Loads the subject_train.txt and subject_test.txt files and merges them into one table
4. Loads the y_train.txt and y_test.txt files, merges them into one table, and adds the value descriptors from activity_labels.txt as a new column
5. Merges the subject, X and y data tables into one table
6. Cleans the data set by pivoting columns into rows
7. Cleans the data set by separating descriptive data into new columns
8. Cleans the data set by removing unwanted parentheses
9. Cleans the data set by grouping the numeric values by the other columns
10. Cleans the data set by producing an average of the numeric values
11. Cleans the data set by separating the mean and std values into their own columns
12. Outputting the end data file

## tidyMeasurements.txt Code Book
##### This data is a summarization of data obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
##### The data was originally broken into files that separated the subject, activity, and measurement data, which this effort attempts to recombine them and merge the train and test data sets together
##### Only the mean and standard deviation data were extacted for each measurement feature to obtain an average of the mean and standard deviation per subject and feature.
##### Because each feature contained several bits of information concatenated together, these elements were separated into columns.
##### The data columns are as follows:
1. subject: the number of the participant in the study
2. activity: the action being performed by the participant at the time of measurement
3. variable: the feature that was being measured by sensors in the positioning device
4. axis: the axis whereon positional change was recorded. Some variables did not contain an axis and are thus listed as <NA>.
5. mean: the average of the mean value in the original data set across the first four columns
6. std: the average of the standard deviation value in the original data set across the first four columns
