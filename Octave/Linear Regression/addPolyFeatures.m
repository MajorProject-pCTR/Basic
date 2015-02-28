function polyX = addPolyFeatures(X)

n = size(X,2);
polyX = X;

for i = 1:n
	polyX(:,end+1) = X(:,i) .^ 3 ;
	printf('%d\n', i);
	fflush(stdout);
end

for i = 1:n
	polyX(:,end+1) = X(:,i) .^ 5 ;
	printf('%d\n', i);
	fflush(stdout);
end

for i = 1:n-1
	polyX(:,end+1) = X(:,i) .* X(:,i+1) ;
	printf('%d\n', i);
	fflush(stdout);
end

for i = 1:n-2
	polyX(:,end+1) = X(:,i) .* X(:,i+1) .* X(:,i+2) ;
	printf('%d\n', i);
	fflush(stdout);
end

end

