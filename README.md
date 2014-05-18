## Working of R script to clean the data set for samsung galaxy mobiles

* Note: This script assumes that there is a folder named UCI HAR Dataset in the current working directory, otherewise the data set will have to be downloaded from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" and unzipped to curent working directory, only then this script will work. 

* Steps of working

1. This script reads file to the objects test and train for test and train data respectively from my current working directory.

2. Then it reads subjects and activities for each subject to the objects subject_train and activity_train for train data set.

3. Next it adds activities of train data set using z<-cbind(activity_train,train) 

4. Next it adds subjects of train to object z using a<-cbind(subject_train,z)

5. Further  it adds activities of train data set using z<-cbind(activity_train,train)

6. 
