library(shiny)

shinyServer(function(input, output) {
    airquality$Wind <- ifelse(airquality$Temp - 20 > 0, airquality$Temp - 20, 0)
    fitA <- lm(Ozone ~ Temp, data = airquality)
    fitB <- lm(Ozone ~ Solar.R + Temp, data = airquality)
    fitC <- lm(Ozone ~ Wind + Temp, data = airquality)
    
    fitApred <- reactive({
        TempInput <- input$sliderTemp
        predict(fitA, newdata = data.frame(Temp = TempInput))
    })
    
    fitBpred <- reactive({
        TempInput <- input$sliderTemp
        predict(fitB, newdata = 
                    data.frame(Temp = TempInput,
                               Solar.R = ifelse(TempInput -20 > 0,
                                              TempInput - 20, 0)))
    })
    
    fitCpred <- reactive({
        TempInput <- input$sliderTemp
        predict(fitC, newdata = 
                    data.frame(Temp = TempInput,
                               Wind = ifelse(TempInput - 22 > 0,
                                                TempInput - 22, 0)))
    })
    
    output$myplot <- renderPlot({
        TempInput <- input$sliderTemp
             
        plot(airquality$Temp, airquality$Ozone, xlab = "Temperature",
             ylab = "Ozone", bty = "n", pch = 21, col = "steelblue",
             xlim = c(60,100), ylim = c(0, 100))
        
        if(input$showfitA){
            abline(fitA, col = "orange", lwd = 2)
        }
        if(input$showfitB){
            fitBlines <- predict(fitB, newdata = data.frame(
                Temp = 60:100, Solar.R = ifelse(60:100 - 20 > 0, 60:100 -20, 0)
            ))
            lines(60:100, fitBlines, col = "brown", lwd = 2)
        }
        if(input$showfitC){
            fitClines <- predict(fitC, newdata = data.frame(
                Temp = 60:100, Wind = ifelse(60:100 - 0 > 22, 60:100 - 22, 0)
            ))
            lines(60:100, fitClines, col = "green", lwd = 2)
        }
        legend(25, 250, c("Model A Prediction", "Model B Prediction", "Model C Prediction"), pch = 16,
               col = c("orange", "brown", "green"), bty = "n", cex = 1.2)
        points(TempInput, fitApred(), col = "orange", pch = 16, cex = 2) # fitApred must be accessed as a nr, not as a function, that's why ()
        points(TempInput, fitBpred(), col = "brown", pch = 16, cex = 2) # idem
        points(TempInput, fitCpred(), col = "green", pch = 16, cex = 2) # idem
    })
    
    output$predA <- renderText({
        fitApred()
    })
    
    output$predB <- renderText({
        fitBpred() 
    })
    
    output$predC <- renderText({
        fitCpred() 
    })
})



