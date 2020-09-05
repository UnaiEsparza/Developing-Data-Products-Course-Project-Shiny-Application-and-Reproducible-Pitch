My Pitch Presentation
========================================================
author: Unai Esparza
date: 2020.09.05
autosize: true

Scope
========================================================

- This is my presentation explaining the Shinny App I created for this project.

- The App itself is available under the following link from the Shiny website: 

  https://unai-esparza.shinyapps.io/myshinnyappproject/

- The ui.R and server.R files are available in my GitHub repository under the following link:

  https://github.com/UnaiEsparza/Developing-Data-Products-Course-Project-Shiny-Application-and-Reproducible-Pitch


General description of the App
========================================================

- The airquality() dataset has been used.
- Ozone level (output) is predicted based on Temperature (input selected by the user).
- 3 linear models are used to predict the Ozone level, using different predictors (A: Temperature // B: Temperature and Solar Radiation // C: Temperature and Wind).
- The result is an interactive plot showing the predicted Ozone values from each model correspondent to the selected Temperature value
- The user can interactively show or hide all 3 linear models in the plot and submit the reactive calculation once the Temperature has been selected.

Info about airquality() dataset
========================================================

See below an example of an R expression which is EVALUATED and DISPLAYED:


```r
summary(airquality)
```

```
     Ozone           Solar.R           Wind             Temp      
 Min.   :  1.00   Min.   :  7.0   Min.   : 1.700   Min.   :56.00  
 1st Qu.: 18.00   1st Qu.:115.8   1st Qu.: 7.400   1st Qu.:72.00  
 Median : 31.50   Median :205.0   Median : 9.700   Median :79.00  
 Mean   : 42.13   Mean   :185.9   Mean   : 9.958   Mean   :77.88  
 3rd Qu.: 63.25   3rd Qu.:258.8   3rd Qu.:11.500   3rd Qu.:85.00  
 Max.   :168.00   Max.   :334.0   Max.   :20.700   Max.   :97.00  
 NA's   :37       NA's   :7                                       
     Month            Day      
 Min.   :5.000   Min.   : 1.0  
 1st Qu.:6.000   1st Qu.: 8.0  
 Median :7.000   Median :16.0  
 Mean   :6.993   Mean   :15.8  
 3rd Qu.:8.000   3rd Qu.:23.0  
 Max.   :9.000   Max.   :31.0  
                               
```

Reactive expressions
========================================================

Additionally, see below some examples of reactive expressions contained in the App. If you want, you can check the complete ui.R and server.R files available in the aforementioned GitHub repo for additional details.


```r
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
```
