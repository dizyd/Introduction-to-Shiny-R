library(shiny)
library(plotly)
library(dplyr)
library(DT)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("App-Template"),

    # Sidebar
    sidebarLayout(
      sidebarPanel(
        
        # <--- No input this time---> # 
        
        
        
        
      ),

        # Show a plot of the generated distribution
        mainPanel(
        
        # <--- here comes your output ---> # 
        h3("Plot"),
        # plot output
        
        h3("Results"),
        # t.test results output
        
        h3("Raw data"),
        # raw data.frame output
        
            
            
            
        ) # end mainPanel
    )# end sidebarLayout
)# end fluidPage



server <- function(input, output) {
    

    # <--- Define your render-funtions here ---> # 
    
    
    # ggplot(sleep, aes(x = group,y = extra,fill = group, group=group)) +
    #   geom_boxplot() +
    #   geom_point(aes(y = extra, group=ID)) +
    #   theme_bw() +
    #   labs( x = "Drug Given",
    #         y = "Increase in hours of sleep")
    
    
    
    # t.test(extra ~ group, data = sleep, paired = TRUE)
   
    
    
    #  sleep
    
    
    
    
    
  
}

# Run the application 
shinyApp(ui = ui, server = server)
