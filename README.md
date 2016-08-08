Getting and Cleaning Data - Course Project

This is the course project for the Getting and Cleaning Data Coursera course. The R script, Assignment_4.R, is divided in 5 sections:

1.Seperate Test User and Activity Data 
2.Clean Test mean and std 
3.Seperate TRAIN User and Activity Data 
4.Clean TRAIN mean and std 
5.Mean by User and Activity 

Code Section Description:

1.Seperate Test User and Activity Data 

Description: this section of the code unzip the subject_test.xlxs file and y_test.txt and add the data in the 
following datasets (subjects & activity), and each variable is rename in each data set with a descriptive name(Test Subjects & Activities)
Then it adds one variable called (ID) in order to merge the to datasets into one.
This new data set is called subject activities, the values of the variable name "activities" of this data set will be changed with the activities labels

Main R Functions used:

1.read.table
2.dplyr::rename
3.dplyr::merge
4.dplyr::mutate
5.NROW

2.Clean Test mean and std 

Description: this section of the code will unzip the X_test.txt and features.txt, and add each variable into the corresponding  data sets (mediciones,tipo_de_medicion), from the data set "tipo_de_medicion" we will put in a vector all the measure types.

Then It will clean the variable names in the R required format,it will subset with the required variables (mean & std)

Finally it will merge the subjects_activities data set with mediciones in order to have the test tidy data set "merged_test_data"

Main R Functions used:

1.read.table
2.as.vector
3.lenght
4.dplyr::gsub
5.names
6.merge
 

3.Seperate TRAIN User and Activity Data 

Description: this section of the code unzip the subject_train.xlxs file and y_train.txt and add the data in the 
following datasets (subjects & activity), and each variable is rename in each data set with a descriptive name(Test Subjects & Activities)
Then it adds one variable called (ID) in order to merge the to datasets into one.
This new data set is called subject activities, the values of the variable name "activities" of this data set will be changed with the activities labels
  
Main R Functions used:

1.read.table
2.dplyr::rename
3.dplyr::merge
4.dplyr::mutate
5.NROW

4.Clean TRAIN mean and std 

Description: this section of the code will unzip the X_train.txt and features.txt, and add each variable into the corresponding 
data sets (mediciones,tipo_de_medicion), from the data set "tipo_de_medicion" we will put in a vector all the measure types and then we will clean the variable names in the R required format,it will subset with the required variables (mean & std).
Finally it will merge the subjects_activities data set with mediciones in order to have the train tidy data set "merged_train_data"

#Main R Functions used:

1.read.table
2.as.vector
3.lenght
4.dplyr::gsub
5.names
6.merge

5.Mean by User and Activity 

Description: in this las section the "merged_train_data" and "merged_test_data" will be merged into the last required
tidy data set , it will be called "merged_test_data_by_user", it will have the foolowing characteristics:
It will contains independent tidy data set with the average of each variable for each activity and each subject


