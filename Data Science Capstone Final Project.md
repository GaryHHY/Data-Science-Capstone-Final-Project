Data Science Capstone Final Project
========================================================
author: Haoyi He
date: 28 December 2020
autosize: true

Instructions
========================================================
The goal of this exercise is to create a product to highlight the prediction algorithm that you have built and to provide an interface that can be accessed by others. For this project you must submit:

* A Shiny app that takes as input a phrase (multiple words) in a text box input and outputs a prediction of the next word.

* A slide deck consisting of no more than 5 slides created with R Studio Presenter (https://support.rstudio.com/hc/en-us/articles/200486468-Authoring-R-Presentations) pitching your algorithm and app as if you were presenting to your boss or an investor.

Word predictor
========================================================

The goal of this app is to predict next word based on phrase input by user.

**Example**:

Input string:

"*for the first*"

Predicted word:

"*time*"

App Details
========================================================
**Source dataset**: 
A training data from twitter news and blog.
https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip

**Algorithm**:
* Cleanning the corpora.
* Tokenization the corpora.
* Build n-gram model for predicting the next word based on the previous 1, 2, or 3 words.

More Information
========================================================
Application address: 
https://haoyi-he.shinyapps.io/Data-Science-Capstone-Final-Project/

Github repo:
https://github.com/GaryHHY/Data-Science-Capstone-Final-Project


