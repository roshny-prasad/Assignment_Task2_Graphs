library(ggplot2)

# Read TSV file )
data <- read.table("C:/Users/roshn/Downloads/shiva1_output.tsv", header = TRUE, sep = "\t")


data <- data[sapply(data$REF, function(x) length(strsplit(x, "")[[1]]) == 1) &
               sapply(data$ALT, function(x) length(strsplit(x, "")[[1]]) == 1), ]

# Create a grouped bar plot
ggplot(data, aes(x = REF, fill = ALT)) +
  geom_bar(position = "dodge", color = "black") +
  labs(title = "Base Changes Plot",
       x = "Reference Base",
       y = "Frequency of Observed Mutations",
       fill = "Alternate Base") +
  theme_minimal()
