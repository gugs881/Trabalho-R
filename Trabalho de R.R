install.packages("readxl")

Load the "readxl" library library(readxl)

Read the Excel file using the "read_excel" function base <- read_excel("D:/Opera/autoscout24-germany-dataset.csv")

if ("readxl" %in% rownames(installed.packages())) { remove.packages("readxl") }

Reinstall the "readxl" package install.packages("readxl")

Load the "readxl" library library(readxl)

Read the XLSX file using the "read_xlsx" function base <- read_xlsx("D:/Opera/autoscout24-germany-dataset xlxs.xlsx")

install.packages("openxlsx") library(openxlsx) base <- read.xlsx("D:/Opera/autoscout24-germany-dataset xlxs.xlsx")

hist(base$year) hist(base$hp) hist(base$make) hist(base$price)

#------------ brand_count <- table(base$make) top10_brands <- head(sort(brand_count, decreasing = TRUE), 10) colors <- rainbow(length(top10_brands)) barplot(top10_brands, main = "Number of Cars per Brand (Top 10)", xlab = "Brand", ylab = "Count", col = colors, names.arg = names(top10_brands))

#-------

Group the average price by year price_mean <- tapply(base$price, base$year, mean)

Define the color palette colors <- heat.colors(length(price_mean))

Bar plot with different colors barplot(price_mean, main = "Average Price over the Years", xlab = "Year", ylab = "Average Price", col = colors)

#-------------

Convert columns to the correct data type base$mileage <- as.numeric(base$mileage) base$price <- as.numeric(base$price) base$year <- as.numeric(base$year)

Generate a custom color vector colors <- c("#3366CC", "#3399FF", "#66CCFF", "#99CCFF", "#CCCCFF")

Create an empty dataframe to store the selected cars selected_cars <- data.frame()

Iterate over the years and select the car with the highest chance of sale score for (year in unique(base$year)) { cars_year <- base[base$year == year, ] selected_car <- cars_year[which.max(cars_year$price * cars_year$mileage / cars_year$year), ] selected_cars <- rbind(selected_cars, selected_car) }

Sort the dataframe by years selected_cars <- selected_cars[order(selected_cars$year), ]

Generate a color vector for the bars bar_colors <- colors[1:nrow(selected_cars) %% length(colors) + 1]

Add data labels for the selected cars text(x = barplot(selected_cars$price, col = bar_colors, main = "Car with Highest Chances of Sale per Year", xlab = "Year", ylab = "Price"), y = selected_cars$price, labels = selected_cars$model, pos = 3, offset = 0.5, col = "black")

pie(selected_cars$price, labels = selected_cars$year, col = bar_colors, main = "Car with Highest Chances of Sale per Year")

pie(selected_cars$price, labels = selected_cars$model, col = bar_colors, main = "Car with Highest Chances of Sale per Year")

#--------------

Count the occurrence of each fuel type fuel_count <- table(base$fuel)

Create the bar plot bar