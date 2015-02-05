data <- read.table("rand_sub.txt")
y <- data$V1 / data$V2
ad_id <- data$V4
advertiser_id <- data$V5
depth <- data$V6
pos <- data$V7
query_id <- data$V8
keyword_id <- data$V9
title_id <- data$V10
desc_id <- data$V11
user_id <- data$V12

reg <- lm(y~ad_id+advertiser_id+depth+pos+query_id+keyword_id+title_id+desc_id+user_id)
reg
summary(reg)

h<-predict(reg)
head(h,10)

compare <- data.frame(x=y, y=h)
head(compare,10)

write(h,file="pre_total.csv",sep="\n")
