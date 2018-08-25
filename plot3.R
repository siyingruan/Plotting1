HPC<-read.csv("HPC.txt", sep = ";", na.strings = "?", colClasses = c(rep("character",2),rep("numeric",7)))
HPC$Date<-as.Date(HPC$Date, "%d/%m/%Y")
hpcd<-subset(HPC, HPC$Date >=("2007-02-01") & HPC$Date <= ("2007-02-02"))
hpcd<-hpcd[complete.cases(hpcd),]
DateTime<-paste(hpcd$Date, hpcd$Time)
DateTime<-strptime(DateTime, "%Y-%m-%d %H:%M:%S")
hpcd1<-cbind(DateTime,hpcd)
hpcd<-hpcd1[,!(colnames(hpcd1)%in%c("Date","Time"))]
rm(hpcd1)

plot(hpcd$DateTime,hpcd$Sub_metering_1,type = "l", col = "black",xlab="", ylab = "Global Active Power(killowatts)")
lines(hpcd$DateTime,hpcd$Sub_metering_2, col = "red")
lines(hpcd$DateTime,hpcd$Sub_metering_3, col = "blue")
legend("topright", col = c("black","red","blue"), lwd= c(1, 1, 1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75)
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()



