library(shiny)
library(shinydashboard)
library(parameters)

df <- read.csv2("../Data/penguins.csv")


# Define UI for application that draws a histogram
ui <- fluidPage(


    # Load MathJax

    useShinydashboard(),

    # Application title
    titlePanel("Example: Boxes from shinydashboard"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(width = 2

        ),

        # Show a plot of the generated distribution
        mainPanel(
            fluidRow(
                box(
                    includeMarkdown("about.md"),
                    title = "About", status = "primary",
                    solidHeader = F, collapsible = TRUE, collapsed = F,
                    width = 6,align="center"
                ),


                box(dataTableOutput("table"),
                    title = "Data", status = "primary",
                    solidHeader = F, collapsible = TRUE, collapsed = F,
                    width = 6
                )),
            fluidRow(

                box(plotOutput("penPlot",height = "350px",  width = "100%"),
                    title = "Data", status = "primary",
                    solidHeader = F, collapsible = TRUE, collapsed = T,
                    width = 6
                ),
                box(dataTableOutput("restable"),
                    title = "Regression Analysis", status = "primary",
                    solidHeader = F, collapsible = TRUE, collapsed = T,
                    width = 6
                )),
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {


    output$restable <- renderDataTable({
        mod <- lm(body_mass_g ~ sex*species,data=df)
        model_parameters(mod) %>% mutate_if(is.numeric,round,2) %>%
        DT::datatable(.,options(scrollX = TRUE,autoWidth=T))
    })

    output$table <- renderDataTable({
        DT::datatable(df,options(scrollX = TRUE,autoWidth=T))
    })


    output$penPlot <- renderPlot({

        ggplot(df,aes(x = species, y = body_mass_g, fill = sex)) +
            geom_boxplot() +
            labs(x     = "Species",
                 y     = "Body Mass (g)") +
            theme_bw() +
            facet_grid(.~year)
    },res = 96)
}

# Run the application
shinyApp(ui = ui, server = server)
