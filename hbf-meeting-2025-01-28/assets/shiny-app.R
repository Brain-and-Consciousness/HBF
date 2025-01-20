
# With this Shiny app, you can inspect the data of the essay pretest. You can
# either click on Run App to run the script and launch the Shiny app on your own
# computer, or go to https://willemsleegers.shinyapps.io/essay-topic-pretest/
# to go to the webhosted version.

# Setup -------------------------------------------------------------------

# Load packages
library(shiny)
library(shinythemes)
library(tidyverse)
library(patchwork)
library(Hmisc)

# Load data
data <- read_csv("prepared-data.csv", guess_max = 60000)

# Set options
theme_set(theme_bw(base_size = 12))

# UI ----------------------------------------------------------------------

ui <- navbarPage("Essay topic pretest", theme = shinytheme("flatly"),
        tabPanel("Main", 
          sidebarLayout(
            sidebarPanel(width = 3,
              selectInput("topic", label = h4("Topic:"), 
                choices = unique(pull(data, item_short)), 
                selected = "raise tuition fee"),
              selectInput("university", label = h4("University:"), 
                choices = c("all", unique(pull(data, university))), 
                selected = "all"),
              selectInput("gender", label = h4("Gender:"), 
                choices = c("all", unique(pull(data, gender))),
                selected = "all"),
              sliderInput("age", label = h4("Age:"), 
                min = min(pull(data, age), na.rm = TRUE), 
                max = max(pull(data, age), na.rm = TRUE), 
                value = c(min(pull(data, age), na.rm = TRUE), 
                  max(pull(data, age)), na.rm = TRUE))
            ),
            mainPanel(
              plotOutput("plot", height = 600, width = 600),
              textOutput("N")
            )
          )
        ),
        tabPanel("Compare labs", 
          fluidRow(
           column(3,
            wellPanel(
              selectInput("topic_labs", label = h4("Topic:"), 
                choices = unique(pull(data, item_short)), 
                selected = "raise tuition fee"),
              selectInput("center", label = h4("Measure of center:"), 
                choices = c("mean", "median"), 
                selected = "mean"),
              selectInput("variance", label = h4("Measure of variance:"), 
                choices = c("none", "standard deviation", "95% CI"),
                selected = "none")
            ),
            tableOutput("lab_labels")
           ),
            column(width = 9,
              plotOutput("plot_topic_labs", height = 600, width = "100%")
            )
          )
        )
      )


# Server ------------------------------------------------------------------

server <- function(input, output, session) {
  
  rv <- reactiveValues(
      N = "Sample size: "
    )

  output$plot <- renderPlot({
    
    # Filter by topic
    df <- dplyr::filter(data, item_short == input$topic)
    
    # Filter by university
    if (input$university != "all") {
      df <- dplyr::filter(df, university == input$university)
    } else {
      df <- df
    }
    
    # Filter by gender
    if (input$gender != "all") {
      df <- dplyr::filter(df, gender == input$gender)
    } else {
      df <- df
    }
    
    # Filter by age
    df <- dplyr::filter(df, age >= input$age[1] & age <= input$age[2])
    
    # Update text output
    rv$N <- paste("Sample size:", length(unique(pull(df, ID))))
      
    # Create plots
    p_attitude <- ggplot(df, aes(x = attitude)) +
      geom_histogram(bins = 9, fill = "gray", color = "black") + 
      scale_x_continuous(breaks = 1:9)
    
    p_importance <- ggplot(df, aes(x = importance)) +
      geom_histogram(bins = 9, fill = "gray", color = "black") + 
      scale_x_continuous(breaks = 1:9)
    
    p_side <- ggplot(df, aes(x = side)) +
      geom_bar(aes(y = ..prop.., group = 1)) +
      geom_text(aes(label = scales::percent(..prop..), y = ..prop.., group = 1), 
        stat = "count", vjust = -.5) +
      coord_cartesian(ylim = c(0, 1))
    
    p_plausibility <- ggplot(df, aes(x = plausibility)) +
      geom_bar(aes(y = ..prop.., group = 1)) +
      geom_text(aes(label = scales::percent(..prop..), y = ..prop.., group = 1), 
        stat = "count", vjust = -.5) +
      coord_cartesian(ylim = c(0, 1))
    
    # Return a 2 x2 plot grid
    (p_attitude + p_importance) / (p_side + p_plausibility)
  })
  
  observe(output$N <- renderText(HTML(rv$N)))
  
  output$plot_topic_labs <- renderPlot({
    df <- dplyr::filter(data, item_short == input$topic_labs)
    
    # Group data
    df <- group_by(df, university_short)
    
    # Calculate measure of center
    if (input$variance == "none") {
      p_attitude <- ggplot(df, aes(x = university_short, y = attitude)) +
        stat_summary(fun = input$center)
    } else {
      if (input$variance == "standard deviation") {
        p_attitude <- ggplot(df, aes(x = university_short, y = attitude)) +
          stat_summary(fun.data = "mean_sdl", fun.args = list(mult = 1))
      } else {
        p_attitude <- ggplot(df, aes(x = university_short, y = attitude)) +
          stat_summary(fun.data = "mean_cl_boot")
      }
    }
    
    p_attitude <- p_attitude + 
      coord_cartesian(ylim = c(1, 9)) +
      scale_y_continuous(breaks = 1:9) +
      theme_bw(base_size = 14) +
      labs(y = "attitude", x = "university")
    
    p_attitude
  })
  
  observe({
    x <- input$center

    # Can use character(0) to remove all choices
    if (x == "median") {
      choices = c("none")
    } else {
      choices = c("none", "standard deviation", "95% CI")
    }
    # Can also set the label and select items
    updateSelectInput(session, "variance",
      choices = choices,
      selected = first(choices)
    )
  })
  
  output$lab_labels <- renderTable({
    data %>%
      group_by(university) %>%
      slice(1) %>%
      select(university_short, university) %>%
      rename(
        code = university_short
      )
  })
}

# Run the application -----------------------------------------------------

shinyApp(ui = ui, server = server)
# rsconnect::deployApp(appDir = "Shiny/essay-topic-pretest/")
