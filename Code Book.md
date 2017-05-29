## Code Book
### Getting and Cleaning Data Project
The project goals are as follows:
* Download data from the http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones site
* Prepare the data for analysis by recombining data from several files and reorganize it to a tidy format through code in the run_analysis.R files

### The tidy data set
This tidy data set exists in the tidyMeasurements.txt file with the following features:
* subject: indicates the number of the participant
* activity: indicates the action the subject was doing when positional measurements were taken
* variable: indicates the type of measurement that was being taken
* axis: the directional axis that along which the change of position was measured when available
* mean: the mean as provided over the previous columns, which was averaged to combine the train and test data sets
* std: the standard deviation as provided over the previous columns, which was averaged to combine the train and test data sets

The tidy data set has 5941 rows representing 561 measurements taken across 30 participants in 5 movements from the train and test data sets