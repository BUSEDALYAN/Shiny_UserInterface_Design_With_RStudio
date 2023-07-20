library(shiny)
library(shinydashboard)
#install.packages("dashboardthemes")
library(dashboardthemes)
library(shinythemes)
#install.packages("htmlwidgets")
#install.packages("shinytheme")
#install.packages("shinydashboardThemes")
#install.packages("shinydashboardThemes")
library(htmltools)
library(ggplot2)
library(DT)
library(readr)
library(dplyr)
library(lubridate)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(fitdistrplus)
library(ggthemes)
#install.packages("shinydashboardPlus")
library(shinydashboardPlus)
#library(shiny)
#install.packages("RColorBrewer")
library(RColorBrewer)
library(fresh)


my_skin <- "#FFB6C1"

?Sys.setlocale("LC_TIME", "English")

firstData <- as.data.frame(read_csv("C:/Users/busee/OneDrive/Belgeler/R ile Programlama/GE400 Bitirme/sh1.csv"))

firstData <- firstData[,c(2,3,4,5)]
colnames(firstData) <- c("Date","NumberofNewSubscribers", "Price", "SubscriptionType")
#firstData$date <- ymd(firstData$date)
#str(firstData)

typeChoices<- unique(firstData$SubscriptionType)

#secondData <- as.data.frame(read_csv("C:/Users/busee/OneDrive/Belgeler/R ile Programlama/GE400 Bitirme/secondData.csv"))
#str(secondData)


#thirdData <- as.data.frame(read_csv("C:/Users/busee/OneDrive/Belgeler/R ile Programlama/GE400 Bitirme/ThirdData.csv"))
#str(thirdData)


#typeChoices <- unique(firstData$type)

Gunlukler <-as.data.frame(read_csv("C:/Users/busee/OneDrive/Belgeler/R ile Programlama/GE400 Bitirme/Gunlükler.csv"))
HourChoices <- unique(Gunlukler$DurationofStayinHours)

Probs <- as.data.frame(read_csv("C:/Users/busee/OneDrive/Belgeler/R ile Programlama/GE400 Bitirme/probdata.csv"))
usageData <- Probs[,-c(1,6)]
probData <- Probs[,-c(1,3,6)]
probData$prob <- round(probData$prob,2)


subsChoices <- unique(probData$subscription)

pies <- as.data.frame(read_csv("C:/Users/busee/OneDrive/Belgeler/R ile Programlama/GE400 Bitirme/yeni.csv"))

yıllık_1 <-as.data.frame(read_csv("C:/Users/busee/OneDrive/Belgeler/R ile Programlama/GE400 Bitirme/yıllık_1.csv"))
yıllık_1 <- yıllık_1[,-1]
