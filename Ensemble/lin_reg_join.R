lin_reg_join <- function() {

	ad_data <- read.table("train_improved_join_orig.txt")
	names(ad_data) <- c("click", "impression", "ad_urlhash", "ad_id", "advertiser_id", "depth", "position", "user_id", "desc_id", "desc_id_tokencnt", "title_id", "title_id_tokencnt", "purc_key_id", "purc_key_id_tokencnt", "query_id", "query_id_tokencnt")

	print("Loaded the data")

	start <- Sys.time()
	lm.fit <- lm(click/impression~ad_id+advertiser_id+depth+position+user_id+desc_id+desc_id_tokencnt+title_id+title_id_tokencnt+purc_key_id+purc_key_id_tokencnt+query_id+query_id_tokencnt, data=ad_data)
	end <- Sys.time()

	print("Model trained")

	h<-predict(lm.fit)
	write(h,file="lin_train.csv",sep="\n")



	ad_data <- read.table("train_improved_join.txt")
	names(ad_data) <- c("if_click", "ad_urlhash", "ad_id", "advertiser_id", "depth", "position", "user_id", "desc_id", "desc_id_tokencnt", "title_id", "title_id_tokencnt", "purc_key_id", "purc_key_id_tokencnt", "query_id", "query_id_tokencnt")

	h<-predict(lm.fit,ad_data)
	write(h,file="lin_train_unrolled.csv", sep="\n")



	ad_data <- read.table("valid_improved_join_orig.txt")
	names(ad_data) <- c("click", "impression", "ad_urlhash", "ad_id", "advertiser_id", "depth", "position", "user_id", "desc_id", "desc_id_tokencnt", "title_id", "title_id_tokencnt", "purc_key_id", "purc_key_id_tokencnt", "query_id", "query_id_tokencnt")

	h<-predict(lm.fit,ad_data)
	write(h,file="lin_valid.csv", sep="\n")



	ad_data <- read.table("test_improved_join_orig.txt")
	names(ad_data) <- c("click", "impression", "ad_urlhash", "ad_id", "advertiser_id", "depth", "position", "user_id", "desc_id", "desc_id_tokencnt", "title_id", "title_id_tokencnt", "purc_key_id", "purc_key_id_tokencnt", "query_id", "query_id_tokencnt")

	h<-predict(lm.fit,ad_data)
	write(h,file="lin_test.csv", sep="\n")

	diff <- end - start
}
