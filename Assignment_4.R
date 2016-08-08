experiment <- function(){
  library(dplyr)
  library(xlsx) 
  library(reshape2)
  library(openxlsx)

#***************************************TEST FILES BEGIN*******************************************************  

  #///////////////////////////////Seperate Test User and Activity Data Begin////////////////  
  #+++++++++++++++++++++#
  #Description: this section of the code unzip the subject_test.xlxs file and y_test.txt and add the data in the 
  #following datasets (subjects & activity), and each variable is rename in each data set with a descriptive name(Test Subjects & Activities)
  #Then it adds one variable called (ID) in order to merge the to datasets into one.
  # This new data set is called subject activities, the values of the variable name "activities" of this data set will be changed
  # with the activities labels
  #Main R Functions used:
  #read.table,dplyr::rename,dplyr::merge,dplyr::mutate,NROW
  #+++++++++++++++++++++#
  
  
  
  subjects<- read.table("subject_test.txt")
  
  activity<- read.table("y_test.txt")
  
  subjects <- dplyr::rename(subjects,Test_Subjects = V1)
  
  activity <- dplyr::rename(activity,Activities = V1)
  
  n = NROW(subjects)
  
  subjects$ID <- c(1:n)
  activity$ID <- c(1:n)
  
  subjects_activities <- merge(subjects,activity,by.subjects = "ID",by.activity = "ID")
  
  subjects_activities <- mutate(subjects_activities, Activities = ifelse(Activities==1,"WALKING",
                                                                         ifelse(Activities==2,"WALKING_UPSTAIRS",
                                                                                ifelse(Activities==3,"WALKING_DOWNSTAIRS",
                                                                                       ifelse(Activities==4,"SITTING",
                                                                                              ifelse(Activities==5,"STANDING","LAYING"))))))
    
    
  #///////////////////////////////Seperate Test User and Activity End////////////////   
  
  #///////////////////////////////Clean Test mean and std Begin////////////////////// 
  
  #+++++++++++++++++++++#
  #Description: this section of the code will unzip the X_test.txt and features.txt, and add each variable into the corresponding 
  # data sets (mediciones,tipo_de_medicion), from the data set "tipo_de_medicion" we will put in a vector all the measure types
  # and then we will clean the variable names in the R required format,it will subset with the required variables (mean & std),
  # finally it will merge the subjects_activities data set with mediciones in order to have the test tidy data set "merged_test_data"
  #Main R Functions used:
  #read.table,as.vector,lenght,dplyr::gsub,names,merge
  #+++++++++++++++++++++#
  
  
  mediciones <- read.table("X_test.txt")
  tipo_de_medicion <- read.table("features.txt")
  
  vector_tipo_de_medicion <- as.vector(tipo_de_medicion[,2])
  
  n=length(vector_tipo_de_medicion)
  
  for (i in 1:n) {
    
    Vnew = vector_tipo_de_medicion[i]
    Vnew = gsub(Vnew,pattern = "\\-",replacement = ".")
    Vnew = gsub(Vnew,pattern = "\\()",replacement = "")
    Vnew = gsub(Vnew,pattern = "\\,",replacement = ".")
    Vnew = paste(Vnew,i,sep=".")
    names(mediciones)[i] <- paste(Vnew)
  }
  
  
  y = (NROW(mediciones))
  
  
  mediciones$ID <- c(1:y)
  
  
  mediciones = dplyr::select(mediciones,matches("ID|mean|std"))
  
  
  merged_test_data = merge(subjects_activities,mediciones,by.subjects_activities = "ID", by.mediciones = "ID")
  
  openxlsx::write.xlsx(merged_test_data,file = ("Merged_tidy_file_test.xlsx"))
  
  #///////////////////////////////Clean Test mean and std End////////////////////// 
  #***************************************TEST FILES FINISHED*******************************************************
  
  
  
  #==========================================TRAIN FILES BEGIN==========================================================
  
  #///////////////////////////////Seperate TRAIN User and Activity Data Begin////////////////  
  
  #+++++++++++++++++++++#
  #Description: this section of the code unzip the subject_train.xlxs file and y_train.txt and add the data in the 
  #following datasets (subjects & activity), and each variable is rename in each data set with a descriptive name(Test Subjects & Activities)
  #Then it adds one variable called (ID) in order to merge the to datasets into one.
  #This new data set is called subject activities, the values of the variable name "activities" of this data set will be changed
  #with the activities labels
  
  #Main R Functions used:
  #read.table,dplyr::rename,dplyr::merge,dplyr::mutate,NROW
  #+++++++++++++++++++++#
  
  subjects<- read.table("subject_train.txt")
  
  activity<- read.table("y_train.txt")
  
  subjects <- dplyr::rename(subjects,Test_Subjects = V1)
  
  activity <- dplyr::rename(activity,Activities = V1)
  
  n = NROW(subjects)
  
  subjects$ID <- c(1:n)
  activity$ID <- c(1:n)
  
  subjects_activities <- merge(subjects,activity,by.subjects = "ID",by.activity = "ID")
  
  subjects_activities <- mutate(subjects_activities, Activities = ifelse(Activities==1,"WALKING",
                                                                         ifelse(Activities==2,"WALKING_UPSTAIRS",
                                                                                ifelse(Activities==3,"WALKING_DOWNSTAIRS",
                                                                                       ifelse(Activities==4,"SITTING",
                                                                                              ifelse(Activities==5,"STANDING","LAYING"))))))
  
  
  #///////////////////////////////Seperate TRAIN User and Activity End////////////////   
  
  #///////////////////////////////Clean TRAIN mean and std Begin////////////////////// 
  
  #+++++++++++++++++++++#
  #Description: this section of the code will unzip the X_train.txt and features.txt, and add each variable into the corresponding 
  # data sets (mediciones,tipo_de_medicion), from the data set "tipo_de_medicion" we will put in a vector all the measure types
  # and then we will clean the variable names in the R required format,it will subset with the required variables (mean & std),
  # finally it will merge the subjects_activities data set with mediciones in order to have the train tidy data set "merged_train_data".
  #Main R Functions used:
  #read.table,as.vector,lenght,dplyr::gsub,names,merge
  #+++++++++++++++++++++#
  
  mediciones <- read.table("X_train.txt")
  tipo_de_medicion <- read.table("features.txt")
  
  vector_tipo_de_medicion <- as.vector(tipo_de_medicion[,2])
  
  n=length(vector_tipo_de_medicion)
  
  for (i in 1:n) {
    
    Vnew = vector_tipo_de_medicion[i]
    Vnew = gsub(Vnew,pattern = "\\-",replacement = ".")
    Vnew = gsub(Vnew,pattern = "\\()",replacement = "")
    Vnew = gsub(Vnew,pattern = "\\,",replacement = ".")
    Vnew = paste(Vnew,i,sep=".")
    names(mediciones)[i] <- paste(Vnew)
  }
  
  
  y = (NROW(mediciones))
  
  
  mediciones$ID <- c(1:y)
  
  
  mediciones = dplyr::select(mediciones,matches("ID|mean|std"))
  
  
  merged_train_data = merge(subjects_activities,mediciones,by.subjects_activities = "ID", by.mediciones = "ID")
  
  openxlsx::write.xlsx(merged_train_data,file = ("Merged_tidy_file_train.xlsx"))
  
  #///////////////////////////////Clean TRAIN mean and std End////////////////////// 
  
  #==========================================TRAIN FILES FINISHED=======================================================


  
  
  #///////////////////////////////Mean by User and Activity Begin /////////////////
  
  #+++++++++++++++++++++#
  #Description: in this las section the "merged_train_data" and "merged_test_data" will be merged into the last required
  # tidy data set , it will be called "merged_test_data_by_user", it will have the foolowing characteristics:
  # It will contains independent tidy data set with the average of each variable for each activity and each subject
  #+++++++++++++++++++++#
  
  
  
  merged_train_test_data = rbind(merged_test_data,merged_train_data)
  merged_train_test_data$ID <- NULL
  
  merged_test_data_by_user = ddply(merged_train_test_data,.(Test_Subjects,Activities),colwise(mean))
  
  #openxlsx::write.xlsx(head(merged_train_test_data,5),file = ("merged_train_test_data.xlsx"))
  openxlsx::write.xlsx(merged_test_data_by_user,file = ("Mean_by_use_by_activity.xlsx"))
  
  #///////////////////////////////Mean by User and Activity End ///////////////// 
  
  
}####Function end

