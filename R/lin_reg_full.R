lin_reg_full <- function(all=TRUE) {
start <- Sys.time()
	ad_data <- read.table("training.txt")
	names(ad_data) <- c("click", "impression", "ad_urlhash", "ad_id", "advertiser_id", "depth", "position", "query_id", "keyword_id", "title_id", "desc_id", "user_id")

	print("Loaded the data")

	if(all){
		
		lm.fit <- lm(click/impression~ad_id+advertiser_id+depth+position+query_id+keyword_id+title_id+desc_id+user_id, data=ad_data)
		
	}
	else{
		start <- Sys.time()
		lm.fit <- lm(click/impression~depth+position, data=ad_data)
		end <- Sys.time()
	}

	print("Model trained")

	h<-predict(lm.fit)
	write(h,file="pred_train_full.csv",sep="\n")

end <- Sys.time()
	diff <- end - start
}
