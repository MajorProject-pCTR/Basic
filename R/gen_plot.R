gen_plot <- function() {

	ad_data <- read.table("train_sub.txt")
	names(ad_data) <- c("click", "impression", "ad_urlhash", "ad_id", "advertiser_id", "depth", "position", "user_id", "desc_id", "desc_id_tokencnt", "title_id", "title_id_tokencnt", "purc_key_id", "purc_key_id_tokencnt", "query_id", "query_id_tokencnt")

	print("data loaded")

	CTR <- ad_data$click/ad_data$impression

	for(n in names(ad_data)) {

		if(n!="click" && n!="impression"){ 
			var <- ad_data[[n]]
		
			name <- paste(n,"Vs CTR.jpeg")

			print(name)

			jpeg(name)

			plot(var,CTR,xlab=n,col="green")

			dev.off()
		}
	}
}
