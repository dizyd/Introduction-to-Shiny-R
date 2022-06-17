library(shiny)



ui <- fluidPage(

  titlePanel("Hello!"),


  fluidRow(

    column(4,
           wellPanel(
             sliderInput("sd", "SD:", min = 0, max = 100, value = 4),
             sliderInput("shape1", "a:", min = 0.01, max = 10, value = 1),
             sliderInput("shape2", "b:", min = 0.01, max = 10, value = 2,)
           )
    ),

    column(8,
      tabsetPanel(
        tabPanel("Normal",

          plotOutput("norm")

        ),
        tabPanel("Beta",

          plotOutput("beta")

        ),
        tabPanel("Text",

          includeMarkdown("test.md")

        )
      ) # end tabsetPanel
    ) # end column
  ) # end fluidRow
) # end fluidPage

server <- function(input, output) {




  output$norm <- renderPlot({

    x    <- rnorm(500,mean=0,sd=input$sd)

    ggplot(data.frame(x),aes(x=x))+
      geom_histogram(bins=50)+
      theme_bw()


  })

  output$beta <- renderPlot({

    x    <- rbeta(500,input$shape1,input$shape2)

    ggplot(data.frame(x),aes(x=x))+
      geom_histogram(bins=50)+
      theme_bw()


  })




}

# Run the application
shinyApp(ui = ui, server = server)
