function quadX = addQuadFeatures(X)

n = size(X,2);
quadX = X;

for i = 1:n
	for j = i:n
		quadX(:,end+1) = X(:,i) .* X(:,j);
	end
	printf('%d\n', i);
	fflush(stdout);
end

end

