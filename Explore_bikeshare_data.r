
ny = read.csv('new_york_city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')

head(ny)

head(wash)

head(chi)

#We use sort function,the method that makes a use of order for a Start stations
sort(table(ny$Start.Station),decreasing=TRUE)[1:3]

## Using the ggplot2 library to generate the plot below
library(ggplot2)
## setting a bp plott variable to generate the bar graphic
bp<- ggplot(data = ny, mapping = aes(x=Gender, y=Trip.Duration, fill=Gender))+
geom_bar(width = 1, stat="identity")+
labs(x = "Gender", y = "Trip Duration", fill = NULL, title = "New York Bike Share Total Trip Duration by Gender")
## let's display the result from the variable
bp



#We use the sum function to get the total trip duration, excluding the NA values
sum(wash$Trip.Duration,na.rm=TRUE)

mean(wash$Trip.Duration, na.rm=TRUE)

## Now we going to find the average of trip duration by starting stations, and graphically we going to plott the result
##Loading the libraries

library(ggplot2)
library(magrittr)
library(dplyr)
    #grouping data by Start Station name.
bike <- wash%>% group_by(Start.Station)
x <- bike %>% summarise(duration =mean (Trip.Duration))
y <- head(x,15)
# lets visualize our 15 stations
y
# Plotting the results using the ggplot
options(repr.plot.width=8, repr.plot.height=3)
ggplot(y, aes(x=Start.Station, y= duration, main= "Trip Duration Average by Station", na.rm=TRUE)) +
geom_bar(stat = "identity")+
coord_flip() + scale_y_continuous(name="Average Trip Duration") + scale_x_discrete(name= "Start Station")+
theme(axis.title.x =element_text(face="bold", color = "#008000",size=8, angle=0),
     axis.text.y = element_text(face="bold", color="#008000",size=8, angle=0,))



## Frequency table with table() function
table(chi$Gender,useNA="ifany")

library(dplyr)
chi %>%
group_by(Gender)%>%
summarize(gender_count=n())

#Generate the Garphic using the regular boxplot function
boxplot(chi$Trip.Duration ~ chi$Gender,col=c("black","red","yellow"), data = chi, ylim=c(0,4000), xlab="Gender",ylab= "Trip Duration", main= "Chicago Trip Duration by Gender")

system('python -m nbconvert Explore_bikeshare_data.ipynb')
