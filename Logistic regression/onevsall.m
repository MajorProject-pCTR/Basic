function [all_theta] = onevsall(X, y, num_labels, lambda)

m = size(X,1);
n = size(X,2);

all_theta = zeros(num_labels, n);

initial_theta = zeros(n,1);
options = optimset('GradObj', 'on', 'MaxIter', 100);

for c = 1:num_labels
	printf('%d\n', c);
	fflush(stdout);
	[theta] = fmincg(@(t)(costFunction(t, X, (y == c), lambda) ), initial_theta, options );
	all_theta(c,:) = theta';
end

end 
