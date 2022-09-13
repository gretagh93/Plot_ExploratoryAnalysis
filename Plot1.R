
# Have total emissions from PM2.5 decreased in the United States from 1999 to 
# 2008? Using the base plotting system, make a plot showing the total PM2.5 
# emission from all sources for each of the years 1999, 2002, 2005, and 2008.

# Sum Emission by year
emi_eu <- aggregate(x=nei$Emissions, by=list(nei$year), sum)

# Create barplot with Base Plotting System
barplot(emi_eu$x ~ emi_eu$Group.1, 
        col = 4:(length(emi_eu$x)+4), main="Emissions EU", 
        xlab = "Year", ylab = "Emission")




