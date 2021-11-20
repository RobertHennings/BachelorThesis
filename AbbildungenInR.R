#Bachelor thesis notes: The liquidity risk premium in the US capital market
#Submitted on 24.09.2021 by Robert Hennings
#University of Duisburg-Essen, Campus Essen
#Chair of Finance, Professor Heiko Jacobs


#Read in original data set to PS
d<-read.csv2("https://raw.githubusercontent.com/RobertHennings/BachelorThesis/main/PastorAndStambaughEditedData.csv")
#Describe data set
str(d)
typeof(d)
#Problem:  Variables 3 of 4 are characters instead of numbers

#Adjust variables

d$Agg.Liq.<-as.numeric(d$Agg.Liq.);d$Agg.Liq.
d$Innov.Liq..eq8.<-as.numeric(d$Innov.Liq..eq8.)
d$Traded.Liq..LIQ_V.[1:65]<-99.00
d$Traded.Liq..LIQ_V.<-as.numeric(d$Traded.Liq..LIQ_V.)


#Checking
str(d)

#Recreate and insert the months as a datetime object
months<-seq(as.Date("1962/08/1"),as.Date("2020/12/1"),by="month")
months


d$X..Month<-months
#Variables included in the dataset
#Levels of aggregated liquidity (Figure 1 in the paper) is the column Agg. Liq.
#Innovations in aggregated liquidity (non-traded liquidity factor is the column Innov.Liq)
#Note: The traded factor is the value-weighted return on the 10-1 portfolio from a sort on historical is the column Traded.Liq

#Show the entire time series of Innovations in Liquidity up to the most recent level.
plot(y=d$Innov.Liq..eq8., type="l",x=d$X..Month)

#Display only the section of the original study: 1962-1999
#Add index column for this
dim(d)
d$Index<-seq(from=1, to=701)
d$Index[d$X..Month=="1999-12-01"]
######################################Innovations in Liquidity in the original period 1962-1999########################################
plot(y=d$Innov.Liq..eq8.[1:d$Index[d$X..Month=="1999-12-01"]], type="l",x=as.Date(d$X..Month[1:d$Index[d$X..Month=="1999-12-01"]]),
     xlab="Monate",
     ylab="Veränderung der aggregierten Gesamtmarktliquidität")

#Create own x axis formatting like PS
years<-seq(as.Date("1965/1/1"),as.Date("2000/1/1"),by="5 years")
yearseq<-format(years, format="%Y");yearseq

plot(y=d$Innov.Liq..eq8.[1:d$Index[d$X..Month=="1999-12-01"]], type="l",x=as.Date(d$X..Month[1:d$Index[d$X..Month=="1999-12-01"]]),
     xlab="Monate",
     ylab="Veränderung der aggregierten Gesamtmarktliquidität",xaxt="n")
axis(1, years,
     format(years, format="%Y"))
abline(a=0,b=0)

#Englisch
plot(y=d$Innov.Liq..eq8.[1:d$Index[d$X..Month=="1999-12-01"]], type="l",x=as.Date(d$X..Month[1:d$Index[d$X..Month=="1999-12-01"]]),
     xlab="Months",
     ylab="Change in aggregate total market liquidity",xaxt="n")
axis(1, years,
     format(years, format="%Y"))
abline(a=0,b=0)
######################################################################################################################################


#############################Replicating Figures from PS: Aggregate market liquidity in the period 1962-1999######################
plot(y=d$Agg.Liq.[1:d$Index[d$X..Month=="1999-12-01"]], type="l",x=d$X..Month[1:d$Index[d$X..Month=="1999-12-01"]],
     xlab="Monate",
     ylab="Aggregierte Gesamtmarktliquidität",
     xaxt="n")
axis(1,years,
     format(years, format="%Y"))
abline(a=0,b=0)


#Englisch
plot(y=d$Agg.Liq.[1:d$Index[d$X..Month=="1999-12-01"]], type="l",x=d$X..Month[1:d$Index[d$X..Month=="1999-12-01"]],
     xlab="Months",
     ylab="Aggregate total market liquidity",
     xaxt="n")
axis(1,years,
     format(years, format="%Y"))
abline(a=0,b=0)

##########################################Show only a smaller time frame: 1999-year 2020 or recent months############################
#Innovations in Liquidity in Out of sample period
years2<-seq(as.Date("1999/1/1"),as.Date("2021/1/1"),by="5 years")
plot(y=d$Innov.Liq..eq8.[d$Index[d$X..Month=="1999-12-01"]:701], type="l",x=d$X..Month[d$Index[d$X..Month=="1999-12-01"]:701],
     xlab="Monate",
     ylab="Veränderung der aggregierten Gesamtmarktliquidität",xaxt="n")
axis(1,years2,
     format(years2, format="%Y"))
abline(a=0,b=0,lwd=2)

#Aggregate Total Market Liquidity
plot(y=d$Agg.Liq.[d$Index[d$X..Month=="1999-12-01"]:701], type="l",x=d$X..Month[d$Index[d$X..Month=="1999-12-01"]:701],
     xlab="Monate",
     ylab="Gesamtmarktliquidität",xaxt="n")
axis(1,years2,
     format(years2, format="%Y"))
abline(a=0,b=0,lwd=2)




###################################Show the entire time series until today with subdivision into the original study#######################
#Innovations in Liquidity
years3<-seq(as.Date("1962/1/1"),as.Date("2022/1/1"),by="5 years")
plot(y=d$Innov.Liq..eq8., type="l",x=d$X..Month,
     xlab="Monate",
     ylab="Veränderung der aggregierten Gesamtmarktliquidität",xaxt="n")
axis(1, years3,
     format(years3, format="%Y"))
abline(v=d$X..Month[d$Index[d$X..Month=="1962-08-01"]],lwd=2,lty=2)
abline(v=d$X..Month[d$Index[d$X..Month=="1999-12-01"]],lwd=2, lty=2)
abline(a=0,b=0)

#Englisch
years3<-seq(as.Date("1962/1/1"),as.Date("2022/1/1"),by="5 years")
plot(y=d$Innov.Liq..eq8., type="l",x=d$X..Month,
     xlab="Months",
     ylab="Change in aggregate total market liquidity",xaxt="n")
axis(1, years3,
     format(years3, format="%Y"))
abline(v=d$X..Month[d$Index[d$X..Month=="1962-08-01"]],lwd=2,lty=2)
abline(v=d$X..Month[d$Index[d$X..Month=="1999-12-01"]],lwd=2, lty=2)
abline(a=0,b=0)

#Aggregate Total Market Liquidity
plot(y=d$Agg.Liq., type="l",x=d$X..Month,
     xlab="Monate",
     ylab="Gesamtmarktliquidität",xaxt="n")
axis(1, years3,
     format(years3, format="%Y"))
abline(v=d$X..Month[d$Index[d$X..Month=="1962-08-01"]],lwd=2,lty=2)
abline(v=d$X..Month[d$Index[d$X..Month=="1999-12-01"]],lwd=2, lty=2)
abline(a=0,b=0)
#Englisch
plot(y=d$Agg.Liq., type="l",x=d$X..Month,
     xlab="Months",
     ylab="Aggregate total market liquidity",xaxt="n")
axis(1, years3,
     format(years3, format="%Y"))
abline(v=d$X..Month[d$Index[d$X..Month=="1962-08-01"]],lwd=2,lty=2)
abline(v=d$X..Month[d$Index[d$X..Month=="1999-12-01"]],lwd=2, lty=2)
abline(a=0,b=0)


#Showing both figures side by side
par(mfrow=c(1,2))
plot(y=d$Agg.Liq., type="l",x=d$X..Month,
     xlab="Monate",
     ylab="Gesamtmarktliquidität",xaxt="n")
axis(1, years3,
     format(years3, format="%Y"))
abline(v=d$X..Month[d$Index[d$X..Month=="1962-08-01"]],lwd=2,lty=2)
abline(v=d$X..Month[d$Index[d$X..Month=="1999-12-01"]],lwd=2, lty=2)
abline(a=0,b=0)

plot(y=d$Innov.Liq..eq8., type="l",x=d$X..Month,
     xlab="Monate",
     ylab="Veränderung der aggregierten Gesamtmarktliquidität",xaxt="n")
axis(1, years3,
     format(years3, format="%Y"))
abline(v=d$X..Month[d$Index[d$X..Month=="1962-08-01"]],lwd=2,lty=2)
abline(v=d$X..Month[d$Index[d$X..Month=="1999-12-01"]],lwd=2, lty=2)
abline(a=0,b=0)
par(mfrow=c(1,1))


########################################################################################################################################
#############################################################Read out descriptive statistics of the time series#############################
#Time subdivision the PS still make:
#August 1962 - December 1999
#January 1968 - December 1999
#January 1968 - December 1983
#January 1984 - December 1999

#Read descriptive statistics of the two time series for these periods.
#Approach: Show that in normal times the time series oscillates around 0, but in extreme phases it swings out.
summary(d[,c(2:4)])
#August 1962 - December 1999
summary(d[c(1:d$Index[d$X..Month=="1999-12-01"]),c(2:4)])
#January 1968-December 1999
eins<-summary(d[c(d$Index[d$X..Month=="1968-01-01"]:d$Index[d$X..Month=="1999-12-01"]),c(2:4)]);eins
#Entire period 1968 until today
zwei<-summary(d[c(d$Index[d$X..Month=="1968-01-01"]:701),c(2:4)]);zwei
#January 1968 - December 1983
drei<-summary(d[c(d$Index[d$X..Month=="1968-01-01"]:d$Index[d$X..Month=="1983-12-01"]),c(2:4)]);drei
#January 1984 - December 1999
vier<-summary(d[c(d$Index[d$X..Month=="1984-01-01"]:d$Index[d$X..Month=="1999-12-01"]),c(2:4)]);vier
#December 1999 - today
fünf<-summary(d[c(d$Index[d$X..Month=="1999-12-01"]:dim(d)[1]),c(2:4)]);fünf



TabelleDeskriptivGesamt<-rbind(eins,zwei,drei,vier,fünf);TabelleDeskriptivGesamt
#Save table as Excel file
library(openxlsx)
write.xlsx(TabelleDeskriptivGesamt,file="/Users/TableDescriptiveStatisticsPS.xlsx")

#################################Finding the maximum negative point in the period after 1999##################################
#must be October 2002


d$Index[d$X..Month=="1999-12-01"]
#beginning at row 449
min(d$Agg.Liq.[449:701])
#Finding the month
d$X..Month[d$Agg.Liq.==-0.3082356]
#"2002-10-01" the October 2002 is correct 
round(-0.3082356,3)
############################Finding the respective date of the maxima and minima of subperiods####################################
##################################################Total market liquidity##############################################################
#August 1962 - December 1999
min(d$Agg.Liq.[1:449])
max(d$Agg.Liq.[1:449])
#Finding the month
d$X..Month[d$Agg.Liq.==min(d$Agg.Liq.[1:449])]
d$X..Month[d$Agg.Liq.==max(d$Agg.Liq.[1:449])]

#January 1968 - Dezember 1999
d$Index[d$X..Month=="1968-01-01"]
d$Index[d$X..Month=="1999-12-01"]
min(d$Agg.Liq.[66:449])
max(d$Agg.Liq.[66:449])
#Finding the month
d$X..Month[d$Agg.Liq.==min(d$Agg.Liq.[66:449])]
d$X..Month[d$Agg.Liq.==max(d$Agg.Liq.[66:449])]

#Overall period 1968 until today
d$Index[d$X..Month=="1968-01-01"]
701
min(d$Agg.Liq.[66:701])
max(d$Agg.Liq.[66:701])
#Finding the month
d$X..Month[d$Agg.Liq.==min(d$Agg.Liq.[66:701])]
d$X..Month[d$Agg.Liq.==max(d$Agg.Liq.[66:701])]

#January 1968 - Dezember 1983
d$Index[d$X..Month=="1968-01-01"]
d$Index[d$X..Month=="1983-12-01"]
min(d$Agg.Liq.[66:257])
max(d$Agg.Liq.[66:257])
#Finding the month
d$X..Month[d$Agg.Liq.==min(d$Agg.Liq.[66:257])]
d$X..Month[d$Agg.Liq.==max(d$Agg.Liq.[66:257])]

#January 1984 - December 1999
d$Index[d$X..Month=="1984-01-01"]
d$Index[d$X..Month=="1999-12-01"]
min(d$Agg.Liq.[258:449])
max(d$Agg.Liq.[258:449])
#Finding the month
d$X..Month[d$Agg.Liq.==min(d$Agg.Liq.[258:449])]
d$X..Month[d$Agg.Liq.==max(d$Agg.Liq.[258:449])]

#December 1999 - today
d$Index[d$X..Month=="1999-12-01"]
#starting at row 449
min(d$Agg.Liq.[449:701])
max(d$Agg.Liq.[449:701])
#Finding the month
d$X..Month[d$Agg.Liq.==-0.3082356]
#"2002-10-01" stimmt also der Oktober 2002
round(-0.3082356,3)

d$X..Month[d$Agg.Liq.==0.12457122]
#2009-12-01


############################Finding the respective date of the maxima and minima of subperiods####################################
##################################################Innovations in liquidity##############################################################
#August 1962 - December 1999
min(d$Agg.Liq.[1:449])
max(d$Agg.Liq.[1:449])
#Finding the month
d$X..Month[d$Innov.Liq..eq8.==min(d$Innov.Liq..eq8.[1:449])]
d$X..Month[d$Innov.Liq..eq8.==max(d$Innov.Liq..eq8.[1:449])]

#January 1968 - December 1999
d$Index[d$X..Month=="1968-01-01"]
d$Index[d$X..Month=="1999-12-01"]
min(d$Innov.Liq..eq8.[66:449])
max(d$Innov.Liq..eq8.[66:449])
#Finding the month
d$X..Month[d$Innov.Liq..eq8.==min(d$Innov.Liq..eq8.[66:449])]
d$X..Month[d$Innov.Liq..eq8.==max(d$Innov.Liq..eq8.[66:449])]

#Overall period 1968 - today
d$Index[d$X..Month=="1968-01-01"]
701
min(dd$Innov.Liq..eq8.[66:701])
max(d$Innov.Liq..eq8.[66:701])
#Finding the month
d$X..Month[d$Innov.Liq..eq8.==min(d$Innov.Liq..eq8.[66:701])]
d$X..Month[d$Innov.Liq..eq8.==max(d$Innov.Liq..eq8.[66:701])]

#January 1968 - December 1983
d$Index[d$X..Month=="1968-01-01"]
d$Index[d$X..Month=="1983-12-01"]
min(d$Innov.Liq..eq8.[66:257])
max(d$Innov.Liq..eq8.[66:257])
#Finding the month
d$X..Month[d$Innov.Liq..eq8.==min(d$Innov.Liq..eq8.[66:257])]
d$X..Month[d$Innov.Liq..eq8.==max(d$Innov.Liq..eq8.[66:257])]

#January 1984 - December 1999
d$Index[d$X..Month=="1984-01-01"]
d$Index[d$X..Month=="1999-12-01"]
min(d$Innov.Liq..eq8.[258:449])
max(d$Innov.Liq..eq8.[258:449])
#Finding the month
d$X..Month[d$Innov.Liq..eq8.==min(d$Innov.Liq..eq8.[258:449])]
d$X..Month[d$Innov.Liq..eq8.==max(d$Innov.Liq..eq8.[258:449])]

#December 1999 - today
d$Index[d$X..Month=="1999-12-01"]
#starting at row 449
min(d$Innov.Liq..eq8.[449:701])
max(d$Innov.Liq..eq8.[449:701])
#Finding the month
d$X..Month[d$Innov.Liq..eq8.==min(d$Innov.Liq..eq8.[449:701])]
d$X..Month[d$Innov.Liq..eq8.==max(d$Innov.Liq..eq8.[449:701])]










###################################################################################################################################
#Perhaps take a closer look at the time series to see whether crises are accurately depicted.
#When is a month considered low on liquidity?
#Like PS, in Table 3 we call a month a “low liquidity” month, if the gamma index is more than two standard deviations lower than the index mean during the original PS time period Using CRSP data
#With this, you could go back and see which months this applies to and make a categorisation.

mean(d$Agg.Liq.)
mean(d$Innov.Liq..eq8.)
sd(d$Agg.Liq.)
#Filter all months in which the innovations are smaller than 2 times the SD of the time series.

#period January 1968 - December 1999
-2*sd(d$Innov.Liq..eq8.[66:449])

#Spend all months that are "illiquid"
for (i in d$Index){
  ifelse(d$Innov.Liq..eq8.[i]<2*sd(d$Innov.Liq..eq8.[66:449]),print(d$X..Month[i]),"") 
  
}
#Saving all months into a new variable for plotting later
illiq<-numeric(length(d$Index))
for (i in d$Index){
  illiq[i]<-ifelse(d$Innov.Liq..eq8.[i]<=-2*sd(d$Innov.Liq..eq8.[66:449]),i,0)   
}
View(illiq)


illiq<-sort(illiq)
illiq<-illiq[675:length(illiq)]
View(illiq)
#Mark these months in the time series
#Both in the Aggregate Market Liquidity and the Changes in this


#Innovations in Liquidity

years3<-seq(as.Date("1962/1/1"),as.Date("2022/1/1"),by="5 years")
plot(y=d$Innov.Liq..eq8., type="l",x=d$X..Month,
     xlab="Monate",
     ylab="Veränderung der aggregierten Gesamtmarktliquidität",xaxt="n")
axis(1, years3,
     format(years3, format="%Y"))
abline(v=d$X..Month[d$Index[d$X..Month=="1962-08-01"]],lwd=2,lty=2)
abline(v=d$X..Month[d$Index[d$X..Month=="1999-12-01"]],lwd=2, lty=2)
abline(a=0,b=0)
#Everything below 2 standard deviations during original time period
abline(a=-2*sd(d$Innov.Liq..eq8.[66:449]),b=0,col="red")


for (i in illiq){
  #abline(v=d$X..Month[d$Index==i])
  #points(x=d$X..Month[d$Index==i],y=-0.3)
  #print(d$X..Month[d$Index==i])
  arrows(x0=d$X..Month[d$Index==i],y0=-0.4,x1=d$X..Month[d$Index==i],y1=-0.35)
}



