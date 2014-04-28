Human Activity Recognition Using Smartphones Data Set
=====================================================

> Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 
> Smartlab - Non Linear Complex Systems Laboratory 
> DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy. 
> Email: activityrecognition@smartlab.ws. Site: www.smartlab.ws.

## General information about HAR data set

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency componen, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

## HAR data set includes the following files:

- Information about the variables used on the feature vector: _features\_info.txt_.
- List of names of features: _features.txt_.
- Class labels with their activity name: _activity\_labels.txt_.
- Training set: _train/X\_train.txt_.
- Training labels: _train/y\_train.txt_.
- Test set: _test/X\_test.txt_.
- Test labels: _test/y\_test.txt_.
- _README.txt_.

## For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.
    
## Description of Analysis Script:
    
- Requires `plyr` and `reshape2` packages for using it.
- If it's needed downloads HAR data set and unpacks it in the current working directory.
- By `read.table` the script reads features names and activities names and sets to `features.names` and `activity.lbls` variables respectively.
- Declares `read.HAR` function with argument _src_ which can be either 'test' or 'train'. This function helps to avoid a duplicate code of loading and cleaning up data sets from the different sources. `read.HAR` reads _X\_src.txt_, _y\_src.txt_, _subject\_src.txt_. It replaces numerical activity lables by character names and sets column names of `x` data frame by `features.names`. Columns _activity_ and _subject_ are joined to `x` data frame in order to make tidy data more comprehensive. Finally `read.HAR` excecutes `unique` function to throw out some duplicate columns.
- Script uses `read.HAR` function to clean up data from test and train sources. It joins two received data frames in `data.aggr`. It is written in _har-aggregated.txt_ file.
- By `grepl` function and the regexp pattern extracts only measurements of means and standard deviations from `data.aggr` without changing _activity_ and _subject_ columns. Obtained data frame is assigned to `data.msd` data frame and saved in _har-only-mean-std.txt_.
- To create independent tidy data set with average of each variable for each activity and each subject, the script creates melted data set by using `melt` function and _activity_ and _subject_ as ids. Melted data set contains four columns: _activity_, _subject_, _variable_, _value_. Then the script uses `acast` function with the formula `activity + subject ~ variable` and `mean` as aggregation function to get a desired data frame. The result is stored in _har-independent.txt_ file.
