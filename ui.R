library(shiny)



dashboardPage(skin = "black",
  dashboardHeader(title = div(
    class = "header-title",
    tags$h3("Revenue Optimization in Car Parking Lots", style = "font-size: 18px; margin-top: 10px;")
  ),
  dropdownMenuOutput("notification")
  ),
  dashboardSidebar(
    sidebarMenu(
      menuItem(
        text ="Home", tabName = "home", 
        icon = icon("house", class = "fa-solid fa-registered fa-beat")
      ),
      menuItem(
        text = "Data", tabName = "rawdata",
        icon = icon("database", class = "fa-solid fa-registered fa-beat"),
        menuSubItem(text = "New Subscribers", tabName = "newSubs"),
        menuSubItem(text = "Non-Subscribers", tabName = "gunubirlik"),
        menuSubItem(text = "Arrivals", tabName = "arrivals")
      ),
      menuItem(
        text = "Model", tabName = "model",
        icon = icon("registered", class = "fa-solid fa-registered fa-beat")
      )
    ),
    tags$style(
      type = "text/css",
      HTML(
        #sidebar arkaplanı ayarı
        ".main-sidebar {
           background-image: url('myimage.jpg');
           background-size: cover;
           background-repeat: no-repeat;
           background-position: center center;
         }"
      )
    )
  ),
  dashboardBody(
    tags$style(
      type = "text/css",
      HTML(
        ".content-wrapper {
           background-color:light-gray;
           background-size: cover;
         }"
      )
    ),
    #gifin ayarlanması
    tags$head(tags$style("
       .animated-gif-container {
        margin-bottom: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        position: relative;
        width: 100%;
        height: 100%;
      }
      .animated-gif {
        position: center;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
      }
    ")),
    #butonların görselleştirilmesi
    tags$head(
      tags$style(
        HTML(".activate-button { background-color: #4c86ad; color: white; font-weight: bold; border-radius: 5px; padding: 15px 30px; font-size: 18px; }"),
        HTML(".activate-button:hover { background-color: #326b91; }"),
        HTML(".info-box { padding: 10px; }"),
        HTML(".second-image { margin-bottom: 20px; }"),
        HTML(".refresh-button { background-color: #ad4c4c; color: white; border-radius: 5px; padding: 10px 20px; font-size: 14px; margin-top: 10px; }")
      )
    ),
    tabItems(
      tabItem(tabName ="home",
        h1("Learn About Our Study", class = "text-center", style = "color: info;font-weight: bold;font-family:"),
         fluidRow(
           column(
             width =6,
             box(width = 12,collapsible = TRUE,
               title = "The Objective of Our Study", icon = icon("star"),
              status = "navy",
               solidHeader = TRUE,
               height = 200,
               "The aim of our study is to examine the relationship between price and demand based on the historical data of the parking lot, and to determine the optimum number of new subscribers and subscription fee with the limit of not exceeding the capacity of the parking lot.",
              style = "font-size: 16px;"
             ),
             box(width = 6, collapsible = TRUE,
               title = "Datasets We Use", icon = icon("paperclip"),
               status = "info",
               solidHeader = TRUE,
               height = 200,
               uiOutput("veriSeti"),
               style = "font-size: 16px;"
             ),
             box(width = 6,collapsible = TRUE,
               title = "Our Model",icon = icon("paperclip"),
               status = "maroon",
               solidHeader = TRUE,
               height = 200,
               style = "font-size: 16px;",
               uiOutput(("modelyazısı")) )
           ),
           column(width = 6,
             fluidRow(
              column(
             width = 12,
             div(class = "animated-gif-container",tags$img(src = "Otopark.gif", class = "animated-gif")
           )),
           # column( width = 12,
           #         tags$img(src = "busex.png", alt = "Resim",style = "width: 100%; height: 100%; display: block; margin: 10px auto;")
           #        )
           )),

         )
      ),
      tabItem(
        tabName = "newSubs",
        h1("Monthly Data & Plots for the New Subscriptions",class = "text-center", style = "color: #80B1D3;font-weight: bold;"),
        fluidRow(
          h4("You can choose the type of subscription whose plot and datatable you want to see. In addition, if you want to access the price information, tick the checkbox.",class = "text-center"),
          column(width = 12, 
            box(solidHeader = TRUE, status = "danger",
              title = "  Select a subscription type:",
              icon = icon("hand-pointer"),
              height = "80px",
              selectInput("typeSelector", label = " ", choices = typeChoices)
            ),
            box(background = "aqua",
                width = 6,height = "200px",
                title = "", headerBorder = FALSE,
              checkboxInput(
                "checkbox",
                "Show the price information on the plot.",
                FALSE
              )),
          ),
              column(
            width = 12,
            box(width = 12, 
              plotOutput("newsubs"))
          ),
          column(
            width = 12,
            DTOutput("newsubsdata")
          ))
      ),
      tabItem(
        tabName ="gunubirlik",
        h1("Monthly Data & Plots for the Non-Subscribers",class = "text-center", style = "color: #80B1D3;font-weight: bold;"),
        fluidRow(
          h4("You can select a time range below for the non-subscribed customer group whose Plot and Dataset you want to see. In addition, if you want to access the price information, tick the checkbox." ,class = "text-center"),
          column(
            width = 12,
            box(solidHeader = TRUE, status = "danger",title = "Select an hour interval:",
                icon = icon("hand-pointer"),
              selectInput(
                "hourSelector",
                label = " ",
                choices = HourChoices
              )
            ),
            box(background = "aqua",
              checkboxInput(
                "checkbox2",
                "Show the price information on the plot. ",
                FALSE
              )
            )
          ),
          column(
            width = 12,
            plotOutput("gunluk")
          ),
          column(
            width = 12,
            DTOutput("gunlukdata")
          )
        )
      ),
      tabItem(
        tabName = "arrivals",
        h1("Daily Data & Plots for the Arrivals to the Carpark",class = "text-center", style = "color: #80B1D3;font-weight: bold;"),
        fluidRow(
          h4("You can select a day below to see which customer segment uses the parking lot daily in terms of density. The pie chart on the left shows subscribed customers and employees, and the pie chart on the right shows non-subscribed customers additionally. You can access the plot and datatable showing the daily probabilities of subscribers coming to the parking lot in the Probabilities tab",class = "text-center"),
          tabBox(
            title = " ",
            id = "tabbox1",
            height = "700px",
            width = 12,
                  tabPanel("Daily Usages",icon =icon("chart-pie"),  
                           fluidRow(
                           column(width = 12,
                                  fluidRow(width =12,
                                    column(width =6, 
                                           box(width = 12,title = "Select a day:", icon = icon("hand-pointer"),
                                               
                                               sliderInput(inputId ="obs",animate = TRUE, 
                                                           label = " ",
                                                           min = 1, max = 31, value = 5, step = 1, animationOptions(interval = 5, loop= TRUE, pauseButton = NULL, playButton = NULL)
                                               ))),
                                  column(width = 6,
                                         box(width = 12, background = "teal",title = "The Selected Day is: ",
                                             infoBoxOutput("weekdays", width = 6)))
                             ),
                           column(width = 6, 
                                  box(width = 12,title ="Pie Chart of Daily Usage by Subscriber Group and Staff",
                               plotOutput("pie"))),
                           column(width = 6,
                                  box(width = 12, title = "Pie Chart of Daily Usage by All Customer Groups and Staff",
                               plotOutput("pies")))
                 ))),
                  tabPanel("Probabilities",icon = icon("chart-line"),
                           column(width =12,
                           box(width = 6,title = "Select a subscription type:", icon = icon("hand-pointer"),background = "yellow",
                             selectInput("subSelector",label = " ",
                                                                                  choices = subsChoices)),
                          box(width = 6, background = "maroon",
                            checkboxInput(
                             "checkboxfordaily",
                             "Show the all subscription types in one plot.",
                             FALSE)
                           )),
                          column(width = 12,
                           box(width = 6, height= "550px", title = "Plot of Daily Arrival Probabilities for January 2023",
                               plotOutput("probPlots")),
                           box(width = 6, height = "550px",title = "Table of Daily Arrival Probabilities",
                               DTOutput("probability", width = "100%", height = "100%"))
                          ))))
            ),
      tabItem(tabName = "model",
              h1("Our Model & Optimization Results",class = "text-center", style = "color: #80B1D3;font-weight: bold;"),
              fluidRow(
                h4("The image shown below represents our mathematical model. You can reach the optimized model results by clicking the 'Optimize' button",class = "text-center"),
                column(
                  width = 6,
                  align = "center",
                  img(src = "optresults.jpg", width = "100%", height = "auto"),
                  actionButton("activate_btn", "See the Results", class = "activate-button", style = "margin-top: 20px;"),
                  actionButton("refresh_btn", icon("refresh"), class = "refresh-button")
                ),
                column(
                  width = 6,
                  align = "center",
                  uiOutput("second_image")
                )))
  ),

   
)
)
  





