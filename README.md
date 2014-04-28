Getting and Cleaning Data - Peer Assessment
===========================================

This repository contains the R script _run\_analysis.R_ to tidy
[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
At the beginning script downloads the data set saving it as _har.zip_ and
unzips it into _'UCI HAR Dataset'_ directory while _har.zip_ won't be downloaded
if it's exist already. After the loading and transforming data set script
writes three tidy data sets:

- The aggregate of test and train data sets, _har-aggregate.txt_.
- The data frame with measurements of means and standard deviations, _har-only-mean-std.txt_.
- The independent tidy data set, _har-independent.txt_.

Running the script in a command line:

`$ Rscript run_analysis.R`

or for Linux, MacOS:

`$ ./run_analysis.R`

Executing the script from the R console:

`> source("run_analysis.R")`
