library(shiny)
library(plotly)
library(dplyr)
library(DT)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("App-Template"),

    # Sidebar
    sidebarLayout(
        sidebarPanel(
            
        # <--- No input this time---> # 
            
            
            
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
        
        # <--- here comes your output ---> # 
        h3("Plot"),
        plotOutput("plot"),
        h3("Results"),
        verbatimTextOutput("results"),
        h3("Raw data"),
        dataTableOutput("table")
        
            
            
            
        ) # end mainPanel
    )# end sidebarLayout
)# end fluidPage



server <- function(input, output) {
    

    # <--- here goes the rest ---> # 
    
    output$plot <- renderPlot({
      ggplot(sleep, aes(x = group,y = extra,fill = group, group=group)) +
        geom_boxplot() +
        geom_point(aes(y = extra, group=ID)) +
        theme_bw() +
        labs( x = "Drug Given",
              y = "Increase in hours of sleep")
    })
    
    output$results <- renderPrint({
     t.test(extra ~ group, data = sleep, paired = TRUE)
    })
    
    output$table <- renderDataTable({
      sleep
    })
    
    
    
    
  
}

# Run the application 
shinyApp(ui = ui, server = server)
