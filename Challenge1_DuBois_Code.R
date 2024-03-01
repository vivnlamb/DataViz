library(MASS) 
library(reshape2) 
library(ggplot2)
challenge1<- read.csv('challenge1.csv')
melt_challengeData <- melt(challenge1, id = c("Year"))

p1 <- ggplot(melt_challengeData, aes(x=Year, y=value, group=variable)) + geom_line(aes(linetype=variable))

p2 <- p1 + scale_linetype_manual(values=c("solid", "dashed"),labels = c('COLORED','WHITE')) + ggtitle('COMPARATIVE INCREASE OF WHITE AND COLORED \n POPULATION OF GEORGIA. \n by W. E. B. Du Bois') + ylab('PERCENTS')

p3 <- p2 + theme(panel.background = element_rect(fill = "#F4EDCA",colour = "black",size = 0.3, linetype = "solid"),panel.grid.major = element_line(size = 0.1, linetype = 'solid',colour = "red"),panel.grid.minor = element_blank()) 

p4 <- p3 + scale_x_continuous(limits=c(1790, 1890), breaks = seq(1790, 1890,10), expand = c(0, 0)) + scale_y_reverse(limits=c(100,0), breaks = seq(0,100,5), expand = c(0, 0)) + coord_flip() 

p5 <- p4 + theme(text = element_text(family = "sans"),aspect.ratio=1.5, plot.title = element_text(hjust = 0.5, size=14, face='bold'),legend.position="bottom",legend.text=element_text(size=6), legend.title=element_blank(), axis.text.x=element_text(size=6), axis.title.x=element_text(size=6), axis.title.y = element_blank()) 

p5
ggsave('Challenge1_DuBois_LineGraph.pdf', width = 20, height = 20, units = "cm")

