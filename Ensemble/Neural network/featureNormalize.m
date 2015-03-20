function [X_norm, mu, sigma] = featureNormalize(X)

X_norm = X;
mu = mean(X);
sigma = std(X);

for iter = 1 : size(X, 2)
	X_norm(:,iter) = (X(:,iter)-mu(iter))/sigma(iter);
end


end
