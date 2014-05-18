## Working of R script to clean the data set for samsung galaxy mobiles

* Note: This script assumes that there is a folder named UCI HAR Dataset in the current working directory, otherewise the data set will have to be downloaded from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" and unzipped to curent working directory, only then this script will work. 

* Steps of working

 1. First this script reads data set to the objects test and train for test and train data respectively.

by the following codes:-

       test<-read.table("./UCI HAR Dataset/test/X_test.txt")

       train<-read.table("./UCI HAR Dataset/train/X_train.txt")     

2. Then it reads subjects and activities for each subject to the objects subject_train and activity_train for train data set:-

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
    
    
7. Next it adds subjects of test to object y using

   b<-cbind(subject_test,y)
   
   
8. To get the single block of train and test data following code is used in which subjects and activities are ordered.

  c<-rbind(a,b) # Merged data of test and train
  
  c<-c[order(c[,1],c[,2]),] 
 
9. Then features or variables are read.

   features<-read.table("./UCI HAR Dataset/features.txt")
   features<-as.matrix(features)
   features was converted to matrix form for coersion other wise names were being read as integers.
   
10. Then change the names for variables using

    names(c)[3:563]<-features[1:561,2]

11. This completes the first step

12. Then  filter the data set which is in obeject c to get only variables with mean and standard deviation

     kk<-c[,grep(c("mean"),colnames(c))]
     jj<-c[,grep(c("std"),colnames(c))]
     
13.  Then following code gives the combined obove two sets which has 81 columns.
     
     ll<-cbind(kk,jj)
     ll<-cbind(c[,2],ll)
     ll<-cbind(c[,1],ll)
     
14.  Now object contains data with mean and deviation only.

15.  Name the first and second columns 

     names(ll)[1]<-"subject"
     names(ll)[2]<-"activity"
     
16. Then the following code  gives the data set in object de which has 180 rows that means 6 activies each for 30 subjects and total of 81 columns for mean and deviation including colomns for suject and activity.

17. x=1
  de=NULL
  for(i in 1:30)# loop which calculates mean and std for each ctivity and each subject.
  {
    for(x in 1:6)
    {
      bc<-sapply(ll[which(ll$subject==i & ll$activity==x),],mean,na.rm=T)
      de<-rbind(de,bc)
    }
    
  }

In the aabove code two loops are used and which fucntion is used to find the columns with subject i and activities x.
sapply is used to find the mean.
Initialy de has been initiallizd to NULL . After each iteration we get on row for one subect and one activity which is then combined with other row in next iteration. Therefore we obtain total of 180 rows.

18. Then de is corced to data frame and rows are numbered

    de<-as.data.frame(de) 
    rownames(de)<-1:180

19. Then to get a more tidy data for better and easy analysis labeleings are done to easily understand what they mean.

20. Firstly, the activities are named.
    
    de$activity[de$activity==1] <- "walking"
    de$activity[de$activity==2] <- "WALKING_UPSTAIRS"
    de$activity[de$activity==3] <- "WALKING_DOWNSTAIRS"
    de$activity[de$activity==4] <- "SITTING"
    de$activity[de$activity==5] <- "STANDING"
    de$activity[de$activity==6] <- "LAYING"

21. Since the variables names should not be in upper case hence they are coverted to lower case.
     
     names(de)<-tolower(names(de))
     
22. 

