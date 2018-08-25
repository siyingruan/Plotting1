HPC<-read.csv("HPC.txt", sep = ";", na.strings = "?", colClasses = c(rep("character",2),rep("numeric",7)))
HPC$Date<-as.Date(HPC$Date, "%d/%m/%Y")
hpcd<-subset(HPC, HPC$Date >=("2007-02-01") & HPC$Date <= ("2007-02-02"))
hpcd<-hpcd[complete.cases(hpcd),]

DateTime<-paste(hpcd$Date, hpcd$Time)
DateTime<-strptime(DateTime, "%Y-%m-%d %H:%M:%S")
hpcd1<-cbind(DateTime,hpcd)
hpcd<-hpcd1[,!(colnames(hpcd1)%in%c("Date","Time"))]
rm(hpcd1)

plot(hpcd$DateTime,hpcd$Global_active_power,type = "l",xlab="",ylab="Global Active Power(killowatts)")
dev.copy(png,file = "plot2.png", width= 480, height = 480)
dev.off()
