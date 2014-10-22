tidydataset
===========

This is a project for Cousera. Getting and Cleaning Date

In this repo, the code has been stored in the run_analysis.R file. The raw data are also prsented here. When you are tring to run the source code in R, make sure that you put all the data and the code file in the working directory (You can use the getwd() function), then type:

        source("run_analysis.R")
        
Then the tidy data set will be in the global environment. If you want to output it, then type:

        write.table(tidydataset, file = "tidydataset.txt",row.name = FALSE)
        
A text file called "tidydataset.txt" will be created in the working directory.

<<<<<<< HEAD
**# Part I #**
=======

Part I
>>>>>>> origin/master

Now I'll be give a brief introduction of the raw data in the first part.

The data are generated form a set of experiments. You can read the following details if you are interested.
> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


--X_train.txt :  there are 7352 observations and 561 variables.

--X_test.txt:  there are 2947 observations and 561 variables.

--y_train/test.txt: there are exact the same number of observations in accordance with  X_train/test respectively. The value of the y_train/test range from 1 to 6 with each number indicating different kinds of activities: 
<<<<<<< HEAD

*1 WALKING*

*2 WALKING_UPSTAIRS*

*3 WALKING_DOWNSTAIRS*

*4 SITTING*

*5 STANDING*

*6 LAYING*
=======
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING
>>>>>>> origin/master

--Subject_train/test.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

--features.txt: Actually, this file stores all the variable names of the X_train/test. But be careful, when you use the read.table() function to read it, only the 2end column is useful.

<<<<<<< HEAD
**# Part II #**

In this part, I will present the pipeline for processing the data.

Here is an image for how to put the raw data together from David Hood.



=======

Part II
>>>>>>> origin/master

In this part, I will present the pipeline for processing the data.

    
