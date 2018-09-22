This codebook describe how to get the final output of cleaning and organizing Data

The data were downloaded from below link 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

on 2018-09-22 20:00 GMT

All Columns Labels can be found in features.txt in the orginal datasets files.
All Explanation of each column label is explained in features_info.txt

additional info can be found on the link below
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


To perform the analysis we first need to do the following

1-  we load the training data set into trainset variable
2- we load the test data set into testset variable
3-   step we merge the two data set by using rbind and store the result in alldataset variable 
4- we read the column names stored in feature.txt , transform it to a vector , and set the name of columns of alldataset
5- we need to subset only columns that have STD and mean in its label using Gerpl function and regular expression
 we store the subset into meanAndstd 
6- we need to combine the activity class labels of training and test data sets into one 
 We will also name the activity column to a meaning ful name "Activity_ID" to use it later
7-after that we need to combine it to our mean and avg dataset using cbind
8- now we need to load activity as character and merge it to our data set to create readable text of activityClassAll
9 we will name the two columns as Activity_ID, and Activity_Desc
10- we will merge the two data set using MErge command with common column Activity_ID
11-  we need to add subject as a column in the data set to create summary 
12- now we can merge the subject column to the dataset since it is on the same order using cbind
13 copy Finalset to Finalset2 
14- using melt to collapse by subjectid and activityID
15- Export The two datasets

