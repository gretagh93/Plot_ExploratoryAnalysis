
# Of the four types of sources indicated by the \color{red}{\verb|type|}type 
# (point, nonpoint, onroad, nonroad) variable, which of these four sources have
# seen decreases in emissions from 1999-2008 for Baltimore City? Which have 
# seen increases in emissions from 1999-2008? Use the ggplot2 plotting system 
# to make a plot answer this question.

# Barplot with ggplot

library(ggplot2)

# Sum Emissions by type
type <- setNames(aggregate(
  x=balti$Emissions, by=list(balti$type, balti$year), sum), 
    c("Type", "Year", "Emissions"))

# Draw barplot
ggplot(type) +
  geom_bar(aes(x=Year, y=Emissions),
           stat="identity", fill='lightblue',col='black') +
  labs(title = 'Type of source in Baltimore City') +
  facet_wrap(~Type)





