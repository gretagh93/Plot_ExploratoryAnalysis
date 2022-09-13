
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (\color{red}{\verb|fips == "24510"|}fips == "24510") from 1999 to 2008? Use 
# the base plotting system to make a plot answering this question.

# Select code of Baltimore City, Maryland
balti <- subset(nei,nei$fips=="24510")

# Sum Emissions by year
emi_balti <- aggregate(x=balti$Emissions, by=list(balti$year), sum)

# Create barplot with Base Plotting System
barplot(emi_balti$x ~ emi_balti$Group.1, 
        col = 4:(length(emi_balti$x)+4), 
        main="Emissions Baltimore", 
        xlab = "Year", ylab = "Emission")

