makecodebook<- function(){
        newtidy<-read.table("new_tidy_data.txt", header=TRUE)
        
        label_ids<-c("Unique Subject Id", "Name of Activity" , "Type of Data (test data/training data)", 
                  rep("Feature Vector", length(newtidy)-3)) 
        source_id<-("Source: Human Activity Recognition Using Smartphones Dataset, Version 1.0")
        filename_ids<-c("test/subject_test.txt, train/subject_train.txt", "activity_labels.txt", "test/y_test.txt, train/y_train.txt", 
                        rep("features.txt", length(newtidy)-3))
        
        code.book.newtidy <- data.frame(variable.name=c(names(newtidy)),
                                        label=label_ids, 
                                        source_media=rep("UCI HAR Dataset",length(newtidy)),
                                        filename = filename_ids
                                        )  
        View(code.book.newtidy)
}
        