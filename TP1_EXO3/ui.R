
#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(colourpicker)
library(rAmCharts)

# Define UI for application that draws a histogram
shinyUI(
    # navbarPage
    navbarPage("Premiers pas avec shiny",
               
               # premier onglet Data
               tabPanel("Data", 
                        # table
                        dataTableOutput("table"),
                        # summary
                        verbatimTextOutput("summary")
               ), 
               
               # second onglet Visualisation
               tabPanel("Visualisation", 
                        
                        # Sidebar with a slider input for number of bins 
                        sidebarLayout(
                            sidebarPanel(
                                sliderInput("bins",
                                            "Number of bins:",
                                            min = 1,
                                            max = 50,
                                            value = 30),
                                
                                # input couleur
                                colourInput(inputId = "color", label = "Choix de la couleur :", value = "blue"),
                                
                                # titre du graphique
                                textInput(inputId = "titre", label = "Choix du titre :", value = "Histogramme"),
                                # selection de la colonne
                                radioButtons(inputId = "var", label = "Variable : ", choices = colnames(faithful))
                            ),
                            
                            # Show a plot of the generated distribution
                            mainPanel(
                                amChartsOutput("distPlot"),
                                # classes
                                div(textOutput("n_bins"), align = "center"),
                                amChartsOutput("boxplot")
                                
                            )
                        )
               )
    )
)