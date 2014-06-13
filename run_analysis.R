library(data.table)
library(sqldf)
library(plyr)

# Global parameters
message("Reading global parameters: activity_labels and features")
activity_labels <- data.table(read.table("data/activity_labels.txt", col.names=c("activity_number", "name")), key = "activity_number")
features <- read.table("data/features.txt", col.names=c("number", "name"), stringsAsFactors=FALSE)

# Subjects
message("Reading subject ids")
subject_test <- read.table("data/test/subject_test.txt", col.names = c("number"))
subject_train <- read.table("data/train/subject_train.txt", col.names = c("number"))

# Activities
message("Reading activities")
y_test <- data.table(read.table("data/test/y_test.txt", col.names=c("activity_number")), key = "activity_number")
y_train <- data.table(read.table("data/train/y_train.txt", col.names=c("activity_number")), key = "activity_number")

message("Merging activities and activity_labels")
merged_activities_test <- merge(y_test, activity_labels)
merged_activities_train <- merge(y_train, activity_labels)

# Data sets
message("Reading test data set and adding subject and activity columns")
x_test <- data.table(read.table("data/test/X_test.txt"))
x_test[,subject:=subject_test$number]
x_test[,activity:=merged_activities_test$name]

message("Doing the same for train data set")
x_train <- data.table(read.table("data/train/X_train.txt"))
x_train[,subject:=subject_train$number]
x_train[,activity:=merged_activities_train$name]

# Appending data sets
message("Appending both data sets and setting descriptive names to the columns")
x <- rbind(x_test, x_train)
setnames(x, names(x), c(features$name, c("subject", "activity")))

# Subset only columns of interest
message("Dropping every column that are not means or standard deviations")
allowed <- c(1, 2, 3, 4, 5, 6, 41, 42, 43, 44, 45, 46, 81, 82, 83, 84, 85, 86, 121, 122, 123, 124, 125, 126, 161, 162, 163,
 164, 165, 166, 201, 202, 214, 215, 227, 228, 240, 241, 253, 254, 266, 267, 268, 269, 270, 271, 345, 346, 347, 348,
 349, 350, 424, 425, 426, 427, 428, 429, 503, 504, 516, 517, 529, 530, 542, 543, 562, 563)

x_allowed_cols <- subset(x, select = allowed)

# Compute averages of variables for each activity and each variable
message("Computing the average of each column")
avg <- ddply(x_allowed_cols, c("subject", "activity"), function(df) { sapply(subset(df, select = -which(names(df) %in% c("subject", "activity"))), function(x) { mean(x) }) })

# Save dataset to disk
message("Writing dataset to disk by the name of averaged.txt")
write.table(avg, file="averaged.txt", quote=FALSE, row.names = FALSE)
