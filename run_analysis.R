
# first we load the training data set into trainset variable

trainset <- read.table("./1/train/x_train.txt")

# second we load the test data set into testset variable

testset <- read.table("./1/test/x_test.txt")

# third step we merge the two data set by using rbind and store the result in alldataset variable 


alldataset <- rbind(testset,trainset)

#this dataset will complete requirement 1 


#then we read the column names stored in feature.txt , transform it to a vector , and set the name of columns of alldataset

labelsset <- read.table("./1/features.txt")
labelssetvector <- as.vector(labelsset$V2)

names(alldataset) <- labelssetvector

# now we need to subset only columns that have STD and mean in its label using Gerpl function and regular expression
# we store the subset into meanAndstd 
meanAndstd <- alldataset[,grepl("mean|std",names(alldataset))]
# this data set will complete requirement 2 of this assignment

# now we need to combine the activity class labels of training and test data sets into one 
# We will also name the activity column to a meaning ful name to use it later

activityClassTraining <- read.table("./1/train/y_train.txt")
activityClassTest <- read.table("./1/test/y_test.txt")

activityClassAll <- rbind(activityClassTest,activityClassTraining)
names(activityClassAll) <- c("Activity_ID")
# after that we need to combine it to our mean and avg dataset using cbind

meanAndstd <- cbind(meanAndstd,activityClassAll)

# this data set will complete requirement 3 of this assignment

# now we need to load activity as character and merge it to our data set to create readable text of activityClassAll
activityText <- read.table("./1/activity_labels.txt")

# we will name the two columns as Activity_ID, and Activity_Desc
names(activityText) <- c("Activity_ID","Activity_Desc")

## we will merge the two data set using MErge command with common column Activity_ID
Finalset <- merge(meanAndstd,activityText,by.x = "Activity_ID",by.y="Activity_ID",all = TRUE)

## Finalset Complete the requirement number 4 of this assignment

## now we need to add subject as a column in the data set to create summary 
SubjectsTest <- read.table("./1/test/subject_test.txt")
SubjectsTrain <- read.table("./1/train/subject_train.txt")
SubjectsAll <- rbind(SubjectsTest,SubjectsTrain)

names(SubjectsAll) <- c("Subject_ID")

## now we can merge the subject column to the dataset since it is on the same order using cbind

Finalset <- cbind(Finalset,SubjectsAll)

# copy Finalset to Finalset2 

Finalset2 <- Finalset

# using melt to collapse by subjectid and activityID
Finalset2 <- melt(Finalset2, id=c("Subject_ID","Activity_Desc"))
Finalset2 <- dcast(Finalset2, Subject_ID+Activity_Desc ~ variable, mean)




