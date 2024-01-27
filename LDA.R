library(readxl)
library(tidyverse)

lda_df = 
  read_excel("LDA数据.xlsx", col_names = c("label", "x", "y", "z")) |>
  mutate(label = factor(label), group = factor(str_sub(label, end = -2)))
  



