#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(rAmCharts)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    output$distPlot <- renderAmCharts({
        
        # generate bins based on input$bins from ui.R
        x    <- faithful[, input$var] 
        bins <- round(seq(min(x), max(x), length.out = input$bins + 1), 2)
        
        # draw the histogram with the specified number of bins
        amHist(x=x, control_hist = list(breaks = bins),
               col = input$color, main = input$titre,
               export = TRUE, zoom = TRUE)
        
    })
    
    output$boxplot <- renderAmCharts({
        input$go # input declenchant la reactivite
        # reste du code isole
            x <-  faithful[, input$var] 
            amBoxplot(x, col = input$color, main = "Boxplot", export = TRUE, zoom = TRUE)
    })
    
    # summary
    output$summary <- renderPrint({
        summary(faithful)
    })
    
    # table
    output$table <- renderDataTable({
        faithful
    })
    
    # nombre de classe
    output$n_bins <- renderText({
        paste("Nombre de classes : ", input$bins)
    })
    
})