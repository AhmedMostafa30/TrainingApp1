#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyjs)
library(plotrix)
library(DT)
library(rhandsontable)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  observeEvent(input$show, {
    showModal(modalDialog(
      title = tagList(
        span("Video Tutorial"),
        modalButton("")
      ),
      div(class="modalContent",
          div(class="video-Content margin-bottom-20",
              tags$video(src = "videos/movie.mp4", type = "video/mp4", controls = "controls")
              #HTML('<iframe width="100%" height="400" src="//www.youtube.com/embed/6F5_jbBmeJU" frameborder="0" allowfullscreen></iframe>')
          ),
          div(class="steps",
              p("STEPS"),
              tags$ol(class="stepsList",
                      tags$li("X")
                      
              )
          )
      ),
      easyClose = TRUE,
      footer = NULL
    ))
  })
  a = c(0, 0)
  b = c(0, 0)
  c = c(0, 0)
  d = c(0, 0)
  e = c(0, 0)
  f = c(0, 0)
  g = c(0, 0)
  h = c(0, 0)
  i = c(0, 0)
  df = data.frame("1st" = a, "2nd" = b, "3rd" = c, "4th" = d, "5th" = e, "6th" = f, "7th" = g, "8th" = h, "9th" = i)
  output$tbl <- renderRHandsontable({
    rhandsontable(df, rowHeaders = c(input$v1, input$v2), width = 700, rowHeaderWidth = 125, stringsAsFactors = FALSE)
    
  })
  observeEvent(input$tbl$changes$changes, {
    output$out <- renderUI({ 
      p()
    })
  })
  output$plt <- renderPlot({
    data = input$tbl$data
    new = cbind(data[[1]],data[[2]])
    bln1 = 1
    bln2 = 1
    blc = 0
    for (i in 1:length(data[[1]])) {
      if (data[[1]][[i]] < 0) bln1 = 0
      if (data[[1]][[i]] < 0) bln2 = 0
      if (is.character(data[[1]][[i]]) || is.character(data[[1]][[i]])) blc = 1
    }
    if (blc) {
      output$out <- renderUI({
        div(class="text-center ",div(class="err_msg",
                                     span(class="fa fa-exclamation-triangle"),
                                     div(class="msg_content", 
                                         p("Invalid Input"))))  
      })
    } 
    else if (!bln1 || !bln2) {
      output$out <- renderUI({
        div(class="text-center ",div(class="err_msg",
                                     span(class="fa fa-exclamation-triangle"),
                                     div(class="msg_content", 
                                         p("Please enter positive numbers only"))))  
      })
    }
    else if (bln1 && bln2 && !blc) plot(new,lwd=3,col="Blue",pch=4,xlab = input$v1 ,ylab=input$v2,xlim = 0:1, ylim = 0:1,step = 0.2)
    else plot(new,lwd=3,col="Blue",pch=4,xlab = input$v1 ,ylab=input$v2, step = 0.2)
  })
})
