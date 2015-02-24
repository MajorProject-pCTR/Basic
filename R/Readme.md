sort -R training.txt -T "/home/abhivij"| head -n 1000000 > rand_sub.txt

In R :
data <- read.table("rand_sub.txt")
train <- data[c(1:600000),]
valid <- data[c(600001:800000),]
test <- data[c(800001:1000000),]

write.table(train,"train_sub.txt",row.names=FALSE,col.names=FALSE)
write.table(valid,"valid_sub.txt",row.names=FALSE,col.names=FALSE)
write.table(test,"test_sub.txt",row.names=FALSE,col.names=FALSE)
write.table(train,"train_sub.csv",row.names=FALSE,col.names=FALSE,sep=",")
write.table(test,"test_sub.csv",row.names=FALSE,col.names=FALSE,sep=",")
