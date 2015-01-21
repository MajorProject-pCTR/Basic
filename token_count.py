in_file = open("descriptionid_tokensid.txt","r")
out_file = open("descriptionid_tokenscount.txt","w")
for line in in_file :
	id = line.split()[0]
	count = len(line.split("|"))
	out_file.write(str(id)+"\t"+str(count)+"\n")
in_file.close()
out_file.close()
