library(readxl)
library(tidyverse)
library(MASS)
library(ellipse)

lda_df = 
  read_excel("LDA数据.xlsx", col_names = c("label", "x", "y", "z")) |>
  mutate(label = factor(label), group = factor(str_sub(label, end = -2)))
  
lda_model = lda(group ~ x + y + z, data = lda_df)

lda_results = predict(lda_model, lda_df) 
results_df = 
  as.data.frame(lda_results$x) |>
  mutate(group = lda_df$group)

ggplot(results_df, aes(x = LD1, y = LD2, color = group)) +
  geom_point() +
  stat_ellipse(type = "t", level = 0.95) +
  labs(title = "LDA Visualization",
       x = "LD1",
       y = "LD2",
       color = "group")

