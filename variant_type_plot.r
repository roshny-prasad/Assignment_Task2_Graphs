
install.packages("ggplot2")
library(ggplot2)

# Read TSV file 
data <- read.table("C:/Users/roshn/Downloads/shiva1_output.tsv", header = TRUE, sep = "\t")

variant_counts <- table(data$VariantClass)

# Create a bar plot for variant types 
ggplot(data, aes(x = factor(VariantClass, levels = names(sort(variant_counts, decreasing = TRUE))), fill = VariantClass)) +
  geom_bar(color = "black") +
  labs(title = "Variant Type Bar Plot",
       x = "Variant Type",
       y = "Frequency") +
  theme_minimal()
