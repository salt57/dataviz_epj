library("dplyr")
library("DT")
data <- read.delim("/home/salt57/Downloads/ratings.tsv")
data2 <- read.delim("/home/salt57/Downloads/data.tsv")
data2
joint <- left_join(data2, data, by = c("titleId" = "tconst"))
joint
netflix <- read.csv("/home/salt57/Downloads/netflix_titles.csv")
netflix
final <- left_join(netflix, joint, by = c("title" = "title"))
final
final0 <- final %>%
  na.omit()
final2 <- distinct(final0, show_id, .keep_all = TRUE)
final2
write.csv(final2, "/home/salt57/Downloads/finalMergedNetflixData.csv")