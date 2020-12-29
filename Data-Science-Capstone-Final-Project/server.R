#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(stringr)
library(tm)

BiGramTab <- read.csv('./2gram.csv', header = TRUE, stringsAsFactors = FALSE)
TriGramTab <- read.csv('./3gram.csv', header = TRUE, stringsAsFactors = FALSE)
QuadGramTab <- read.csv('./4gram.csv', header = TRUE, stringsAsFactors = FALSE)

Predictor <- function (word) {
    cleanedWordlst <- strsplit(word, " ")[[1]]
    
    if (length(cleanedWordlst) > 2) {
        Comparelst <- tail(cleanedWordlst,3)
        TargetValue <- QuadGramTab[QuadGramTab[,1] == Comparelst[1] & QuadGramTab[,2]  == Comparelst[2] & QuadGramTab[,3] == Comparelst[3], 4]
        if (identical(character(0),head(TargetValue,1))){
            Predictor(paste(Comparelst[2],Comparelst[3],sep=" "))
        }
        else { 
            return(head(TargetValue,1))
            }
    }
    else if (length(cleanedWordlst) == 2){
        Comparelst <- tail(cleanedWordlst,2)
        TargetValue <- TriGramTab[TriGramTab[,1] == Comparelst[1] & TriGramTab[,2] == Comparelst[2], 3]
        if (identical(character(0),head(TargetValue,1))) {
            Predictor(Comparelst[2])
        }
        else {
            return(head(TargetValue,1))
            }
    }
    else if (length(cleanedWordlst) == 1){
        Comparelst <- tail(cleanedWordlst,1)
        TargetValue <- BiGramTab[BiGramTab[,1] == Comparelst[1], 2]
        if (identical(character(0),head(TargetValue,1))) {
            return(head("the",1))
            }
        else {
            return(head(TargetValue,1))
            }
    }
    
}

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$selected_word <- renderText({
        result <- Predictor(input$phrase)
        result
    })

    output$rawtext <- renderText({
        input$phrase
    })    

})
