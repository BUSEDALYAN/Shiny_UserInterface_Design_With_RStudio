


function(input, output, session) {

  filterData <- reactive({
    
    filteredData <- firstData[firstData$SubscriptionType == input$typeSelector,]
    
  return(filteredData)
  })
  
  Sys.setlocale("LC_TIME", "English")
  
  output$newsubs <- renderPlot({
    
    if(input$checkbox == TRUE) {
    
     ggplot(data = filterData(), aes(x = Date, y = NumberofNewSubscribers, fill = Price))+
      geom_bar(stat = "identity")+
      scale_x_date(NULL, date_breaks  = "1 month", date_labels = "%b %y")+
      theme(axis.text.x = element_text(angle = 90), legend.position = "top")+
      ggtitle(paste0("New Subscriptions for ", input$typeSelector, " Subscribers"))+
      xlab("years")+
      ylab(" Number of New Subscribers ")+
      theme(panel.background = element_rect(fill = "transparent", colour ="grey"),
            plot.background = element_rect(fill = "transparent", color = "lightgrey"),
            panel.grid = element_line(colour = "red", linetype = "dotted"),
            legend.position = "left")
      
    } else {
      ggplot(data = filterData(), aes(x = Date, y = NumberofNewSubscribers))+
        geom_bar(stat = "identity",fill = "#80B1D3")+
        scale_x_date(NULL, date_breaks  = "1 month", date_labels = "%b %y")+
        theme(axis.text.x = element_text(angle = 90), legend.position = "top")+
        ggtitle(paste0("New Subscriptions for ", input$typeSelector, " Subscribers"))+
        xlab("years")+
        ylab(" Number of New Subscribers ")+
        theme(panel.background = element_rect(fill = "transparent", colour ="grey"),
              plot.background = element_rect(fill = "transparent", color = "lightgrey"),
              panel.grid = element_line(colour = "red", linetype = "dotted"),
              legend.position = "left")
    }
  })
  
  filtData <- reactive({
    
    filtered <- firstData[firstData$SubscriptionType == input$typeSelector,]
    
  return(filtered)
  })

  output$newsubsdata <- renderDataTable({
    
    datatable(filtData(),options = list(lenghtMenu = c(5,10,15),
                                        pageLength=5,
                                        autoWidth = TRUE))
  })
  
  
  filteredGunluk <- reactive({
    
    filt <- Gunlukler[Gunlukler$DurationofStayinHours == input$hourSelector,]
    
    return(filt)
    
    
  })
  
  output$gunluk <- renderPlot({
    
    if(input$checkbox2 == TRUE) {
      
      ggplot(data = filteredGunluk(), aes(x = date, y = averagecustomer, fill = price))+
        geom_bar(stat = "identity")+
        scale_x_date(NULL, date_breaks  = "1 month", date_labels = "%b %y")+
        theme(axis.text.x = element_text(angle = 90), legend.position = "top")+
        ggtitle(paste0("Average Number of Non-Subscribed Customers Stays ", input$hourSelector))+
        xlab("years")+
        ylab(" Average Number of Non-Subscribed Customers ")+
        theme(panel.background = element_rect(fill = "transparent", colour ="grey"),
              plot.background = element_rect(fill = "transparent", color = "lightgrey"),
              panel.grid = element_line(colour = "red", linetype = "dotted"),
              legend.position = "left")
      
    } else {
      ggplot(data = filteredGunluk(), aes(x = date, y = averagecustomer))+
        geom_bar(stat = "identity",fill = "#80B1D3")+
        scale_x_date(NULL, date_breaks  = "1 month", date_labels = "%b %y")+
        theme(axis.text.x = element_text(angle = 90), legend.position = "top")+
        ggtitle(paste0("Average Number of Non-Subscribed Customers Stays ", input$hourSelector))+
        xlab("years")+
        ylab(" Average Number of Non-Subscribed Customers ")+
        theme(panel.background = element_rect(fill = "transparent", colour ="grey"),
              plot.background = element_rect(fill = "transparent", color = "lightgrey"),
              panel.grid = element_line(colour = "red", linetype = "dotted"),
              legend.position = "left")
    }
  })
  
  filtData2 <- reactive({
    
    filtered2 <- Gunlukler[Gunlukler$DurationofStayinHours == input$hourSelector,]
    filtered2 <- filtered2[,-1]
    return(filtered2)
  })
  
  output$gunlukdata <- renderDataTable({
    
    datatable(filtData2(),options = list(lenghtMenu = c(5,10,15),
                                         pageLength=5,
                                         autoWidth = TRUE))
  })
  
  filtData4 <- reactive({
    
    filtered4 <- probData[probData$subscription == input$subSelector,]
    return(filtered4)
  })
  output$probPlots <- renderPlot({
    
    if(input$checkboxfordaily == TRUE) {
      
      ggplot(data=probData, aes(x = day, y = prob, color =subscription,
                                linetype = subscription, shape=subscription )) +
        geom_point() +
        geom_line()+
        scale_x_discrete(limits=as.factor(c(1:31)))+
        xlab("Days")+
        ylab("Probabilities")
    }else{
      ggplot(data=filtData4(), aes(x = day, y = prob))+
        geom_line()+
        geom_point()+
        scale_x_discrete(limits=as.factor(c(1:31)))+
        xlab("Days")+
        ylab("Probabilities")
    }
    })
  
  filtData3 <- reactive({
    
    filtered3 <- probData[probData$subscription == input$subSelector,]
    return(filtered3)
  })
  
  output$probability <- renderDataTable({
    
    datatable(filtData3(),options = list(lenghtMenu = c(7,10,15),
                                         pageLength=7,
                                         autoWidth = FALSE,
                                         columnDefs = list(list(
                                           width = '150px',
                                           targets =1
                                         ))))
  })
  
  filtData5 <- reactive({
    filtered5 <- filter(usageData, usageData$day == as.numeric(input$obs))
    return(filtered5)
  })
  
  output$pie <- renderPlot({
    
    ggplot(filtData5(), aes(x="", y= arrivals, fill = subscription))+
      geom_bar(stat = "identity", width = 1, color = "white")+
      scale_fill_brewer(palette = "Set3")+
      coord_polar("y", start = 0) +
      theme(panel.background = element_rect(fill = "transparent", colour = NA))
  })
  
  filtData6 <- reactive({
    
    filtered6 <- filter(pies, pies$day == as.numeric(input$obs))
    return(filtered6)
  })
    
  output$pies <- renderPlot({
    
    ggplot(filtData6(), aes(x="", y = arrivals, fill = type))+
      geom_bar(stat = "identity", width = 1, color = "white")+
      coord_polar("y", start = 0)+
      scale_fill_brewer(palette = "Set3")+
      theme(panel.background = element_rect(fill = "transparent", colour = NA))
  })
  
  observeEvent(input$checkbox, {
    if (input$checkbox) {
      output$notification <- renderMenu({
        dropdownMenu(type = "message",
                     notificationItem(
                       text = "Prices are adjusted for inflation.",
                       status = "primary"
                     ))
      })
    }else{
      output$notification <- renderMenu({
        dropdownMenu(type = NULL)
      })
    }
  })
  
  observeEvent(input$checkbox2, {
    if (input$checkbox2) {
      output$notification <- renderMenu({
        dropdownMenu(type = "message",
                     notificationItem(
                       text = "Prices are adjusted for inflation.",
                       status = "danger"
                     )
        )
      })
      
    }else{
      output$notification <- renderMenu({
        dropdownMenu(type = NULL)
      })
    }
  })
  
  ##homepage'deki veri seti yazısı
  output$veriSeti <- renderUI({
    div(HTML("The data used in our study belong to Çağlayan Parking Lot in Istanbul. There are 3 different data:.<br> <br> The first dataset shows the new subscription information to the car park between 2020-2023.
             <br> <br> The second data shows the daily parking usage of non-subscribed customers between 2021-2023. <br> <br> The third dataset shows the arrivals to the car park information of subscribers in January 2023.
             <br> <br> With these datasets, the dataframes that will be required for our work have been rearranged in R. Datatables and plots arranged in Menu > Data are shown."))
  })
  output$modelyazısı <- renderUI({
    div(HTML("Using the data we received from Çağlayan Parking Lot, we created our revenue optimization problem with Log-linear regression as a result of the non-linear relationship we observed in 12-month subscriptions. We added the capacity constraint to the function with Lagrange Relaxation. 
             <br> <br> Then we calculated the local maximum point of the optimization problem with the Gradient Descent method. As a result of the calculations, we reached the optimum price and the expected number of subscribers.
             <br> <br> You can see the mathematical model and model results in Menu > Model."))
  })
  ##Haftaiçi-haftasonu gösteren infobox
  theDay <- reactive({
    numb <- as.numeric(input$obs)
    return(numb)
  })
  
  output$weekdays <- renderUI({
    if (theDay() %in% c(1, 7,8,14,15,21,22,28,29)) {
      infobox <- tags$div(
        class = "infobox",
        h4(p(paste("The Weekend!")))
      )
    } else {
      infobox <- tags$div(
        class = "infobox",
        h4(p(paste(" A Weekday!")))
      )
    }
    
    return(infobox)
  })
  
  ##model kısmındaki image + infoboxlar
  second_image <- reactiveVal(FALSE)
  
  observeEvent(input$activate_btn, {
    second_image(TRUE)
  })
  observeEvent(input$refresh_btn, {
    second_image(FALSE)
  })
  output$second_image <- renderUI({
    if (second_image()) {
      fluidRow(
        column(
          width = 12,
          align = "center",
          div(
            class = "second-image",
            #img(src = "optresults.jpg", width = "100%", height = "auto"),
            fluidRow(
              h4("Constrained Optimization Model Results"),
              column(
                width = 12,
                box(width = 4, title = "Optimum Price for 12-Month Subscription",
                    div(
                      class = "info-box",
                      infoBox(
                        title = "Info Box 1",
                        value = "2151.665₺",color = "orange",
                        icon = icon("ticket")
                      )
                    )
                
              ),
              box( width = 4,title = "Expected number of  12-Month Subscribers",
                   div(
                     class = "info-box",
                     infoBox(
                       title = "Info Box 2",
                       value = "≌19",color = "aqua",
                       icon = icon("person-dress"))
              
                )
              ),
              box( width = 4,title = "Expected Revenue from 12-Month Subscribers",
                   div(
                     class = "info-box",
                     infoBox(
                       title = "Info Box 2",
                       value = "39147.06₺",color = "green",
                       icon = icon("money-bill"))
                     
                   )
              )
             
              
              
            )
          ),
          fluidRow(
            h4("Unconstrained Optimization Model Results"),
            column(
              width = 12,
              box(width = 4, title = "Optimum Price for 12-Month Subscription",
                  div(
                    class = "info-box",
                    infoBox(
                      title = "Info Box 1",
                      value = "2469.921₺",color = "orange",
                      icon = icon("ticket")
                    )
                  )
                  
              ),
              box( width = 4,title = "Expected number of  12-Month Subscribers",
                   div(
                     class = "info-box",
                     infoBox(
                       title = "Info Box 2",
                       value = "≌16",color = "aqua",
                       icon = icon("person-dress"))
                     
                   )
              ),
              box( width = 4,title = "Expected Revenue from 12-Month Subscribers",
                   div(
                     class = "info-box",
                     infoBox(
                       title = "Info Box 2",
                       value = "39505.48₺",color = "green",
                       icon = icon("money-bill"))
                     
                   )
              )
              
              
              
            )
          )
        )
      ))
    }
  })
    
  
  }


  