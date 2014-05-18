cleandata<-function()
{
  
  test<-read.table("./UCI HAR Dataset/test/X_test.txt")

  train<-read.table("./UCI HAR Dataset/train/X_train.txt")

  subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")

  activity_train<-read.table("./UCI HAR Dataset/train/y_train.txt")

  z<-cbind(activity_train,train)
  
  a<-cbind(subject_train,z) #train data set with its subject and its activity
  
  activity_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
  
  subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
  
  y<-cbind(activity_test,test)
  
  
  
  b<-cbind(subject_test,y) #test data set with its subject and its activity
  c<-rbind(a,b) # Merged data of test and train
  
  c<-c[order(c[,1],c[,2]),]# ordered data according in ascending order of subject performing the acthivity
  
  features<-read.table("./UCI HAR Dataset/features.txt")
  features<-as.matrix(features)
  names(c)[3:563]<-features[1:561,2]
  kk<-c[,grep(c("mean"),colnames(c))]
  jj<-c[,grep(c("std"),colnames(c))]
  ll<-cbind(kk,jj)
  ll<-cbind(c[,2],ll)
  ll<-cbind(c[,1],ll) #data with only mean and standard deviation
  names(ll)[1]<-"subject"
  names(ll)[2]<-"activity"
  x=1
  de=NULL
  for(i in 1:30)# loop which calculates mean and std for each ctivity and each subject.
  {
    for(x in 1:6)
    {
      bc<-sapply(ll[which(ll$subject==i & ll$activity==x),],mean,na.rm=T)
      de<-rbind(de,bc)
    }
    
  }
  de<-as.data.frame(de)
  rownames(de)<-1:180
  #labelling activity with descriptive names
  de$activity[de$activity==1] <- "walking"
  de$activity[de$activity==2] <- "WALKING_UPSTAIRS"
  de$activity[de$activity==3] <- "WALKING_DOWNSTAIRS"
  de$activity[de$activity==4] <- "SITTING"
  de$activity[de$activity==5] <- "STANDING"
  de$activity[de$activity==6] <- "LAYING"
  
  names(de)<-tolower(names(de))
  names(de)<-gsub("-",replacement="",colnames(de))
  names(de)<-sapply(strsplit(names(de),"\\()"),paste,collapse="")
  names(de)<-gsub("tbody","timebody",names(de))
  names(de)<-gsub("fbody","frequencybody",names(de))
  names(de)<-gsub("tgravity","timegravity",names(de))
  names(de)<-gsub("tgravity","timegravity",names(de))
  names(de)<-gsub("x","xaxis",names(de))
  names(de)<-gsub("acc","acceleration",names(de))
  names(de)<-gsub("bodybody","body",names(de))
  names(de)<-gsub("z","zaxis",names(de))
  names(de)<-gsub("gyro","gyroscope",names(de))
  names(de)<-gsub("std","deviation",names(de))
  names(de)<-gsub("freq","frequency",names(de))
  names(de)<-gsub("ny","nyaxis",names(de))
  names(de)<-gsub("mag","magnitude",names(de))
  de
  
}
