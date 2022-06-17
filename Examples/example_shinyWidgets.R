library(shiny)
library(plotly)
library(dplyr)
library(shinyWidgets)


df <- read.csv("../Data/1901_2019_Bangladesh_weather.csv")

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Example: shinyWidgets"),

    # Sidebar
    sidebarLayout(
        sidebarPanel(

        # <--- here comes your input ---> #


            sliderInput(inputId  = "year",
                        label    = "Choose the range of years to include in the plot",
                        min      = 1901, max = 2019,
                        value = c(1901, 2019), step = 1),

            selectInput(inputId  = "yaxis",
                        label    = "Variable on Y-Axis",
                        choices  = c("Temperature","Rain"),
                        selected = "Temperature"),

            materialSwitch(
                inputId = "smooth",
                label   = "Show trend line",
                right   = TRUE,
                status  = "primary"
            ),

            radioButtons(inputId = "colors",
                         label   = "Select your color ",
                         choices = c("Tomato1","#17B661","Skyblue1")),

            textInput(inputId = "title",
                      label   =  "Label your plot",
                      value   = "Default Title")




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
            geom_line(color=input$colors) +
            geom_point(color=input$colors) +
            labs(x     = "Year",
                 y     = input$yaxis,
                 title = input$title) +
            theme_bw()

    if(input$smooth){
       p <-  p +  geom_smooth(se=F,color = "black", lty = "dashed")
    }

    ggplotly(p)

    })
}

# Run the application
shinyApp(ui = ui, server = server)
