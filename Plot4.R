
# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999-2008?

library(ggplot2)
# Library to use REGEX
library(stringr)

# Select coal combustion-related sources
coal_data <- scc[str_detect(scc$Short.Name, 'Coal'), ]
coalComb_data <- coal_data[str_detect(coal_data$SCC.Level.One, 'Combustion'), ]
cd_data <- nei[nei$SCC %in% coalComb_data$SCC, ]

# Sum Emissions of coal combustion-related by year
eu_cd_sum <- setNames(aggregate(
              x=cd_data$Emissions, by=list(cd_data$year), sum), 
              c("Year", "Emi"))

eu_cd_sum$Year <- as.character(eu_cd_sum$Year)

# Draw barplot
ggplot(data = eu_cd_sum) +
  
  geom_bar(aes(x=Year, y=Emi), stat="identity", fill="lightblue", col="black") +
  labs(x = 'Year', y = 'Frequency', title = 'Emissions Col EU')

# Emissions from coal combustion-related sources have been up since 1999

