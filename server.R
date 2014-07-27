library(shiny)
library(datasets)

datasets <- sort(data()$results[,3])

shinyServer(function(input, output) {
  
  #Select the dataset
  output$select_dataset <- renderUI({
    selectInput("dataset", "Dataset", datasets)
  })
  
  
  #Select the column in that dataset
  output$select_column <- renderUI({
    
    # If dataset is not set, return
    if(is.null(input$dataset))
      return()
    
    # Get the dataset
    data <- get(input$dataset)
    colnames <- names(data)
    
    if(!is.null(colnames))
      selectInput("column", "Column", colnames)
  })
  
  # Display Summary
  output$display_summary <- renderPrint({
    
    if(is.null(input$dataset))
      return()
    
    if(is.null(names(get(input$dataset))))
      print(summary(get(input$dataset)))
    else{
      if(is.null(input$column))
        return()
      
      print(summary(get(input$dataset)[input$column]))
    }
      
      
  })  

})