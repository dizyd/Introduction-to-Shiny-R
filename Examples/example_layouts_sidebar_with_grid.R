library(shiny)



ui <- fluidPage(
  
  titlePanel("Hello!"),
  
  fluidRow(
    
    column(4,
           wellPanel(
             sliderInput("sd", "SD:", min = 0, max = 100, value = 4)
           )       
    ),
    
    column(8,
           plotOutput("hist")
    )
  )
)


server <- function(input, output) {
    

  
    
  output$hist <- renderPlot({
    
    x    <- rnorm(500,mean=0,sd=input$sd)
   
    ggplot(data.frame(x),aes(x=x))+
      geom_histogram(bins=50)+
      theme_bw()
  
    
  })
    
    
    
    
    
  
}

# Run the application 
shinyApp(ui = ui, server = server)
