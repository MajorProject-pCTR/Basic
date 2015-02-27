lin_reg <- function(all=TRUE) {

	ad_data <- read.table("train_sub.txt")
	names(ad_data) <- c("click", "impression", "ad_urlhash", "ad_id", "advertiser_id", "depth", "position", "query_id", "keyword_id", "title_id", "desc_id", "user_id")

	print("Loaded the data")

	if(all){
		start <- Sys.time()
		lm.fit <- lm(click/impression~ad_id+advertiser_id+depth+position+query_id+keyword_id+title_id+desc_id+user_id, data=ad_data)
		end <- Sys.time()
	}
	else{
		start <- Sys.time()
		lm.fit <- lm(click/impression~depth+position, data=ad_data)
		end <- Sys.time()
	}

	print("Model trained")

	h<-predict(lm.fit)
	write(h,file="pred_train.csv",sep="\n")

	ad_data <- read.table("test_sub.txt")
	names(ad_data) <- c("index", "if_click", "ad_urlhash", "ad_id", "advertiser_id", "depth", "position", "query_id", "keyword_id", "title_id", "desc_id", "user_id")

	h<-predict(lm.fit,ad_data)
	write(h,file="pred_test.csv", sep="\n")

	diff <- end - start
}
