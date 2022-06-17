library(shiny)
library(plotly)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            h2("Group 1"),
            numericInput("mu1","Mean:",min = 1,max = 500,value = 30),
            numericInput("sd1","SD:",min = 1,max = 500,value = 30),
            numericInput("n1" ,"n:",min = 1,max = 500,value = 30),
            h2("Group 2"),
            numericInput("mu2","Mean:",min = 1,max = 500,value = 30),
            numericInput("sd2","SD:",min = 1,max = 500,value = 30),
            numericInput("n2" ,"n:",min = 1,max = 500,value = 30),
            h2("Plot Options"),
            numericInput("bins" ,"bins:",min = 1,max = 500,value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           h2("Plot"),
           plotlyOutput("hist"),
           br(),
           h2("t-test Results"),
           verbatimTextOutput("ttest")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    
    

    output$hist <- renderPlotly({
        
        x1 <- rnorm(input$n1, input$mu1, input$sd1)
        x2 <- rnorm(input$n2, input$mu2, input$sd2)
        
        ggplot(data.frame(x1,x2)) + 
            geom_histogram(aes(x = x1, fill = "Group 1"),alpha=0.5,bins=input$bins) +
            geom_histogram(aes(x = x2, fill = "Group 2"),alpha=0.5,bins=input$bins) +
            theme_bw() +
            labs(fill = "",
                 x    = "")
       
    })
    
    
    output$ttest <- renderPrint({
        
        x1 <- rnorm(input$n1, input$mu1, input$sd1)
        x2 <- rnorm(input$n2, input$mu2, input$sd2)
        
        t.test(x1,x2)
        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
