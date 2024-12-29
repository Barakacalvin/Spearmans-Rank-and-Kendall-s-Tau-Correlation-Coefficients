# Load required libraries
library(tidyverse)

# Loading the dataset with error handling of the data import
file_path <- "File_Path - N/B Should be separated by Foward slashes"
# Checking if file exists
if (file.exists(file_path)) {
  data <- read.csv(file_path)
# Checking if the variables being tested exist (check for the existing column names)
  if (!("prody" %in% colnames(data)) | !("commit" %in% colnames(data))) {
    stop("Columns 'prody' and/or 'commit' do not exist in the dataset.")
  }
# Error message fro when file is not available
} else {
  stop("File not found.")
}

# Calculation of the Spearman's rank correlation
correlation_spearman <- cor(data$prody, data$commit, method = "spearman")
print(paste("Spearman's rho:", correlation_spearman)) #Prints out the results of Spearmans computation

# Calculation of the Kendall's tau correlation
correlation_kendall <- cor(data$prody, data$commit, method = "kendall")
print(paste("Kendall's tau:", correlation_kendall)) #Prints out the results of Kendall's computation

