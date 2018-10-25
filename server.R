library(shinythemes)
library(shiny)

# Define server logic required to calculate financial figures
shinyServer(function(input, output) {

  output$MonthlyRepay <- reactive({
    
    Month.Int.rate <- (((input$APR/100)+1)^(1/12))-1
    
    discount.factor <- (((1+Month.Int.rate)^input$Term)-1)/(Month.Int.rate*(1+Month.Int.rate)^input$Term)
    
    round(input$LoanAmnt/discount.factor,2)
  })
  
  output$TotalPayable <- reactive({
    
    Month.Int.rate <- (((input$APR/100)+1)^(1/12))-1
    
    discount.factor <- (((1+Month.Int.rate)^input$Term)-1)/(Month.Int.rate*(1+Month.Int.rate)^input$Term)
    
    round((input$LoanAmnt/discount.factor) * input$Term,2)
    
    
  })
  
  output$Interest <- reactive({
    
    Month.Int.rate <- (((input$APR/100)+1)^(1/12))-1
    
    discount.factor <- (((1+Month.Int.rate)^input$Term)-1)/(Month.Int.rate*(1+Month.Int.rate)^input$Term)
    
    round(((input$LoanAmnt/discount.factor) * input$Term)-input$LoanAmnt,2)
    
  })
  
  
  })
