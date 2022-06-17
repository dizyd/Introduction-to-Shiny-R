library(shiny)
library(plotly)
library(dplyr)


# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("App-Template"),

    # Sidebar
    sidebarLayout(
        sidebarPanel(

        # <--- here comes your input ---> #






        ),

        # Show a plot of the generated distribution
        mainPanel(

        # <--- here comes your output ---> #
        plotlyOutput("coolPlot")



        ) # end mainPanel
    )# end sidebarLayout
)# end fluidPage



server <- function(input, output) {








    # <--- here goes the rest ---> #
    output$coolPlot <- renderPlotly({  # note that we are using the plotly render/Output functions from the plotly package

        # Get data.frame
      # Get data.frame
      df   <- read.csv(input$dataset$datapath) # get uploaded data.frame

      # Get range of years
      range_min <- min(input$year)
      range_max <- max(input$year)

      # Get grouping variable
      yaxis   <- input$yaxis

      # Filter
      df <- df %>% filter(Year > range_min & Year < range_max)

      # group by year
      df_aggr <- df %>% group_by(Year) %>% summarize(m_y  = mean(!!sym(yaxis)),
                                                     sd_y = sd(!!sym(yaxis)),.groups = "drop")


      # Make the plot
      p <- ggplot(df_aggr, aes(x = Year, y = m_y)) +
            geom_line(color  = input$colors) +
            geom_point(color = input$colors) +
            geom_smooth(se = F, color = "black", lty = "dashed") +
            labs(x     = "Year",
                 y     = input$yaxis,
                 title = input$title) +
            theme_bw()

      ggplotly(p)

    })
}

# Run the application
shinyApp(ui = ui, server = server)
