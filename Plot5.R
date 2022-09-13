# How have emissions from motor vehicle sources changed from 1999-2008 in 
# Baltimore City?

library(ggplot2)
library(stringr)

# Select motor vehicles on BC
motorv_data <- scc[str_detect(scc$Short.Name, '[vV]ehicles'), ]
mvBaltimore_data <- balti[balti$SCC %in% motorv_data$SCC, ]

# Sum Emissions of coal combustion-related by year
balt_mv_sum <- setNames(aggregate(
  x=mvBaltimore_data$Emissions, by=list(mvBaltimore_data$year), sum), 
  c("Year", "Emi"))

# Prepare dataset
balt_mv_sum$Year <- as.character(balt_mv_sum$Year)

# Draw barplot
ggplot(data = balt_mv_sum) + 

geom_bar(aes(x=Year, y=Emi), stat="identity", fill="orange", col="black") +
labs(x = 'Year', y = 'Emissions', 
     title = 'Emissions Motor Vehicle in Baltimore City')







