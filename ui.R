library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("The R Datasets Summarizer App"),
  
  sidebarPanel(    
    uiOutput("select_dataset"),    
    uiOutput("select_column")
  ),
  
  mainPanel(
    h3("Description"),
    p("This app will summarize any column in the default datasets package in R. To run the summary,
 please choose a specific dataset, and if available, choose a specific column. Have fun exploring!"),
    br(),
     h3("Summary:"),
     verbatimTextOutput("display_summary")
  )
))