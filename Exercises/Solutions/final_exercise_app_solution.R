library(shiny)
library(DT)


penguins <- read.csv2("../../Data/penguins.csv")

num_cols <- unlist(lapply(penguins, is.numeric))         # Identify numeric columns

penguins <- penguins[,num_cols]

vars     <- names(penguins)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("App-Template"),

    # Sidebar
    sidebarLayout(
        sidebarPanel(

        # <--- here comes your input ---> #
        selectInput("var1", "Variable 1", choices = vars, selected = vars[2]),
        selectInput("var2", "Variable 2", choices = vars, selected = vars[3]),
        numericInput("k", "# Cluster"   , value   = 3, min = 1, max = 5)

        ),

        # Show a plot of the generated distribution
        mainPanel(

        # <--- here comes your output ---> #
            tabsetPanel(
                tabPanel("K Means Results",
                    h2("Plot"),
                    plotOutput("kmeans_plot"),
                    h2("Results"),
                    verbatimTextOutput("results")
                ),
                tabPanel("Raw Data",
                    dataTableOutput("raw_data")
                )
            ) # tabpanel
        ) # end mainPanel
    )# end sidebarLayout
)# end fluidPage



server <- function(input, output) {



    # Combine the selected variables into a new data frame
    data <- reactive({
        penguins[, c(input$var1, input$var2)]
    })

    clusters <- reactive({
        kmeans(x = data(),centers = input$k)
    })


    output$raw_data <- renderDataTable({
        penguins
    })

    output$results <- renderPrint({
        clusters()
    })

    output$kmeans_plot <- renderPlot({




        kmeans <- clusters()
        temp   <- data()


        temp$cluster <-  factor(kmeans$cluster)


        ggplot(temp,aes_string(x = input$var1, y = input$var2, color = "cluster")) +
            geom_point(size=2) +
            geom_point(data = data.frame(kmeans$centers),
                       color = "black",
                       shape = 4,
                       size  = 6) +
            theme_bw() +
            theme(text = element_text(size = 20))



    },width = 800)

}

# Run the application
shinyApp(ui = ui, server = server)
