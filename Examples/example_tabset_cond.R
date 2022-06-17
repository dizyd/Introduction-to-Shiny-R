library(shiny)



ui <- fluidPage(


  withMathJax(),

  titlePanel("Hello!"),

  fluidRow(

    column(4,
      conditionalPanel("input.tabs1 == 'Normal'",
        sliderInput("mu", "M:", min = -100, max = 100, value = 5),
        sliderInput("sd", "SD:", min = 0, max = 100, value = 4),
      ),
      conditionalPanel("input.tabs1 == 'Beta'",
        numericInput("a", "a:", min = 0, max = 100, value = 5),
        numericInput("b", "b:", min = 0, max = 100, value = 4),
      )
    ),

    column(8,
      tabsetPanel(id ="tabs1",
        tabPanel("Normal",

          plotOutput("norm")

        ),
        tabPanel("Beta",

          plotOutput("beta")

        )
      ) # end tabsetPanel
    ) # end column
  ) # end fluidRow
) # end fluidPage

server <- function(input, output) {




  output$norm <- renderPlot({

    x    <- rnorm(500,mean=input$mu,sd=input$sd)

    ggplot(data.frame(x),aes(x=x))+
      geom_histogram(bins=50)+
      theme_bw()


  })

  output$beta <- renderPlot({

    x    <- rbeta(500,input$a,input$b)

    ggplot(data.frame(x),aes(x=x))+
      geom_histogram(bins=50)+
      theme_bw()


  })




}

# Run the application
shinyApp(ui = ui, server = server)
