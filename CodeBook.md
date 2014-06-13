Code Book - HARUS Averaged Dataset
========

This document aims at explaining the meaning of the variables present in the [*HARUS Averaged* dataset](https://raw.githubusercontent.com/renanmzmendes/gettingdata-courseproject/master/averaged.txt)

### Origin

The _HARUS Averaged_ dataset,  is a summarization of the *Human Activity Recognition Using Smartphones* dataset. Its description and the data itself can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

In general lines, the *Human Activity Recognition Using Smartphones* dataset was obtained during experiments where subjects had a smartphone strapped to their waists while performing a few activities, such as walking, walking up and down the stairs, sitting down, among others. The smartphone, equipped with an accelerometer and one gyroscope, provided linear and angular acceleration for each cartesian axis. This signal was sampled at a given rate and processed, resulting time and frequency domain variables.

The original dataset also provided the subject identfiers (1 to 30) and the activity each one of them was performing at the time when the signals were captured.

### Detailed steps to obtaining the tidy dataset

The original dataset consists of separate files containing partial information on the data. Our aim is to perform a series of operations that will summarize and consolidate the required information on a single file. 

The steps taken are described in the sections below.

#### 1. Combining information into data frame

The following files

- X_test.txt
- y_test.txt
- subject_test.txt

can be combined in such a way to produce the following data frame

```
(561 measurements of features) | subject | activity
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - >
|                              |    1    | WALKING
|                              |    2    | WALKING_UPSTAIRS
|                              |    2    | WALKING_DOWNSTAIRS
|
|
V
```

In this step, the numbers representing the activity will be substituted by a descriptive name.

#### 2. Merging the test and train data

This step consists primarily of merging the two data frames obtained in the previous step into a single data frame of both test and train data.

#### 3. Subsetting the data

Of the 561 variables, we are only interested in those representing **means** and **standard deviations**, which correspond to the following features:

| Index |      Name        |
|:-----:|------------------|
| 1 | tBodyAcc-mean()-X| 
| 2 | tBodyAcc-mean()-Y| 
| 3 | tBodyAcc-mean()-Z| 
| 4 | tBodyAcc-std()-X | 
| 5 | tBodyAcc-std()-Y | 
| 6 | tBodyAcc-std()-Z | 
| 41 | tGravityAcc-mean()-X | 
| 42 | tGravityAcc-mean()-Y | 
| 43 | tGravityAcc-mean()-Z | 
| 44 | tGravityAcc-std()-X | 
| 45 | tGravityAcc-std()-Y | 
| 46 | tGravityAcc-std()-Z | 
| 81 | tBodyAccJerk-mean()-X | 
| 82 | tBodyAccJerk-mean()-Y | 
| 83 | tBodyAccJerk-mean()-Z | 
| 84 | tBodyAccJerk-std()-X | 
| 85 | tBodyAccJerk-std()-Y | 
| 86 | tBodyAccJerk-std()-Z |
| 121 | tBodyGyro-mean()-X | 
| 122 | tBodyGyro-mean()-Y | 
| 123 | tBodyGyro-mean()-Z | 
| 124 | tBodyGyro-std()-X | 
| 125 | tBodyGyro-std()-Y | 
| 126 | tBodyGyro-std()-Z | 
| 161 | tBodyGyroJerk-mean()-X | 
| 162 | tBodyGyroJerk-mean()-Y | 
| 163 | tBodyGyroJerk-mean()-Z | 
| 164 | tBodyGyroJerk-std()-X |
| 165 | tBodyGyroJerk-std()-Y |
| 166 | tBodyGyroJerk-std()-Z |
| 201 | tBodyAccMag-mean() | 
| 202 | tBodyAccMag-std() | 
| 214 | tGravityAccMag-mean() | 
| 215 | tGravityAccMag-std() | 
| 227 | tBodyAccJerkMag-mean() |
| 228 | tBodyAccJerkMag-std() |
| 240 | tBodyGyroMag-mean() |
| 241 | tBodyGyroMag-std() |
| 253 | tBodyGyroJerkMag-mean() |
| 254 | tBodyGyroJerkMag-std() |
| 266 | fBodyAcc-mean()-X |
| 267 | fBodyAcc-mean()-Y |
| 268 | fBodyAcc-mean()-Z |
| 269 | fBodyAcc-std()-X |
| 270 | fBodyAcc-std()-Y |
| 271 | fBodyAcc-std()-Z |
| 345 | fBodyAccJerk-mean()-X |
| 346 | fBodyAccJerk-mean()-Y |
| 347 | fBodyAccJerk-mean()-Z |
| 348 | fBodyAccJerk-std()-X |
| 349 | fBodyAccJerk-std()-Y |
| 350 | fBodyAccJerk-std()-Z |
| 424 | fBodyGyro-mean()-X |
| 425 | fBodyGyro-mean()-Y |
| 426 | fBodyGyro-mean()-Z |
| 427 | fBodyGyro-std()-X |
| 428 | fBodyGyro-std()-Y |
| 429 | fBodyGyro-std()-Z |
| 503 | fBodyAccMag-mean() |
| 504 | fBodyAccMag-std() |
| 516 | fBodyBodyAccJerkMag-mean() |
| 517 | fBodyBodyAccJerkMag-std() |
| 529 | fBodyBodyGyroMag-mean() |
| 530 | fBodyBodyGyroMag-std() |
| 542 | fBodyBodyGyroJerkMag-mean() |
| 543 | fBodyBodyGyroJerkMag-std() |

#### 4. Averaging the original values

After subsetting the columns of interest, the final step consists of grouping the data by *subject* and *activity*, aggregating the values with the `mean` function.