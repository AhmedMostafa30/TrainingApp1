library(shiny)
library(shinyjs)
library(rhandsontable)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    tags$style(
        HTML(
            ".frac {
    display: inline-block;
                  position: relative;
                  vertical-align: middle;
                  letter-spacing: 0.001em;
                  text-align: center;
                  font-size: 15px;
                  margin-top: 0px;
                  margin-bottom: 0px;
                  font-family: inherit;
                  font-weight: 500;
                  line-height: 1.1;
                  color: inherit;
                  }
                  .frac > span {
                  display: block;
                  padding: 0.1em;
                  }
                  .frac span.bottom {
                  border-top: thin solid black;
                  }
                  .frac span.symbol {
                  display: none;
                  } "
        )
    ),
    tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "CSS/font-awesome.min.css"),
        tags$link(rel = "stylesheet", type = "text/css", href = "CSS/EDU-style.css"),
        tags$script(src = "Scripts/script.js")
    ),
    titlePanel("Scatter Diagrams"),
    div(class = "row",
        div(class = "col-sm-9", h4("Construct Scatter Diagrams", style = "font-weight : bold")),
        div(
            class = "col-sm-3",
            actionButton("show", "View Tutorial", class = "pull-right btn-view-tutorial")
            )
        ),
    div(class = "flexbox sidebarLayout",
        sidebarLayout(
            sidebarPanel(
                h5("Set labels for variables 1 and 2 then set values for each point", style = "color : black"),
                textInput(inputId = "v1",label = "Variable 1: ", value = "", width = 900, placeholder = "Enter x-axis label"),
                textInput(inputId = "v2",label = "Variable 2: ", value = "", width = 900, placeholder = "Enter y-axis label"),
                rHandsontableOutput("tbl"),
                width = 6
            ),
            mainPanel(
                plotOutput("plt"),
                uiOutput("out"),
                width = 6
                
            )
        )
        )
    
))
