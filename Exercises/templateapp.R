library(shiny)
library(DT)
# Define UI for application that draws a histogram
ui <- fluidPage(



    # Sidebar
    sidebarLayout(
        sidebarPanel(
            
        # <--- here comes your input ---> #     
        ),
        mainPanel(
            
        # <--- here comes your output ---> # 
            
            
        ) # end mainPanel
    )# end sidebarLayout
)# end fluidPage



server <- function(input, output) {
    

}

# Run the application 
shinyApp(ui = ui, server = server)
