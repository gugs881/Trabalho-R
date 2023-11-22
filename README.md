# Germany Cars R
## Introduction
Each code generates graphical views and statistical analysis based on a set of
car data, code was last updated on Wed Jun 09 2021 13:14:27 GMT-0300 (Brasília Standard Time).
The code presents graphs generated in R, using a database from
kaggle called germany cars, the database has 46,405 observations and 10 variables:
1. mileage: Represents the mileage of the vehicle, that is, the distance traveled by the
car until the time of data collection.
2. make: Refers to the make of the car, indicating the vehicle manufacturer.
3. model: Indicates the specific model of the car, providing additional information about the
vehicle beyond the mark.
4. fuel: Indicates the type of fuel used by the car, such as gasoline, diesel or other.
5. gear: Represents the vehicle's transmission type, which can be manual or automatic.
6. offerType: Indicates whether the car is used, that is, it is being offered for sale as
a second-hand vehicle.
7. price: Refers to the price of the car, expressed in a monetary unit
(probably in local currency).
8. hp: Represents the power of the vehicle's engine, measured in horsepower (hp).
9. year: Indicates the car's manufacturing year.
10. chance_venda: Estimate related to the probability of selling the vehicle.
• These are the main attributes present in the database, which provide
used car information, including details such as mileage, make,
model, fuel, transmission, type of offer, price, engine power, year of
manufacture and chance of sale.

## Details
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




