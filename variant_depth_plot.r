library(ggplot2)

# Read the TSV file
data <- read.table("C:/Users/roshn/Downloads/shiva1_output.tsv", header = TRUE, sep = "\t")

# Convert 'AF' to numeric (cleaning any non-numeric values)
data$AF <- as.character(data$AF)
data$AF <- sapply(data$AF, function(af_string) {
  af_values <- as.numeric(gsub(",", "", af_string))  # Remove commas if present and convert to numeric
  mean(af_values, na.rm = TRUE)
})

# Filter out rows with missing values in relevant columns
data <- na.omit(data[c('CHROM', 'POS', 'REF', 'ALT', 'GT', 'DP', 'AF', 'ISExonic', 'VariantClass')])
# Count the number of genomic variants
num_genomic_variants <- nrow(data)

# Count the number of exonic variants
num_exonic_variants <- sum(data$ISExonic == "True")

# Plot bar graph using ggplot2 with 'AF' multiplied by 100
ggplot(data, aes(x = DP, y = AF*100)) +
  geom_bar(stat = "identity", fill = "blue", color = "blue") +
  labs(title = "Variant Depth",
       x = "Read Depth",
       y = "% Coverage") +
  theme_minimal()
# Print the counts
cat("Number of Genomic Variants:", num_genomic_variants, "\n")
cat("Number of Exonic Variants:", num_exonic_variants, "\n")







