#library(dplyr)
#library(stringr)
#library(ggplot2)
#library(shiny)
#library(plotly)
library(rsconnect)

source("finalproject_deliverable.R") #loads in your analysis file


final_story <- read.csv("merged_data.csv") #DO NOT CHANGE!

ui <- fluidPage(
  navbarPage("Looking at COVID Rates",
             tabPanel("Understanding COVID Infection rates",
                      titlePanel("County Infection Rates"),
                      br(),
                      p("The COVID-19 pandemic has had a profound impact on the global tourism industry, disrupting travel patterns, 
                        imposing travel restrictions, and causing a significant decline in tourist arrivals. In this interactive analysis, we will 
                        explore the effects of the pandemic on tourism, examining counties based on rate of infections. Through interactive elements and visualizations, 
                        we aim to provide a comprehensive understanding of the challenges faced by the tourism sector during this unprecedented crisis."),
                      br(),
                      p("To begin our exploration, let's analyze the rates of infections in different counties during the pandemic. Use the Shiny widget below 
                        to select one or more counties and observe the rates of infections in different counties."),
                      br(),
                      
                    
                      sidebarLayout(
                        sidebarPanel(
                          selectInput(inputId = "counties", label = "Select Counties",
                                      choices = unique(merged_data$county), multiple = TRUE)
                        ),
                        mainPanel(
                          plotOutput(outputId = "countiesPlot")
                        ),
                        
                      ),
                      br(),
                      p("The chart will dynamically update to display the rates of infections for the selected county over time."),
                      br(),
                      titlePanel("State Infection Rates"),
                      br(),
                      p("Zooming out a bit, we start to think about how the pandemic impacted the United States,
    in general. Here, we have presented something similar to the graph above, but instead
    of counties in California, this graph portrays COVID cases within the entirety of
    the United States."),
                      br(),
                      p("The COVID-19 pandemic has had far-reaching consequences beyond its immediate health effects, including a 
                        profound impact on poverty levels in the United States. In this interactive analysis, we will delve into how 
                        the pandemic has influenced poverty, examining the infection rates by state. Through  visualizations, we aim to 
                        provide a comprehensive understanding of the challenges faced by individuals and communities in the wake of the pandemic."),
                      br(),
                      p("To begin our exploration, let's examine the changes in infection rates resulting from the COVID-19 pandemic. Use 
                        the interactive chart below to select a specific state or region and observe the infection rates over time."),
                      sidebarLayout(
                        sidebarPanel(
                          selectInput(inputId = "states", label = "Select States",
                                      choices = unique(merged_data$state), multiple = TRUE)
                        ),
                        mainPanel(
                          plotOutput(outputId = "statesPlot")
                        )
                      ),
                      br(),
                      p("The chart will dynamically update to display the infection rates for the selected area."),
                      br(),
                      
                      titlePanel("Infection Rates by Date Within US States"),
                      br(),
                      p("The COVID-19 pandemic has profoundly impacted the U.S. economy. This article highlights key aspects of this impact, 
                        including a decline in GDP, business closures, and government interventions. Understanding these effects provides insights
                        into the economic challenges faced during this global crisis."),
                      br(),
                      p("This graph gives us another perspective of the same information that was shown
    above. As the user, you can select one or multiple dates to see which US states had 
    reported cases, and how many."),
                      br(),
                      p("As you can see, the x-axis shows the states where these cases were recorded, 
  and the y-axis shows the infection rates themselves."),
                      sidebarLayout(
                        sidebarPanel(
                          selectInput(inputId = "dates", label = "Select Dates",
                                      choices = unique(merged_data$submission_date), multiple = TRUE)
                        ),
                        mainPanel(
                          plotOutput(outputId = "datesPlot")
                        ),
                  
                      ),
                      br(),
                      p("COVID-19 significantly affected the U.S. economy, leading to a decline in GDP, widespread business closures, and job losses. 
                      However, government interventions played a crucial role in mitigating the impact by providing support to businesses and individuals. 
                        Understanding these effects helps grasp the challenges faced and the steps taken to stabilize and revive the economy during this unprecedented crisis."),
                      
                      br(),
                      titlePanel("Share your experiences below"),
                      textAreaInput("caption", "We wanted our users to have the opportunity to share any notable experiences they had during isolation", ""),
                      verbatimTextOutput("value")),
             
             
             tabPanel("About our Project and Takeaways",
                      titlePanel("Major Takeaways from COVID-19 Infection Rates Analysis"),
                      br(),
                      h3("Introduction:"),
                      br(),
                      p("Throughout this project, we conducted an in-depth analysis of COVID-19 infection rates in different regions, focusing on counties
                        in counties in California and the United States as a whole. Our findings shed light on the impact of the pandemic, highlighting key
                        insights that can help understand the spread of the virus and its implications. This analysis was conducted using the dyplr library in R,
                        along with other essential packages such as stringr, ggplot2, and shiny."),
                      br(),
                      h3("Key Takeaway: Understanding the Regional Impact of COVID-19"),
                      br(),
                      p("Our main takeaway from this analysis is the significant variation in COVID-19 infection rates across different regions. By examining infection 
                        rates at the county and state levels, we can discern patterns and identify areas that were most severely affected by the pandemic. This information
                        is crucial for public health officials, policymakers, and individuals alike, as it helps inform targeted interventions, resource allocation, and decision-making processes."),
                      br(),
                      h3("County Infection Rates:"),
                      br(),
                      p("We examined the COVID-19 infection rates in various counties within California. The graph below illustrates the number 
                        of cases within each county on specific dates."),
                      br(),
                      p("From the graph, we can observe the following:"),
                      br(),
                      p("Infection Rate Variations: The infection rates varied significantly among counties, with some experiencing higher peaks compared to others. 
                        This indicates the localized nature of the pandemic and highlights the importance of implementing region-specific measures to control the spread."),
                      br(),
                      p("Timelines of Infection: The graph reveals the progression of infections over time, showcasing when specific counties experienced surges or declines. This information can help 
                        in identifying potential hotspots, understanding transmission dynamics, and guiding targeted response efforts."),
                      br(),
                      h3("State Infection Rates:"),
                      br(),
                      p("We also examined the COVID-19 infection rates across the United States as a whole. The graph below displays the infection rates for selected states on different dates."),
                      br(),
                      p("Key observations from the graph include:"),
                      br(),
                      p("Variations Across States: The infection rates varied significantly among different states, highlighting the varying impacts of the pandemic across the country. This regional 
                        disparity emphasizes the need for tailored strategies to combat the virus based on local conditions."),
                      br(),
                      p("Temporal Patterns: The graph showcases the temporal patterns of infection rates, indicating the rise and fall of cases in different states over time. These patterns can provide insights into the effectiveness of interventions, 
                        the impact of policy measures, and the potential for future outbreaks."),
                      br(),
                      h3("Conclusion:"),
                      br(),
                      p("Our analysis of COVID-19 infection rates demonstrates the importance of understanding regional variations and temporal patterns in combating the pandemic. The insights gained from this analysis can aid policymakers 
                        in implementing targeted interventions and resource allocation strategies. Furthermore, individuals can make informed decisions regarding their health and safety by considering the localized impact of the virus. By 
                        leveraging data and analysis, we can collectively work towards mitigating the spread of COVID-19 and protecting public health."),
                      br(),
                      p("Dataset Source: The dataset used in this analysis was obtained from the State of California and the U.S. Dept. of Health & Human Services and comprises comprehensive records of COVID-19 cases in various counties and states."),
                      br(),
                      p("Researched by Nandita Raman, Sarah Volynsky, and Huy Bui")
                      
              
                      
  )
  
),
)


#server stuff goes here
server <- function(input, output) {
  output$countiesPlot <- renderPlot({
    ca_infections(input$counties)
  })
  
  output$statesPlot <- renderPlot({
    states_infections(input$states)
  })
  
  output$datesPlot <- renderPlot({
   dates_infections(input$dates)
  })
  output$value <- renderText({ input$caption })
  
}

#Make the app
shinyApp(ui, server)