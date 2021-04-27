library(tidyverse)
library(ggplot2)
library(plotly)
library(dplyr)
library(shiny)

names(tom_data)
head(tom_data)

groupeddata <- tom_data %>%
  summarize(sum.rating =sum(rating),
            sum.box = sum(box),
            count(tom_data,vars= actor, wt_var = year))

groupeddata <- groupeddata %>% 
  rename(
    Actor = vars,
    Year = wt_var,
    Occurrence = n
  )

## Separate Occurrences of different actors
Count.Berenger <- groupeddata %>% filter(Actor == "Tom Berenger")

Count.Cruise <- groupeddata %>% filter(Actor == "Tom Cruise")

Count.Hanks <- groupeddata %>% filter(Actor == "Tom Hanks")

Count.Hardy <- groupeddata %>% filter(Actor == "Tom Hardy")

Count.Hiddlestone <- groupeddata %>% filter(Actor == "Tom Hiddlestone")

Count.Sizemore <- groupeddata %>% filter(Actor == "Tom Sizemore")

Count.LeeJones <- groupeddata %>% filter(Actor == "Tommy Lee Jones")

actor.plot <- ggplot(groupeddata, aes(x = Year, y = Occurrence, fill= Actor))+
  geom_bar(stat = "identity")+
  ggtitle("Occurrence of Actors Named Tom Over The Years")+
  theme(legend.position = "off")

actor.plot <- ggplot(groupeddata, aes(x = Year, y = Occurrence, fill= Actor))+
  

actor.plot
ggplotly(actor.plot)

