
library(ggplot2)

# Read TSV file 
data <- read.table("C:/Users/roshn/Downloads/shiva1_output.tsv", header = TRUE, sep = "\t")

# Convert "AF" to character and take the mean of multiple values
data$AF <- as.character(data$AF)
data$AF <- sapply(data$AF, function(af_string) {
  af_values <- as.numeric(gsub(",", "", af_string)) 
  mean(af_values, na.rm = TRUE)
})

# Filter out non-numeric values in the "AF" column
data <- data[grepl("^\\d+\\.?\\d*$", as.character(data$AF)), ]

# Create a weighted histogram with log-transformed y-axis
ggplot(data, aes(x = AF * 100, y = ..count.. / sum(..count..))) +
  geom_histogram(binwidth = 5, position = "identity", fill = "skyblue") +
  labs(title = " Allele Frequency Spectrum",
       x = "Allele Frequency (%)",
       y = "log (Frequency)") +
  theme_minimal() +
  scale_y_continuous(labels = scales::percent_format(scale = 1))

