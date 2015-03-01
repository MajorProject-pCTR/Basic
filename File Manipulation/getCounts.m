function[l1, l2, l3] = getCounts(tf_name = 'train_sub.txt', cf_name = 'train_sub.csv', uf_name = 'train_unrolled.txt')

printf("%s\n",tf_name)
data = load(tf_name);
impr = data(:,2);
l1 = sum(impr)

printf("%s\n",cf_name)
data = load(cf_name);
impr = data(:,2);
l2 = sum(impr)

printf("%s\n",uf_name)
unrolled_data = load(uf_name);
l3 = size(unrolled_data,1)

end
