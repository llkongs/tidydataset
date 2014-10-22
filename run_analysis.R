
# 1. Read all the needed file to R
x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
x_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
sub_test <- read.table("subject_test.txt")
sub_train <- read.table("subject_train.txt")
feature <- read.table("features.txt")

#2.Bind all the data to form a dataset, and use the feature to name the columns.
testdat <- cbind(x_test,y_test,sub_test)
traindat <- cbind(x_train, y_train,sub_train)
dataset <- rbind(testdat, traindat)
colnames(dataset)[1:561] <- as.character(feature[,2])
colnames(dataset)[562] <- "Activity"
colnames(dataset)[563] <- "Subject"

#3.Select all the columns with a "mean()" or "std()" expression in its column name.
colindex1 <- grep("mean\\(\\)", colnames(dataset))
colindex2 <- grep("std\\(\\)", colnames(dataset))
dataset1 <- dataset[,c(colindex1,colindex2,562,563)]

#4.Uses descriptive activity names to name the activities in the data set.
dataset1$Activity[which(dataset1$Activity == 1)] <- "Walking"
dataset1$Activity[which(dataset1$Activity == 2)] <- "Walking_Upstairs"
dataset1$Activity[which(dataset1$Activity == 3)] <- "Walking_Downstairs"
dataset1$Activity[which(dataset1$Activity == 4)] <- "Sitting"
dataset1$Activity[which(dataset1$Activity == 5)] <- "Standing"
dataset1$Activity[which(dataset1$Activity == 6)] <- "Laying"

#5.Creates a second, independent tidy data set with the average of each variable
# for each activity and each subject.
mean1 <- colMeans(dataset1[dataset1$Activity == "Walking",][1:66])
mean2 <- colMeans(dataset1[dataset1$Activity == "Walking_Upstairs",][1:66])
mean3 <- colMeans(dataset1[dataset1$Activity == "Walking_Downstairs",][1:66])
mean4 <- colMeans(dataset1[dataset1$Activity == "Sitting",][1:66])
mean5 <- colMeans(dataset1[dataset1$Activity == "Standing",][1:66])
mean6 <- colMeans(dataset1[dataset1$Activity == "Laying",][1:66])
Activitymean <- as.data.frame(rbind(mean1,mean2,mean3,mean4,mean5,mean6))
rownames(Activitymean) <- c("Walking","Walking_Upstairs","Walking_Downstairs",
                            "Sitting","Standing","Laying")

                  
                  
#This is a function to calculate the groupmean of each subject                 
groupmean <- function(data, group = "Subject", span = 1:66) {
        grps <- unique(data[,group])
        grpsmean <- colMeans(data[data[,group] == grps[1],][span])
        for(i in 2:length(grps)){
                grpsmean <- rbind(grpsmean,colMeans(data[data[,group] == grps[i]
                                                         ,][span]))
        }
        rownames(grpsmean) <- paste(group,"_", grps,sep = "")
        grpsmean <- grpsmean[order(grps), ]
        as.data.frame(grpsmean)
}

Subjectmean <- groupmean(dataset1)

#This is the final tidy data set required.
tidydataset <- rbind(Activitymean,Subjectmean)
tidydataset$ActivityorSubject <- rownames(tidydataset)
message("Now the tidy data set required has been created, type tidydataset
        to see it")