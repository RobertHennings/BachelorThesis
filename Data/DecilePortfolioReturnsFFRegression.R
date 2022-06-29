#Bachelor thesis notes: The liquidity risk premium in the US capital market
#Submitted on 24.09.2021 by Robert Hennings
#University of Duisburg-Essen, Campus Essen
#Chair of Finance, Professor Heiko Jacobs



#VW returns of portfolios sorted on historical liquidity betas, Jan 1968 -- Dec 2020

d2<-read.csv2("https://raw.githubusercontent.com/RobertHennings/BachelorThesis/main/ReturnsOnDecilePortfoliosSortedOnHistoricalLiquidityBetas.csv")
colnames(d2)<-c("P1","P2","P3","P4","P5","P6","P7","P8","P9","P10","Diff")
head(d2)



#Adjusting Datatype
for(i in 1:dim(d2)[2]){
  d2[,i]<-as.numeric(d2[,i])
}
#Checking whether the last column is the difference between the returns of portfolio 10 and 1
d2$P10[1]-d2$P1[1]
d2$Diff[1]
#Is Correct
DatumD2<-seq(as.Date("1968/01/1"),as.Date("2020/12/1"),by="month")
d2$Datum<-DatumD2
d2$Index<-seq(1:dim(d2)[1])


#Plot the portfolio returns all individually against the normal distribution
#Portfolio 1
plot(density(d2$P1),main="Dichtekurve der Portfoliorenditen des Dezilportfolios 1",
     xlab="Renditen",
     ylab="Dichte")
#Superimpose normal distribution and compare
xWerte<-seq(from=min(d2$P1),to=max(d2$P1), length.out = 512)
yWerte<-dnorm(x=xWerte, mean =mean(d2$P1), sd = sd(d2$P1))
lines(x=xWerte, y=yWerte, type="l",col="red")
#Draw in certain quantile values
quantile(d2$P1)
abline(v=quantile(d2$P1)[2])
abline(v=quantile(d2$P1)[4])
text(x=quantile(d2$P1)[2]-0.05,y=6.5,"25% Quantil")
text(x=quantile(d2$P1)[3]+0.09,y=6.5,"75% Quantil")


#Portfolio 2
plot(density(d2$P2),main="Dichtekurve der Portfoliorenditen des Dezilportfolios 2",
     xlab="Renditen",
     ylab="Dichte")
#Superimpose normal distribution and compare
xWerte<-seq(from=min(d2$P2),to=max(d2$P2), length.out = 512)
yWerte<-dnorm(x=xWerte, mean =mean(d2$P2), sd = sd(d2$P2))
lines(x=xWerte, y=yWerte, type="l",col="red")
#Draw in certain quantile values
quantile(d2$P2)
abline(v=quantile(d2$P2)[2])
abline(v=quantile(d2$P2)[4])
text(x=quantile(d2$P2)[2]-0.05,y=6.5,"25% Quantil")
text(x=quantile(d2$P2)[3]+0.09,y=6.5,"75% Quantil")


###############################################Spread returns of portfolios 10 and 1 compared to the FF factors########################

#Loading the Fama and French three-factor model
FF<-read.csv2("https://raw.githubusercontent.com/RobertHennings/BachelorThesis/main/F-F_Research_Data_Factors.CSV")


#The FF factors are available in molecular frequency and were obtained from the official site of Dartmouth College:
#https://mba.tuck.dartmouth.edu/pages/faculty/ken.french/data_library.html

#Still exclude lines
#1140
FF<-FF[c(1:1140),]

#Formatting date column
#Von 1926 07
#Bis 2021 06 

Datum<-seq(as.Date("1926/07/1"),as.Date("2021/06/1"),by="month")
Datum

FF$Datum<-Datum


#Now regression of the excess returns of the diff column on the three factors
#Period: 1968-01 to December 2020
#FF Fit data to date
FF$Index<-seq(1:dim(FF)[1])
FF$Index[FF$Datum=="1968/01/1"]
#499
FF$Index[FF$Datum=="2020/12/1"]
#1134

length(d2$Diff)
length(FF$Index[499:1134])

mod1<-lm(d2$Diff~FF$MKR.RF[499:1134]+FF$SMB[499:1134]+FF$HML[499:1134])
summary(mod1)
summary(mod1)$coefficients
summary(mod1)$coefficients*100



#January 2000 to December 2015
#Read the rows from the portfolios
d2$Index[d2$Datum=="2000/01/1"]
#385
d2$Index[d2$Datum=="2015/12/1"]
#576

#Read out the lines from the FF data
FF$Index[FF$Datum=="2000/01/1"]
#883
FF$Index[FF$Datum=="2015/12/1"]
#1074


mod2<-lm(d2$Diff[385:576]~FF$MKR.RF[883:1074]+FF$SMB[883:1074]+FF$HML[883:1074])
summary(mod2)

#Replication of the original study in the period January 1968 to December 1999

FF$Index[FF$Datum=="1968-01-1"]
#449
FF$Index[FF$Datum=="1999-12-1"]
#882


d2$Index[d2$Datum=="1968/01/1"]
#1
d2$Index[d2$Datum=="1999/12/1"]
#384

mod3<-lm(d2$Diff[1:384]~FF$MKR.RF[499:882]+FF$SMB[499:882]+FF$HML[499:882])
summary(mod3)
summary(mod3)$coefficients
summary(mod3)$coefficients

