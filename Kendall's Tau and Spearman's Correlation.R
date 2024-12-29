# Load required libraries
library(tidyverse)

# Load the dataset with error handling
file_path <- "File_Path - N/B Should be separated by Foward slashes"
if (file.exists(file_path)) {
  data <- read.csv(file_path)
  if (!("prody" %in% colnames(data)) | !("commit" %in% colnames(data))) {
    stop("Columns 'prody' and/or 'commit' do not exist in the dataset.")
  }
} else {
  stop("File not found.")
}

# Calculate Spearman's rank correlation
correlation_spearman <- cor(data$prody, data$commit, method = "spearman")
print(paste("Spearman's rho:", correlation_spearman))

# Calculate Kendall's tau correlation
correlation_kendall <- cor(data$prody, data$commit, method = "kendall")
print(paste("Kendall's tau:", correlation_kendall))

