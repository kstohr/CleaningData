---
title: "README.md"
author: "Kate Stohr"
date: "January 25, 2015"
---


Instructions for project
------------------------

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
 
Here are the data for the project: 
 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
 
You should create one R script called run_analysis.R that does the following. 
 
 1. **DONE** Merges the training and the test sets to create one data set.
 2. **DONE** Extracts only the measurements on the mean and standard deviation for each measurement.
 3. **DONE** Uses descriptive activity names to name the activities in the data set.
 4. **DONE** Appropriately labels the data set with descriptive activity names.
 5. **DONE** Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Preliminaries
-------------

Load packages.

```{r}
packages <- c("data.table", "dplyr", "downloader" , "plyr")   
sapply(packages, require, character.only=TRUE, quietly=TRUE)
```

Set path.
Note: I've also stored the original path, to easily reset the path later in the script to allow output files to be saved in the original working directory. 


```{r}
 originalwd<-getwd()
 path <- file.path(getwd(), "data")
```

Get the data
------------

Download the file. Put it in the `Data` folder. Record the date it was downloaded.

```{r}
        message("Downloading file, this may take some time.")
        url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        f <- "Dataset.zip"
        if (!file.exists(path)) {dir.create(path)}
        download.file(url, file.path(path, f), method="curl", quiet=TRUE)
        dateDownloaded <- date()
```

Gets the file list from the zipfile and unzip it. 

```{r}
    zipfile<-file.path(getwd(), "data/Dataset.zip")
        file_names <- unzip(zipfile, list=TRUE)$Name
        unzip(zipfile, exdir=path)
        setwd(path)
        message("Data file successfully downloaded and unzipped. Your data is stored here:")
        print(path)
```

*Read the read.me file to understand where the data is stored*

This code reads the data in to R for the needed files. Using "stringsAsFactors=FALSE" prevents character vectors from being converted to factors, allowing the labels to be extracted more easily.

```{r}
        subject_test<-read.table(file_names[16])
        x_test<-read.table(file_names[17])
        y_test<-read.table(file_names[18])
        subject_train<-read.table(file_names[30])
        x_train<-read.table(file_names[31])
        y_train<-read.table(file_names[32])
        features<-read.table(file_names[2], stringsAsFactors=FALSE)
        activities<-read.table(file_names[1], stringsAsFactors=FALSE)
```

Now that the data from each file is stored in a discreet dataframe, you can begin to manipulate it using dplyr. 

Clean the data
--------------

Add a "dataType" column to each "x" data table. This allows the two sets to be merged while identifying which observations belong to each set. 
```{r}
        x_test<-mutate (x_test, dataType = "test")
        x_train<-mutate (x_train, dataType = "train")
```

Combine the "test" data set with the "train" data set. 
Store the data type information in a new variable "data_type" to allow that column to be added to the final tidy data set later. 

```{r}
       dt<- rbind(x_test, x_train)
       data_type<-select(dt, dataType)
```

Add the variable names to the combined data set, "dt" 

```{r}
        dt_temp<-select (dt, V1:V561)
        feature_names <- as.vector(features[ ,2])
        feature_names <- make.names(feature_names, unique=TRUE)
        names(dt_temp)<-feature_names
```


Extract only the columns that contain values on the mean and standard deviation for each measurement. 
 
```{r}
     dt_temp<-select(dt_temp, contains("mean"), contains ("std"))
```

Combine the activity label datasets. 

```{r}
     all_labels<-rbind (y_test, y_train)
     setnames (all_labels, "V1", "activityNum")
```

Grab the activity file and rename the columns. 
Convert activity numbers to names using merge. 

```{r}
        setnames(activities, names(activities), c("activityNum", "activityName"))
        label_names<-merge(all_labels, activities, by="activityNum", all.x=TRUE)
        all_labels <- select(label_names, activityName)
```

Combine the subject id files.

```{r}
     all_subject<-rbind(subject_test, subject_train)
     setnames (all_subject, "V1", "subjectID")
```

Add the subjectID, activityName, and dataType back to the dataset

```{r}
      tidy_dt<- cbind(all_subject, all_labels, data_type, dt_temp)
```

Now you have a tidy data set, Each variable is a column, each observation is a row, and each type of observational unit is a table. 

*Note: The data could be made "tall" by seperating the "t" and "f" factors, the "x", "y", "z" factors etc using grep with melt.  However, it was not required by the assignment which specified that the data should meet week 1 standards.* 

Create a new tidy dataset. 
--------------------------
Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

```{r}
       newtidy_dt <-
                tidy_dt %>%
                group_by (subjectID, activityName, dataType) %>%
                summarise_each(funs(mean))
```

Write the new data set to a seperate file in the user's working directory. 

```{r}
setwd(originalwd)
write.table (newtidy_dt, file="new_tidy_data.txt", row.names=FALSE, col.names=TRUE)
print (file.path(originalwd, "new_tidy_data.txt"))
message ("To view the file, use read.table with header=TRUE, stringsAsFactors=FALSE")
```

Create revised codebook and README files. 
-------------------------

The codebook is available in the directory with the new table. 
It is called, "CodeBook.md"

A markup file of the script describing the steps taken to download, tidy and summarize the file is called, "README.md"
