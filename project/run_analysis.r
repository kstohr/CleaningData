#' ---
#' title: "run_analysis.rmd"
#' author: "Kate Stohr"
#' date: "January 25, 2015"
#' output: md_document
#' ---


run_analysis <- function(){
        
        #' load the necessary packages 
        #+
        packages <- c("data.table", "dplyr", "downloader")   
        sapply(packages, require, character.only=TRUE, quietly=TRUE)
        
        #' define working directory
        #+
        originalwd<-getwd()
        path <- file.path(getwd(), "data")
        
        #'download file and create data directory
        #+
        message("Downloading file, this may take some time.")
        url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        f <- "Dataset.zip"
        if (!file.exists(path)) {dir.create(path)}
        download.file(url, file.path(path, f), method="curl", quiet=TRUE)
        #' records the date the file was downloaded
        dateDownloaded <- date()
        
        #' gets the file list and unzips the file
        #+
        zipfile<-file.path(getwd(), "data/Dataset.zip")
        file_names <- unzip(zipfile, list=TRUE)$Name
        unzip(zipfile, exdir=path)
        setwd(path)
        message("Data file successfully downloaded and unzipped. Your data is stored here:")
        print(path)
        
        
        
        #' read the read.me file to understand where the data is stored
        #' reads the data in to R for the needed files 
        #'  "stringsAsFactors=FALSE" prevents character vectors from being 
        #'  converted to factors, allowing the data to be extracted more easily.
        #+
        subject_test<-read.table(file_names[16])
        x_test<-read.table(file_names[17])
        y_test<-read.table(file_names[18])
        subject_train<-read.table(file_names[30])
        x_train<-read.table(file_names[31])
        y_train<-read.table(file_names[32])
        features<-read.table(file_names[2], stringsAsFactors=FALSE)
        activities<-read.table(file_names[1], stringsAsFactors=FALSE)
        
        #' adds a "dataType" column to each "x" data table
        #'  this allows the two sets to be merged while identifying which observations 
        #'  belong to each set. 
        #+
        x_test<-mutate (x_test, dataType = "test")
        x_train<-mutate (x_train, dataType = "train")
        
        #'  combines the "test" data set with the "train" data set
        #'  stores the data type in a new variable "dataType"
        #+
        dt<- rbind(x_test, x_train)
        data_type<-select(dt, dataType)
                
        #'  adds the variable names to the combined data set
        #+
        dt_temp<-select (dt, V1:V561)
        feature_names <- as.vector(features[ ,2])
        feature_names <- make.names(feature_names, unique=TRUE)
        names(dt_temp)<-feature_names
                   
        #' Extracts only the columns that contain values 
        #'  on the mean and standard deviation for each measurement. 
        #+
        dt_temp<-select(dt_temp, contains("mean"), contains ("std"))
 
        #' combines the activity label files 
        all_labels<-rbind (y_test, y_train)
        setnames (all_labels, "V1", "activityNum")
        
        #' grabs the activity file and renames the columns
        #'  converts activity numbers to names using merge 
        #+
        setnames(activities, names(activities), c("activityNum", "activityName"))
        label_names<-merge(all_labels, activities, by="activityNum", all.x=TRUE)
        all_labels <- select(label_names, activityName)
        
        #'  combines the subject id files
        #+
        all_subject<-rbind(subject_test, subject_train)
        setnames (all_subject, "V1", "subjectID")
        
        
        #'  adds the subjectID, activityName, and dataType back to the dataset
        #+
        tidy_dt<- cbind(all_subject, all_labels, data_type, dt_temp)
        
        #' Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
        #+
        newtidy_dt <-
                tidy_dt %>%
                group_by (subjectID, activityName, dataType) %>%
                summarise_each(funs(mean))
        
        #' stores the new tidy data set in the orginal working directory
        #+
        setwd(file.path(originalwd))
        write.table (newtidy_dt, file="new_tidy_data.txt", row.names=FALSE, col.names=TRUE)
        message("The analyzed data is stored here:")
        print (file.path(getwd(), "new_tidy_data.txt"))
        message ("To view the file, use read.table with header=TRUE")
}
        
        
        
        
        
