logistic <- function(all=TRUE) {
	start <- Sys.time()
	ad_data <- read.table("train_unrolled.txt")
	names(ad_data) <- c("click", "impression", "if_click", "ad_urlhash", "ad_id", "advertiser_id", "depth", "position", "query_id", "keyword_id", "title_id", "desc_id", "user_id")

	print("Unrolled data ready")

	if(all){
		start <- Sys.time()
		glm.fit=glm(if_click~ad_id+advertiser_id+depth+position+query_id+keyword_id+title_id+desc_id+user_id, data=ad_data, family=binomial)
		end <- Sys.time()
		glm.probs=predict(glm.fit,ad_data,type="response")
		write(glm.probs,file="pred_train.txt",sep="\n")
	}
	else{
		start <- Sys.time()
		glm.fit=glm(if_click~depth+position, data=ad_data, family=binomial)
		end <- Sys.time()
		glm.probs=predict(glm.fit,ad_data,type="response")
		write(glm.probs,file="pred_train.txt",sep="\n")
	}

	print("Model trained")

	ad_data <- read.table("test_unrolled.txt")
	names(ad_data) <- c("click", "impression", "if_click", "ad_urlhash", "ad_id", "advertiser_id", "depth", "position", "query_id", "keyword_id", "title_id", "desc_id", "user_id")
	glm.probs=predict(glm.fit,ad_data,type="response")
	write(glm.probs,file="pred_test.txt",sep="\n")
	diff <- end - start
}
