library(shiny)



ui <- fluidPage(
  
  titlePanel("Hello!"),
  
  fluidRow(
    column(6,
      plotOutput("hist")
    ),
    column(6,
      plotOutput("dens")
    ),
  ), # end fluidRow
  
  
  
  
  
  hr(), # horizontal line
  
  
  
  
  fluidRow(
    column(4,
      sliderInput("sd", "SD:", min = 0, max = 100, value = 4)
    ),
    column(4,
      sliderInput("m", "Mean:", min = -100, max = 100, value = 0)
    ),
    column(4,
      sliderInput("n", "n:", min = 0, max = 1000, value = 500)
    )
  )# end fluidRow
) # end fluidPage


server <- function(input, output) {
    

  
    
output$hist <- renderPlot({
  
  x    <- rnorm(input$n,mean=input$m,sd=input$sd)
 
  ggplot(data.frame(x),aes(x=x))+
    geom_histogram(bins=50)+
    theme_bw()

  
})
    
output$dens <- renderPlot({
  
  x    <- rnorm(input$n,mean=input$m,sd=input$sd)
  
  ggplot(data.frame(x),aes(x=x))+
    geom_density()+
    theme_bw()
  
  
})
    
    
    
  
}

# Run the application 
shinyApp(ui = ui, server = server)
