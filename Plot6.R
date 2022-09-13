
# Compare emissions from motor vehicle sources in Baltimore City with emissions
# from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

# Select motor vehicles on LA
angeles <- subset(nei,nei$fips=="06037")
mvAngeles_data <- angeles[angeles$SCC %in% motorv_data$SCC, ]

# Sum Emissions of coal combustion-related by year
ang_mv_sum <- setNames(aggregate(
  x=mvAngeles_data$Emissions, by=list(mvAngeles_data$year), sum), 
  c("Year", "Emi"))

# Prepare datasets

ang_mv_sum$Year <- as.character(ang_mv_sum$Year)
city <- rep(c("LA"), length(ang_mv_sum$Year))
ang_mv <- cbind(ang_mv_sum, city)

city <- rep(c("BC"), length(balt_mv_sum$Year))
balt_mv <- cbind(balt_mv_sum, city)

# Merge datasets by Year
df <- rbind(ang_mv,balt_mv)

# Draw barplot
ggplot(df, aes(Year, Emi, fill = city)) +
  geom_bar(stat="identity", position = "dodge") +
  labs(y="Emissions", title="Compare BA and LO")
