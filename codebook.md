===============================
## Data set operations:

###Getting the all the data in one place

The data sets, labels, and features are combined for training and test data respectively.  Then the test and training data is combined, this gives us the full set of data in one data frame.  Lastly activity id is replaced with it's label so the activity can be identified easily.

### Standard deviation and mean
`stdmean.csv` - The combined test and training data set prior to replacing the activity id with the activity label, and only with the columns referencing the mean or standard deviation.

```
> str(stdmean_data)
'data.frame':	5894 obs. of  79 variables:
 $ tBodyAcc-mean()-X              : num  0.257 0.286 0.275 0.27 0.275 ...
 $ tBodyAcc-mean()-Y              : num  -0.0233 -0.0132 -0.0261 -0.0326 -0.0278 ...
 $ tBodyAcc-mean()-Z              : num  -0.0147 -0.1191 -0.1182 -0.1175 -0.1295 ...
 $ tBodyAcc-std()-X               : num  -0.938 -0.975 -0.994 -0.995 -0.994 ...
 $ tBodyAcc-std()-Y               : num  -0.92 -0.967 -0.97 -0.973 -0.967 ...
 $ tBodyAcc-std()-Z               : num  -0.668 -0.945 -0.963 -0.967 -0.978 ...
 $ tGravityAcc-mean()-X           : num  0.936 0.927 0.93 0.929 0.927 ...
 $ tGravityAcc-mean()-Y           : num  -0.283 -0.289 -0.288 -0.293 -0.303 ...
 $ tGravityAcc-mean()-Z           : num  0.115 0.153 0.146 0.143 0.138 ...
 ...
```

### First tidy data set
`tidy_all.csv` - The full data set with activity labels.  Melt was used to make the columns have subject, activity, variable, and value.  This was to reflec the tidy data principle of having one observation per row.

```
> tidy_data[1:5,]
  subject activity          variable     value
1       2 STANDING tBodyAcc-mean()-X 0.2571778
2       2 STANDING tBodyAcc-mean()-X 0.2860267
3       2 STANDING tBodyAcc-mean()-X 0.2754848
4       2 STANDING tBodyAcc-mean()-X 0.2702982
5       2 STANDING tBodyAcc-mean()-X 0.2748330
```

### Second tidy data set
`tidy_data_mean.csv` - The same data a tidy_all except the experimental measurements have been averaged for each subject and activity.  Therefore, for each row we have the average measurement for each variable the subject generated while performing a specific activity.

```
> tidy_data_mean[,1:5]
   subject           activity tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z
1        2             LAYING         0.2813734      -0.018158740       -0.10724561
2        2            SITTING         0.2770874      -0.015687994       -0.10921827
3        2           STANDING         0.2779115      -0.018420827       -0.10590854
4        2            WALKING         0.2764266      -0.018594920       -0.10550036
5        2 WALKING_DOWNSTAIRS         0.2776153      -0.022661416       -0.11681294
6        2   WALKING_UPSTAIRS         0.2471648      -0.021412113       -0.15251390
7        4             LAYING         0.2635592      -0.015003184       -0.11068815
8        4            SITTING         0.2715383      -0.007163065       -0.10587460
9        4           STANDING         0.2804997      -0.009489111       -0.09615749
```

===============================
## Source Material:

Description of source data from the Machine Learning Repository:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.
 
- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
