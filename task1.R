library(ggplot2)
getwd()
setwd('/Users/Katherine/R')
economics_data_raw <- read.csv(file.choose(), header = TRUE)
covid19_data_raw <- read.csv(file.choose(), header = TRUE)

covid19_data <- covid19_data_raw[1:110,c(1, 6, 7, 14)]
colnames(covid19_data)[2] <- 'current'
colnames(covid19_data)[3] <- 'cumulative'
covid19_data$date <- as.character(covid19_data$date)

economics_data <- economics_data_raw[, 1:2]

Mydata <- data.frame(1:2, 139, 5)


num <- 0
for(i in 1:nrow(covid19_data)){
  date1 <- covid19_data[i, 1]
  for(j in 1:nrow(economics_data)){
    date2 <- economics_data[j, 1]
    if(date1 == date2){
      num <- num+1
      Mydata[num, 1] <- date1
      Mydata[num, 2] <- economics_data[j, 2]
      Mydata[num, 3] <- covid19_data[i, 2]
      Mydata[num, 4] <- covid19_data[i, 3]
      Mydata[num, 5] <- covid19_data[i, 4]
    }
  }
}

colnames(Mydata)[1] <- 'date'
colnames(Mydata)[2] <- 'openprice'
colnames(Mydata)[3] <- 'current'
colnames(Mydata)[4] <- 'cumulative'
colnames(Mydata)[5] <- 'death'

cor_current <- cor(Mydata$current, Mydata$openprice)
cor_cumulative <- cor(Mydata$cumulative, Mydata$openprice)
cor_death <- cor(Mydata$death, Mydata$openprice)

plot(x=Mydata$current,y=Mydata$openprice,xlab='current cases',ylab='stock open price',main='current cases & stock open price (USA)') 
plot(x=Mydata$cumulative,y=Mydata$openprice,xlab='cumulative cases',ylab='stock open price',main='cumulative cases & stock open price (USA)') 
plot(x=Mydata$death,y=Mydata$openprice,xlab='death cases',ylab='stock open price',main='death cases & stock open price (USA)') 




       