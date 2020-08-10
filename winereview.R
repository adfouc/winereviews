# https://www.kaggle.com/zynicide/wine-reviews/data?select=winemag-data_first150k.csv


library(tidyverse)
library(lubridate)
library(scales)
install.packages("tidytext")
library(tidytext)
library(textdata)

example <- tibble( text=c("Only a hint of freshly cut, ripe pear peel appears briefly on the nose of this wine. The palate presents a precise picture of concentrated ripe, green pear that comes with purity, precision and restraint. All the fruit is there, but rather than rounding out, it soars with freshness, which is a real achievement in 2018. The finish is dry and vivid."))

example_words <- unnest_tokens(tbl=  example, input =text, output=word)

afinn <- get_sentiments("afinn")
head(afinn)

example_words %>% inner_join(afinn, by="word") 

nrc <- get_sentiments("nrc") %>%
  select(word, sentiment)
  
example_words %>% inner_join(nrc, by="word")

bing <- get_sentiments("bing")  
example_words %>% inner_join(bing, by="word")

loughran <- get_sentiments("loughran") 
example_words %>% inner_join(loughran, by="word")