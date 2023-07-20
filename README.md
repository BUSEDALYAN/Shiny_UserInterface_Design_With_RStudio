# Shiny_UserInterface_Development_With_RStudio
Shiny was used in the project to design the user interface. Shiny is an open-source R package that enables the creation of web-based interfaces with the R programming language.

   INTERFACE DESIGN BY USING SHINY PACKAGE
    An app was designed using the Shiny package in the R environment. Multiple pages were used.
    In ui.R, the user interface that the user sees and uses in the app is designed.
    In server.R, the codes that will provide outputs such as graphics and data tables used for the user interface are working.
    In global.R, general processes such as libraries used in app design and drawing data sets have been completed.
    
    Detailed information can be found below.
    
   IMPLEMENTATION OF USER INTERFACE
    At the final stage of the project, the analyses made throughout the project are combined into one app. This app informs the user about the data in the study and presents the analysis resulting from the model. R's Shiny package was used to design the app. Shiny is an open-source R package that enables the creation of web-based interfaces with the R programming language.
     
Figure 5.5 Flow-Chart of User Interface 

     The points taken into consideration while preparing the interface are presenting the data used to reach the model, the graphics prepared and the optimization results of the model to the user. In addition, it is to enable the user to experience reactive use while examining the interface. To provide these, Shiny Dashboard was prepared, and an interface was designed that conveys extensive information about the project to the user.
     
1.1 Interface Design of the Homepage

     A homepage was designed to give general information to users before examining the project. This is the first option in our home menu. As seen in Figure 7.1.1, this page consists of information boxes containing the purpose of the study, the data used in the study, and general information about the model. The parking simulation prepared for visualization and presented to the user.

Figure 7.1 View of the Homepage

1.2 Interface Design of Data Pre-processing Results

     Tables and graphics of the data used for the preparation of the model were presented as the second option in the menu. This section consists of 3 different subsections as shown in Figure 7.2.1.

Figure 7.2 Menu Bar of the Shiny Dashboard

      First, the New Subscribers section has been added. For a more reactive effect with the user, there is a select input section that brings the user a graph and table of the selected subscriber type, as shown in Figure 7.2.2. The change of the subscriber type selected by the user, in the date range of the data, the change in the number of new subscriptions can be seen with the bar graph, and the data table for the selected subscriber type has been added at the end of the page as can be seen in Figure 7.2.3.

Figure 7.3 Input Panel for New Subscribers Section

Figure 7.4 New Subscribers Menu
      On this page, if the user wants to see the new subscription status change together with the price change, the checkbox can be ticked. As shown in Figure 7.2.4, a message notification appears on the page when the checkbox is checked. This notification informs the user that the prices are adjusted for inflation and change of new subscriber numbers with price are also shown in Figure 7.2.5.

Figure 7.5 Checkbox input
         

Figure 7.6 Message Item

Figure 7.7 View of the New Subscriber Submenu
      In the second subsection of the data menu option, there is the Unsubscribed section. In this section, an option input has been added for the user to use the page reactively. Here, the user can select the time intervals in which non-subscribed customer groups are priced and see the bar plot showing the monthly average change in the time period of the data of this customer group, and the data table at the bottom as can be seen in the following Figure 7.2.7 and Figure 7.2.8.

Figure 7.8 Input Panel for New Subscribers Section

Figure 7.9 Total View of the Non-subscribers Submenu
      Likewise, a checkbox has been placed on this page, where the user can tick if he/she prefers to see the price information on the chart. As in Figure 7.2.5, the message that is active when the checkbox is checked states that the prices are non-inflationary.
      As the third subsection of the data menu option, the parking arrival data is presented to the user. This part was prepared in two different tab panels.
      In the first tab panel, there is the slider input shown in Figure 7.2.9. This input contains the days of a month. In this section, the user can select one of the days of the month in which the data is received to observe the ratio of the customer groups using the parking lot with each other.

Figure 7.10 Slider Input
      As in Figure 7.2.10, pie charts for the selected day appear on the page. The pie chart on the left shows the daily use of the parking lot by the subscribed customers and staff, and the pie chart on the left shows the subscribed customers and staff, as well as the non-subscribed customers. In addition, next to the slider input there is a reactive notification in the info box that the selected day is a weekday or a weekend. Thus, the user can observe which customer group uses the car park predominantly. In addition, as seen in Figure 7.2.9, the user can also examine the transition between days in the form of animation with the button added to the slider input part.

Figure 7.11 Total View of the Arrivals Submenu (Tab Panel 1)

      The second tab panel provides users the probabilities of subscribed customers and staff to come to the parking lot. Here the user selects a subscriber type or staff in the selection input part as seen in the Figure 7.2.11. At the bottom of the page, the line graph showing the daily probabilities of using the parking lot for the subscriber type selected by the user, and the data table for the selected subscription type appear next to the line graph.

Figure 7.12 Input Panel for New Subscribers Section
      Also, if the user wants to observe all probabilities on one graph, the checkbox shown in Figure 7.2.13, next to the option input can be ticked. Thus, the probabilities of daily use of the parking lot within a month by the subscribers and additionally the staff can be seen on a graph.

Figure 7.13 Total View of the Arrivals Submenu (Tab Panel 2)

Figure 7.14 Checkbox Input for the Probabilities

1.3 Interface Design of Model Results

     The plot obtained as a result of the model is presented to the user in the model section. Here, the user can click the 'See the Result' button and see the output of the results on the side of the page. The full view of the model menu is shown in Figure 7.3.1. 

Figure 7.15 View of the Model Menu

















