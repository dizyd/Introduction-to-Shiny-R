#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(


    # Load MathJax
    withMathJax(),


    # Application title
    titlePanel("Example: MathJax"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("theta",
                        "\\(\\theta\\)",
                        min = 0,
                        max = 1,
                        value = 0.5,
                        step  = 0.05)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("binomPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {



    output$binomPlot <- renderPlot({

        val_theta <- input$theta

        data.frame(heads = 0:10, prob = dbinom(x = 0:10, size = 10, prob = val_theta)) %>%
            ggplot(aes(x = factor(heads), y = prob)) +
            geom_col() +
            labs(title = "Probability of X successes",
                 x     = "Successes (x)",
                 y     = "probability") +
            theme_bw()
    })
}

# Run the application
shinyApp(ui = ui, server = server)
