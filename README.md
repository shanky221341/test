## Working of R script to clean the data set for samsung galaxy mobiles

* Note: This script assumes that there is a folder named UCI HAR Dataset in the current working directory, otherewise the data set will have to be downloaded from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" and unzipped to curent working directory, only then this script will work. 

* Steps of working

1.First this script reads data set to the objects test and train for test and train data respectively.

by the following codes:-

       test<-read.table("./UCI HAR Dataset/test/X_test.txt")

       train<-read.table("./UCI HAR Dataset/train/X_train.txt")     

2. Then it reads subjects and activities for each subject to the objects subject_train and activity_train for train data set.

    subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")

    activity_train<-read.table("./UCI HAR Dataset/train/y_train.txt")


3. Next it adds activities of train data as a column set using
    
    z<-cbind(activity_train,train) 

4. Next it adds subjects of train to object z using 

    a<-cbind(subject_train,z)
    
    Now object a contains data set with its subject and its activity.

5. Then it reads subjects and activities for each subject to the objects subject_test and activity_test for test data set.

    activity_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
  
    subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")


6. Next it adds activities of test data as a column set using

    y<-cbind(activity_test,test)
    
    
7. 
