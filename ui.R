library(shiny)
library(shinyjs)
library(shinydashboard)
library(shinythemes)

shinyUI(fluidPage(theme = shinytheme("superhero"),
                  
                  headerPanel("Aercanaet price prediction"),
                  
                  # Getting User Inputs
                  
                  
                               
                               
                               
                 
                  
                  mainPanel(
                    tabsetPanel(
                      
                    
                      tabPanel("Birur",
                               HTML ("<div><h4> The table depicts the sentiment (positive, negative or neutral) of the tweets 
                      associated with the search hashtag by showing the score for each type of sentiment. </h4></div>"),
                               tableOutput("table1")),
                      tabPanel("Koppa",
                               HTML ("<div><h4> The table depicts the sentiment (positive, negative or neutral) of the tweets 
                      associated with the search hashtag by showing the score for each type of sentiment. </h4></div>"),
                               tableOutput("table2")),
                      tabPanel("Sringeri",
                               HTML ("<div><h4> The table depicts the sentiment (positive, negative or neutral) of the tweets 
                      associated with the search hashtag by showing the score for each type of sentiment. </h4></div>"),
                               tableOutput("table3")),
                      tabPanel("Tarikere",
                               HTML ("<div><h4> The table depicts the sentiment (positive, negative or neutral) of the tweets 
                      associated with the search hashtag by showing the score for each type of sentiment. </h4></div>"),
                               tableOutput("table4")),
                      tabPanel("Channagiri",
                               HTML ("<div><h4> The table depicts the sentiment (positive, negative or neutral) of the tweets 
                      associated with the search hashtag by showing the score for each type of sentiment. </h4></div>"),
                               tableOutput("table5")),
                      tabPanel(" Bhadravathi",
                               HTML ("<div><h4> The table depicts the sentiment (positive, negative or neutral) of the tweets 
                      associated with the search hashtag by showing the score for each type of sentiment. </h4></div>"),
                               tableOutput("table6")),
                      tabPanel("Hosanagara<",
                               HTML ("<div><h4> The table depicts the sentiment (positive, negative or neutral) of the tweets 
                      associated with the search hashtag by showing the score for each type of sentiment. </h4></div>"),
                               tableOutput("table7")),
                      tabPanel("Sagara",
                               HTML ("<div><h4> The table depicts the sentiment (positive, negative or neutral) of the tweets 
                      associated with the search hashtag by showing the score for each type of sentiment. </h4></div>"),
                               tableOutput("table8")),
                      tabPanel("Shivamogga",
                               HTML ("<div><h4> The table depicts the sentiment (positive, negative or neutral) of the tweets 
                      associated with the search hashtag by showing the score for each type of sentiment. </h4></div>"),
                               tableOutput("table9")),
                      tabPanel("Thirthahalli",
                               HTML ("<div><h4> The table depicts the sentiment (positive, negative or neutral) of the tweets 
                      associated with the search hashtag by showing the score for each type of sentiment. </h4></div>"),
                               tableOutput("table10")),
                      tabPanel("Shikaripura",
                               HTML ("<div><h4> The table depicts the sentiment (positive, negative or neutral) of the tweets 
                      associated with the search hashtag by showing the score for each type of sentiment. </h4></div>"),
                               tableOutput("table11")),
                     
                      tabPanel("diffgragh",
                               HTML ("<div><h4> The table depicts the sentiment (positive, negative or neutral) of the tweets 
                      associated with the search hashtag by showing the score for each type of sentiment. </h4></div>"),
                               plotOutput("scaledGraph"))
                      
                      
                      
                      )
                      )
                  
                      ))
