ui = fluidPage(
  sliderInput(inputId="num", label="label field", value = 25,min=1,max=100),
  plotOutput("hist")
)

server = function(input,output){
  output$hist = renderPlot({hist(rnorm(input$num))})
  
}
shinyApp(ui=ui,server=server)

