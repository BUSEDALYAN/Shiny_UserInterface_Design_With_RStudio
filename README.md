# Shiny_UserInterface_Development_With_RStudio
Shiny was used in the project to design the user interface. Shiny is an open-source R package that enables the creation of web-based interfaces with the R programming language.

# INTERFACE DESIGN BY USING SHINY PACKAGE
An app was designed using the Shiny package in the R environment. Multiple pages were used.

In ui.R, the user interface that the user sees and uses in the app is designed.

In server.R, the codes that will provide outputs such as graphics and data tables used for the user interface are working.

In global.R, general processes such as libraries used in app design and drawing data sets have been completed.
    
### Detailed information can be found below.
    
# IMPLEMENTATION OF USER INTERFACE
At the final stage of the project, the analyses made throughout the project are combined into one app. This app informs the user about the data in the study and presents the analysis resulting from the model. R's Shiny package was used to design the app. Shiny is an open-source R package that enables the creation of web-based interfaces with the R programming language.
     
![image](https://github.com/BUSEDALYAN/Shiny_UserInterface_Development_With_RStudio/assets/79102386/d762acca-15de-409a-af43-c9e915b7439e)

Flow-Chart of User Interface

The points taken into consideration while preparing the interface are presenting the data used to reach the model, the graphics prepared and the optimization results of the model to the user. In addition, it is to enable the user to experience reactive use while examining the interface. To provide these, Shiny Dashboard was prepared, and an interface was designed that conveys extensive information about the project to the user.


     
## a. Interface Design of the Homepage

A homepage was designed to give general information to users before examining the project. This is the first option in our home menu. As seen in Figure a.1, this page consists of information boxes containing the purpose of the study, the data used in the study, and general information about the model. The parking simulation prepared for visualization and presented to the user.

![image](https://github.com/BUSEDALYAN/Shiny_UserInterface_Development_With_RStudio/assets/79102386/d189d0ad-e906-41b1-866a-8abaa23bb843)

Figure a.1 View of the Homepage

## b. Interface Design of Data Pre-processing Results

Tables and graphics of the data used for the preparation of the model were presented as the second option in the menu. This section consists of 3 different subsections as shown in Figure b.1.

![image](https://github.com/BUSEDALYAN/Shiny_UserInterface_Development_With_RStudio/assets/79102386/5d7bf141-b4ec-4f60-a0c3-d4110dc909a7)


Figure b.1 Menu Bar of the Shiny Dashboard

First, the New Subscribers section has been added. For a more reactive effect with the user, there is a select input section that brings the user a graph and table of the selected subscriber type, as shown in Figure b.2. The change of the subscriber type selected by the user, in the date range of the data, the change in the number of new subscriptions can be seen with the bar graph, and the data table for the selected subscriber type has been added at the end of the page as can be seen in Figure b.3.

![image](https://github.com/BUSEDALYAN/Shiny_UserInterface_Development_With_RStudio/assets/79102386/9eabaf58-d68f-4502-b745-8f8a83037199)


Figure b.2 Input Panel for New Subscribers Section

![image](https://github.com/BUSEDALYAN/Shiny_UserInterface_Development_With_RStudio/assets/79102386/18a52027-61b0-4ba7-b117-80b4f151396f)


Figure b.3 New Subscribers Menu

On this page, if the user wants to see the new subscription status change together with the price change, the checkbox can be ticked. As shown in Figure b.5, a message notification appears on the page when the checkbox is checked. This notification informs the user that the prices are adjusted for inflation and change of new subscriber numbers with price are also shown in the Figure b.6.

![image](https://github.com/BUSEDALYAN/Shiny_UserInterface_Development_With_RStudio/assets/79102386/cd29da4d-7291-4bba-8644-c4c84839f703)

Figure b.4 Checkbox input

![image](https://github.com/BUSEDALYAN/Shiny_UserInterface_Development_With_RStudio/assets/79102386/c2d172aa-1394-4d3a-a236-f9d6041fd0ce)


Figure b.5 Message Item

![image](https://github.com/BUSEDALYAN/Shiny_UserInterface_Development_With_RStudio/assets/79102386/70a5557a-bc44-4dc2-aea1-bd94b6179c53)


Figure b.6 View of the New Subscriber Submenu

In the second subsection of the data menu option, there is the Unsubscribed section. In this section, an option input has been added for the user to use the page reactively. Here, the user can select the time intervals in which non-subscribed customer groups are priced and see the bar plot showing the monthly average change in the time period of the data of this customer group, and the data table at the bottom as can be seen in the following Figure b.8.

![image](https://github.com/BUSEDALYAN/Shiny_UserInterface_Development_With_RStudio/assets/79102386/bd8ac36c-7f31-4817-b472-420f94c10433)


Figure b.7 Input Panel for New Subscribers Section

![image](https://github.com/BUSEDALYAN/Shiny_UserInterface_Development_With_RStudio/assets/79102386/8ba945ad-a4d7-4c95-893d-9d86b62d68ab)

Figure b.8 Total View of the Non-subscribers Submenu

Likewise, a checkbox has been placed on this page, where the user can tick if he/she prefers to see the price information on the chart.

As the third subsection of the data menu option, the parking arrival data is presented to the user. This part was prepared in two different tab panels.

In the first tab panel, there is the slider input shown in Figure b.9. This input contains the days of a month. In this section, the user can select one of the days of the month in which the data is received to observe the ratio of the customer groups using the parking lot with each other.

![image](https://github.com/BUSEDALYAN/Shiny_UserInterface_Development_With_RStudio/assets/79102386/23a17a48-b38a-4856-af3d-0336a6edfddf)


Figure b.9 Slider Input

As in Figure b.10, pie charts for the selected day appear on the page. The pie chart on the left shows the daily use of the parking lot by the subscribed customers and staff, and the pie chart on the left shows the subscribed customers and staff, as well as the non-subscribed customers. In addition, next to the slider input there is a reactive notification in the info box that the selected day is a weekday or a weekend. Thus, the user can observe which customer group uses the car park predominantly. In addition, as seen in Figure b.9, the user can also examine the transition between days in the form of animation with the button added to the slider input part.

![image](https://github.com/BUSEDALYAN/Shiny_UserInterface_Development_With_RStudio/assets/79102386/26827d06-1a81-4c18-88a8-ea685b011dd9)

Figure b.10 Total View of the Arrivals Submenu (Tab Panel 1)

The second tab panel provides users the probabilities of subscribed customers and staff to come to the parking lot. Here the user selects a subscriber type or staff in the selection input part as seen in the Figure b.11. At the bottom of the page, the line graph showing the daily probabilities of using the parking lot for the subscriber type selected by the user, and the data table for the selected subscription type appear next to the line graph.

![image](https://github.com/BUSEDALYAN/Shiny_UserInterface_Development_With_RStudio/assets/79102386/d7084318-0072-4c50-8ba2-7e7ac1f50905)


Figure b.11 Input Panel for New Subscribers Section

Also, if the user wants to observe all probabilities on one graph, the checkbox shown in Figure b.13, next to the option input can be ticked. Thus, the probabilities of daily use of the parking lot within a month by the subscribers and additionally the staff can be seen on a graph.

![image](https://github.com/BUSEDALYAN/Shiny_UserInterface_Development_With_RStudio/assets/79102386/3f72790c-f451-4c98-ba83-2eaab39e7b6c)


Figure b.12 Total View of the Arrivals Submenu (Tab Panel 2)

![image](https://github.com/BUSEDALYAN/Shiny_UserInterface_Development_With_RStudio/assets/79102386/2602ab8c-a4d1-4a21-9451-124628c43a54)


Figure b.13 Checkbox Input for the Probabilities

## c. Interface Design of Model Results

The plot obtained as a result of the model is presented to the user in the model section. Here, the user can click the 'See the Result' button and see the output of the results on the side of the page. The full view of the model menu is shown in Figure c.1. 

![image](https://github.com/BUSEDALYAN/Shiny_UserInterface_Development_With_RStudio/assets/79102386/4cc9afff-0448-4703-8f10-fde9169fc087)


Figure c.1 View of the Model Menu

















