## Download and unzip data

if(!file.exists("./data")){dir.create("./data")}
temp <- tempfile()
fileurl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "./data/data.zip")
download.file(fileurl, temp)
unzip(temp, exdir = "./data")
unlink(temp)

### Build Test Data Frame
## Get subject row data
rawdata = read.table("./data/UCI HAR Dataset/test/subject_test.txt")
testdf = data.frame(subject = rawdata)
names(testdf) = "subject"

## Get subject test activity data and label them descriptively
rawdata = read.table("./data/UCI HAR Dataset/test/y_test.txt")
rawdata[1,] = as.numeric(rawdata[1,])
rawdata$V2[rawdata$V1 == 1] = "WALKING"
rawdata$V2[rawdata$V1 == 2] = "WALKING_UPSTAIRS"
rawdata$V2[rawdata$V1 == 3] = "WALKING_DOWNSTAIRS"
rawdata$V2[rawdata$V1 == 4] = "SITTING"
rawdata$V2[rawdata$V1 == 5] = "STANDING"
rawdata$V2[rawdata$V1 == 6] = "LAYING"

## Build one dataframe including Subjects and activities
testdf = cbind(testdf, rawdata)
names(testdf) = c("Subject", "Activity_code", "Activity")

## Load in activity values from the x_test file & name cols appropriately
rawdata = read.table("./data/UCI HAR Dataset/test/x_test.txt")
colnames = read.delim("./data/UCI HAR Dataset/features.txt", header = F)
names(rawdata) = colnames$V1
names(rawdata) = gsub("[[:digit:]]", "", names(rawdata) )
testdf = cbind(testdf, rawdata)


### Build train Data Frame
## Get subject row data
rawdata = read.table("./data/UCI HAR Dataset/train/subject_train.txt")
traindf = data.frame(subject = rawdata)
names(traindf) = "subject"

## Get subject train activity data and label them descriptively
rawdata = read.table("./data/UCI HAR Dataset/train/y_train.txt")
rawdata[1,] = as.numeric(rawdata[1,])
rawdata$V2[rawdata$V1 == 1] = "WALKING"
rawdata$V2[rawdata$V1 == 2] = "WALKING_UPSTAIRS"
rawdata$V2[rawdata$V1 == 3] = "WALKING_DOWNSTAIRS"
rawdata$V2[rawdata$V1 == 4] = "SITTING"
rawdata$V2[rawdata$V1 == 5] = "STANDING"
rawdata$V2[rawdata$V1 == 6] = "LAYING"

## Build one dataframe including Subjects and activities
traindf = cbind(traindf, rawdata)
names(traindf) = c("Subject", "Activity_code", "Activity")


## Load in activity values from the x_train file & name cols appropriately
rawdata = read.table("./data/UCI HAR Dataset/train/x_train.txt")
names(rawdata) = colnames$V1
names(rawdata) = gsub("[[:digit:]]", "", names(rawdata) )
traindf = cbind(traindf, rawdata)
names(traindf)
head(traindf)

## Merge test and train dataframes
mydata = rbind(testdf, traindf)

## Extract Only means and std dev
mydata1 = mydata[ , grepl("mean",names(mydata))]
mydata2 = mydata[,grepl("std",names(mydata) )]
mydata3 = mydata[, 1:3]
mydata4 = cbind(mydata3, mydata2, mydata1)
names(mydata4)
mydata = mydata4

## compute the average over each numeric column
mydata1 = aggregate(mydata[, c(4:82)], by = list(mydata[,1], mydata[,2]), mean)

mydata1$Subject = mydata1[,1]
mydata1$Activity_code = mydata1[,2]
mydata1$activity = mydata1[,2]
mydata1$activity[mydata1$activity == 1] = "WALKING"
mydata1$activity[mydata1$activity == 2] = "WALKING_UPSTAIRS"
mydata1$activity[mydata1$activity == 3] = "WALKING_DOWNSTAIRS"
mydata1$activity[mydata1$activity == 4] = "SITTING"
mydata1$activity[mydata1$activity == 5] = "STANDING"
mydata1$activity[mydata1$activity == 6] = "LAYING"

mydata1
mydata2 = mydata1[, c(82:84)]
mydata3 = mydata1[, c(3:81)]
finaldata = cbind( mydata2, mydata3)
finaldata
names(finaldata)

## Write tidy dataframe to disk
write.csv(finaldata, file = "./data/tidy.txt", row.names=FALSE)
data <- read.csv("./data/tidy.txt")
View(data)
