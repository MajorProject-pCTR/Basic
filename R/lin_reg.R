data <- read.table("rand_sub.txt")
y <- data$V1 / data$V2
depth <- data$V6
pos <- data$V7

reg <- lm(y~depth+pos)
reg
summary(reg)
