draft !!!

Human Activity Recognition Using Smartphones Data Set
=====================================================

> Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 

> Smartlab - Non Linear Complex Systems Laboratory 
> DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy. 

> activityrecognition@smartlab.ws

> www.smartlab.ws

## General information about HAR data set

The experiments have been carried out with a group of 30 volunteers within an 
age bracket of 19-48 years. Each person performed six activities (WALKING, 
WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a 
smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer 
and gyroscope, we captured 3-axial linear acceleration and 3-axial angular 
velocity at a constant rate of 50Hz. The experiments have been video-recorded 
to label the data manually. The obtained dataset has been randomly partitioned 
into two sets, where 70% of the volunteers was selected for generating the 
training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying 
noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 
50% overlap (128 readings/window). The sensor acceleration signal, which has 
gravitational and body motion components, was separated using a Butterworth 
low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

## HAR data set includes the following files:

- Information about the variables used on the feature vector: _features\_info.txt_
- List of names of features: _features.txt_
- Links the class labels with their activity name: _activity\_labels.txt_
- Training set: _train/X\_train.txt_
- Training labels: _train/y\_train.txt_
- Test set: _test/X\_test.txt_
- Test labels: _test/y\_test.txt_
- _README.txt_


