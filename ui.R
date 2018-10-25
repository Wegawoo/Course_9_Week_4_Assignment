library(shiny)
library(shinythemes)


# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = shinytheme("cosmo"),
  
  # Application title
  titlePanel("Loan Interest and Repayment Calculator"),
  
  # Sidebar with a slider inputs and textbox
  sidebarLayout(
    sidebarPanel(
       sliderInput("LoanAmnt",
                   "Loan Amount:",
                   min = 1000,
                   max = 50000,
                   value = 20000,
                   step=500),
      numericInput("APR","Specify the APR for the loan:", min = 1, max = 40, value = 9.9,step=0.1),
      sliderInput("Term",
                  "Loan Term (Months):",
                  min = 12,
                  max = 60,
                  value = 30)
    ),
    
    # Show financial figures to the user
    mainPanel(
      h5("Monthly Repayments:"),
      textOutput("MonthlyRepay"),
      h5("Total Amount Payable:"),
      textOutput("TotalPayable"),
      h5("Interest Charged:"),
      textOutput("Interest"),
      br(),
      br(),
      br(),
      br(),
      br(),
      br(),
      h3("Documentation"),
      p("This app is designed to calculate how much a person would have to pay 
      each month, along with total amount payable and interest charges."),
      p("The user should select the loan amount in the first slider, and this is the amount
         a customer takes out as a loan with a loan provider ranging from 1k to 50k."),
      p("The user should then enter the annual effective interest rate in the input box."),
      p("The next step is to determine how long to borrow, and this is the last slider and 
         ranges from 12 months to 60 months."),
      p("Changing any of the user inputs will update the figures above.")
    )
  )
))
