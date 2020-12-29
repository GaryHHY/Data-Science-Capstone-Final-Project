#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Word Predictor"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            textAreaInput("phrase", "Enter a phrase below"), 
        ),

        # Show a plot of the generated distribution
        mainPanel(
            strong("Predicted Next Word"),
            verbatimTextOutput('selected_word'),
            strong("Phrase Input:"),
            textOutput('rawtext')
        )
    )
))
