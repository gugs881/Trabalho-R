# Trabalho-R

Code 1:

Installs and loads the "readxl" library.
Reads an Excel file called "autoscout24-germany-dataset.csv" using the "read_excel" function from the "readxl" package.
Removes the "readxl" package.
Reinstalls the "readxl" package.
Loads the "readxl" library.
Reads an XLSX file called "autoscout24-germany-dataset xlxs.xlsx" using the "read_xlsx" function from the "readxl" package.
Installs and loads the "openxlsx" library.
Reads an XLSX file called "autoscout24-germany-dataset xlxs.xlsx" using the "read.xlsx" function from the "openxlsx" package.

Code 2:

Generates a histogram of the "year" column in the dataset.
Generates a histogram of the "hp" column in the dataset.
Generates a histogram of the "make" column in the dataset.
Generates a histogram of the "price" column in the dataset.

Code 3:

Counts the number of cars per brand using the "table" function.
Selects the top 10 brands with the highest count.
Generates a bar plot showing the number of cars per brand for the selected top 10 brands.

Code 4:

Groups the average price of cars by year using the "tapply" function.
Defines a color palette.
Generates a bar plot with different colors representing the average price over the years.

Code 5:

Converts the "mileage", "price", and "year" columns to numeric data type using the "as.numeric" function.
Generates a custom color vector.
Creates an empty dataframe to store the selected cars.
Iterates over the years and selects the car with the highest chance of sale score.
Sorts the dataframe by years.
Generates a bar plot showing the car with the highest chances of sale per year.
Generates a pie chart showing the car with the highest chances of sale per year.
Generates a pie chart showing the model of the car with the highest chances of sale per year.

Code 6:

Counts the occurrence of each fuel type using the "table" function.
Generates a bar plot showing the distribution of fuel types.

Code 7:

Uses the "ggplot2" library.
Calculates the average consumption per fuel type using the "aggregate" function.
Generates a bar plot using ggplot, showing the average consumption per fuel type.

Code 8:

Counts the occurrence of each offer type using the "table" function.
Generates a pie chart showing the proportion of offer types.

Code 9:

Calculates the average price of used and new cars.
Compares the average prices and determines the best cost-benefit (used or new).
Prints the results.


CODE:

install.packages("readxl")

Load the "readxl" library
library(readxl)

Read the Excel file using the "read_excel" function
base <- read_excel("D:/Opera/autoscout24-germany-dataset.csv")

if ("readxl" %in% rownames(installed.packages())) {
remove.packages("readxl")
}

Reinstall the "readxl" package
install.packages("readxl")

Load the "readxl" library
library(readxl)

Read the XLSX file using the "read_xlsx" function
base <- read_xlsx("D:/Opera/autoscout24-germany-dataset xlxs.xlsx")

install.packages("openxlsx")
library(openxlsx)
base <- read.xlsx("D:/Opera/autoscout24-germany-dataset xlxs.xlsx")

hist(base$year)
hist(base$hp)
hist(base$make)
hist(base$price)

#------------
brand_count <- table(base$make)
top10_brands <- head(sort(brand_count, decreasing = TRUE), 10)
colors <- rainbow(length(top10_brands))
barplot(top10_brands, main = "Number of Cars per Brand (Top 10)", xlab = "Brand", ylab = "Count", col = colors, names.arg = names(top10_brands))

#-------

Group the average price by year
price_mean <- tapply(base$price, base$year, mean)

Define the color palette
colors <- heat.colors(length(price_mean))

Bar plot with different colors
barplot(price_mean, main = "Average Price over the Years", xlab = "Year", ylab = "Average Price", col = colors)

#-------------

Convert columns to the correct data type
base$mileage <- as.numeric(base$mileage)
base$price <- as.numeric(base$price)
base$year <- as.numeric(base$year)

Generate a custom color vector
colors <- c("#3366CC", "#3399FF", "#66CCFF", "#99CCFF", "#CCCCFF")

Create an empty dataframe to store the selected cars
selected_cars <- data.frame()

Iterate over the years and select the car with the highest chance of sale score
for (year in unique(base$year)) {
cars_year <- base[base$year == year, ]
selected_car <- cars_year[which.max(cars_year$price * cars_year$mileage / cars_year$year), ]
selected_cars <- rbind(selected_cars, selected_car)
}

Sort the dataframe by years
selected_cars <- selected_cars[order(selected_cars$year), ]

Generate a color vector for the bars
bar_colors <- colors[1:nrow(selected_cars) %% length(colors) + 1]

Add data labels for the selected cars
text(x = barplot(selected_cars$price, col = bar_colors, main = "Car with Highest Chances of Sale per Year", xlab = "Year", ylab = "Price"),
y = selected_cars$price, labels = selected_cars$model, pos = 3, offset = 0.5, col = "black")

pie(selected_cars$price, labels = selected_cars$year, col = bar_colors,
main = "Car with Highest Chances of Sale per Year")

pie(selected_cars$price, labels = selected_cars$model, col = bar_colors,
main = "Car with Highest Chances of Sale per Year")

#--------------

Count the occurrence of each fuel type
fuel_count <- table(base$fuel)

Create the bar plot
bar


