
# Introduction to Shiny R


This repository contains the materials for the workshop **Introduction to Shiny in R** at the SMiP graduate school in Mannheim, Germany. 

## The Materials

The slides are in `.html` format and can be found in the corresponding folders. The best way to make sure you have everything is to download this whole github repository by clicking on the green `Code` button and then on `Download ZIP`: 

![screenshot](https://user-images.githubusercontent.com/7207563/139688624-68fd802e-e408-4941-99e8-ef8e898743d6.PNG)


## Packages needed

The following code can be used to install the packages used in this workshop:

```r
wanted.packages <- c("tidyverse","ggplot2","devtools","shiny","plotly","kableExtra",
"DT","parameters","rsconnect","shinythemes","thematic","shinyWidgets","shinydashboard")
  
# Check what packages need to be installed
new.packages <- wanted.packages[!(wanted.packages %in% installed.packages()[,"Package"])]
  
 # install the not yet installed but required packages and load them
if(length(new.packages)) install.packages(new.packages,dependencies = TRUE)
sapply(wanted.packages, require, character.only = TRUE)
```


**Note:** The workshop is based on R Version 4.2.0 



