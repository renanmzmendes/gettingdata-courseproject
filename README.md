Getting and cleaning data
====
### Course Project

#### 1. Introduction

This course project consists of applying the correct transformations to a given dataset in order to extract and summarize the required information. Each component of the project is detailed bellow.

The original dataset is called *Human Activity Recognition Using Smartphones* and the tidy dataset produced at the end of the procedures is called *HARUS Averaged*.

The actual procedures and transformations are detailed separetely.

#### 2. Components

##### 2.1 Scripts

The script used to perform the transformations described in the code book is `run_analysis.R`. It depends on two pacakges:

- `data.table`: used to manipulate the data as data.tables instead of pure data.frames
- `plyr`: used to perform a *group by* operation on the dataset, using the function `ddply`

##### 2.2 Code Book

The file `CodeBook.md` contains all the information on the transformations applied to the original dataset in order to obtain the tidy dataset. It also explains succintly the meaning of the columns.

##### 2.3 Dataset

The file `averaged.txt` contains the tidy dataset.