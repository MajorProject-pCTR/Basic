linear_reg <- function(all=TRUE) {

	ad_data <- read.table("train_sub.txt")
	names(ad_data) <- c("click", "impression", "ad_urlhash", "ad_id", "advertiser_id", "depth", "position", "query_id", "keyword_id", "title_id", "desc_id", "user_id")

	if(all){
		start <- Sys.time()
		reg <- lm(click/impression~ad_id+advertiser_id+depth+position+query_id+keyword_id+title_id+desc_id+user_id)
		end <- Sys.time()
	}
	else{
		start <- Sys.time()
		reg <- lm(click/impression~depth+position)
		end <- Sys.time()
	}

	write(h,file="pred_train.csv",sep="\n")

	ad_data <- read.table("test_sub.txt")
	names(ad_data) <- c("index", "if_click", "ad_urlhash", "ad_id", "advertiser_id", "depth", "position", "query_id", "keyword_id", "title_id", "desc_id", "user_id")

	write(h,file="pred_test.csv", sep="\n")
