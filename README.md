Read Me
========================================================
Human Activity Recognition Using Smartphones Tidy Dataset
Version 1.0
=================================================================
Fahiz Mohammed Baba Yara
Student: Norwegian School of Economics
www.babbayara.com
==================================================================

The experiment was carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope,the study captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded to label the data manually. Original data is in the data.zip file.

========================================================================
The dataset includes the following files:
=========================================

- 'README.txt'

- 'CodeBook.md': A description of the variables in the dataset.

- 'tidydataset.csv': Contains the clean data.

- 'run_analysis.R': An R script that cleans up the datasets in data.zip

- 'data.zip': Data from the original data downloaded by the script


Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each subject observation is a row on the text file.

R Script Description
====================
- The R script downloads the orginal dataset.
- Unzips the data.
- Loads the required datasets.
- Labels the variables with descriptive names.
- Labels the activities with descriptive names.
- Computes averages for mean and standard deviation values
- Saves the tidy data set to disk

For more information about the original dataset contact: activityrecognition@smartlab.ws

Original License:
=================
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
