JHUCleaningData
===============

### `run_analyis.R` function

The R script `run_analysis.R` will download and process the Human Activity Recognition Using Smartphones Data Set.  

It will generate the following files examples outputs provided in the codebook:
- `stdmean.csv` : The combined training and test data sets filtered by columns depicting the standard deviation and mean of the experimental measurements

- `tidy_all.csv` : All of the data combined and normalized according to http://vita.had.co.nz/papers/tidy-data.pdf

- `tidy_data_mean.csv` : The data for all the mean values for each experimental measurement grouped by subject_id and activity

A data directory will be created in the repository where all input and output files will reside.


### `get_data.R` function

This is a helper script which creates the data directory if it doesn't exist and downloads the source data if it isn't already in place.

### Source

Data set and experiment details were provided by the Machine Learning Repository: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Dependencies

`run_analysis.R` depends on `dplyr` and `reshape2` libraries
