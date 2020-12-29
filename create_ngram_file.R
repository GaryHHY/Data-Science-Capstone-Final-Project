
library(tm)
library(ggplot2)
library(RWeka)
library(data.table)
library(dplyr)

setwd("C:/Users/hehao/Documents/R_project/Data Science Capstone/NLP/Coursera-SwiftKey/final/en_US")
blog_tab <- readLines("en_US.blogs.txt",skipNul = TRUE, D)
news_tab <- readLines("en_US.news.txt",skipNul = TRUE, encoding = "UTF-8")
twitter_tab <- readLines("en_US.twitter.txt",skipNul = TRUE, encoding = "UTF-8")

new_tab <- c(blog_tab,news_tab)
final_tab <- c(new_tab,twitter_tab)

training_tab <- sample(final_tab, round(0.0025*length(final_tab)), replace = F)

Corpus <- VCorpus(VectorSource(training_tab))

Corpus <- tm_map(Corpus, stripWhitespace)
Corpus <- tm_map(Corpus, content_transformer(tolower))
Corpus <- tm_map(Corpus, removeWords,stopwords("english"))
Corpus <- tm_map(Corpus, removePunctuation)
Corpus <- tm_map(Corpus, PlainTextDocument)
Corpus <- tm_map(Corpus, stemDocument)

BigramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min=2, max=2))

BiTDM <- TermDocumentMatrix(Corpus, control=list(tokenize=BigramTokenizer))

Biwords <- sort(rowSums(as.matrix(BiTDM)),decreasing=TRUE)

bi.df <- data.frame(word = names(Biwords),freq=Biwords)

bi.df <- bi.df[ which(bi.df$freq > 1), ]

TrigramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min=3, max=3))

TriTDM <- TermDocumentMatrix(Corpus, control=list(tokenize=TrigramTokenizer))

Triwords <- sort(rowSums(as.matrix(TriTDM)),decreasing=TRUE)

Tri.df <- data.frame(word = names(Triwords),freq=Triwords)

Tri.df <- Tri.df[ which(Tri.df$freq > 1), ]

QuadgramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min=4, max=4))

QuadTDM <- TermDocumentMatrix(Corpus, control=list(tokenize=QuadgramTokenizer))

Quadwords <- sort(rowSums(as.matrix(QuadTDM)),decreasing=TRUE)

Quad.df <- data.frame(word = names(Quadwords),freq=Quadwords)

Quad.df <- Quad.df[ which(Quad.df$freq > 1), ]

write.csv(bi.df,"./2gram.csv")
write.csv(Tri.df,"./3gram.csv")
write.csv(Quad.df,"./4gram.csv")


