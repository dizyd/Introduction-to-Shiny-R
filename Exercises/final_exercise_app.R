library(shiny)
library(DT)



# Here you can load data and create variables, which can be used in your entire app

# ... load data (remember the working directory is like in RMarkdown always the location of your app file!)

# You want only the numeric columns for this:
num_cols <- unlist(lapply(penguins, is.numeric)) # Identify numeric columns
penguins <- penguins[,num_cols] # filter

# ... get variable names



# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("K-Means"),


)# end fluidPage



server <- function(input, output) {





}

# Run the application
shinyApp(ui = ui, server = server)
