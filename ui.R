library(shiny)

shinyUI(fluidPage(
    titlePanel("Ozone prediction based on Temperature with 3 different linear models A-B-C"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderTemp", "Please introduce the desired Temperature value to predict the Ozone level", 60, 100, value = 70),
            checkboxInput("showfitA", "Show/Hide Model A (based only on Temperature)", value = TRUE),
            checkboxInput("showfitB", "Show/Hide Model B (based on Temp. and Solar.R)", value = TRUE),
            checkboxInput("showfitC", "Show/Hide Model C (based on Temp. and Wind)", value = TRUE),
            submitButton("Submit"), # Delayed reactivity: instead of inmediate result, reactivity is delayed with a button
            helpText("DOCUMENTATION:"),
            helpText("This Shiny App uses the airquality() dataset from R to generate an Ozone prediction (output) for a given Temperature (which is the input selected by the user)."),
            helpText("The prediction is based on 3 linear models A-B-C, each of them fitted with different predictors (A: Temperature // B: Temperature and Solar Radiation // C: Temperature and Wind)."),
            helpText("The result is an interactive plot showing the predicted Ozone values from each model correspondent to the selected Temperature value."),
            helpText("The user can interactively show or hide all 3 linear models in the plot and submit the calculation once the Temperature has been selected.")
        ),
        mainPanel(
            plotOutput("myplot"),
            h5("Predicted Ozone from Model A (based on Temp.):"),
            textOutput("predA"),
            h5("Predicted Ozone from Model B (based on Temp + Solar.R):"),
            textOutput("predB"),
            h5("Predicted Ozone from Model C (based on Temp + Wind):"),
            textOutput("predC"),
        )
    )
))
