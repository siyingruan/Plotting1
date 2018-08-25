HPC<-read.csv("HPC.txt", sep = ";", na.strings = "?", colClasses = c(rep("character",2),rep("numeric",7)))
HPC$Date<-as.Date(HPC$Date, "%d/%m/%Y")
hpcd<-subset(HPC, HPC$Date >=("2007-02-01") & HPC$Date <= ("2007-02-02"))
hpcd<-hpcd[complete.cases(hpcd),]

hist(hpcd$Global_active_power,xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.copy(png, file = "plot1.png",width = 480, height=480)
dev.off()

