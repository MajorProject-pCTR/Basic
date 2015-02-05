data <- read.table("rand_sub.txt")
y <- data$V1 / data$V2
depth <- data$V6
pos <- data$V7

reg <- lm(y~depth+pos)
reg
summary(reg)

h<-predict(reg)
head(h,10)

compare <- data.frame(x=y, y=h)
head(compare,10)

write(h,file="pre.csv",sep="\n")

