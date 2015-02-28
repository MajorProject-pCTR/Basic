function X_norm = normalizeTestData(X,mu,sigma)

for iter = 1 : size(X,2)
	X_norm(:,iter) = (X(:,iter)-mu(iter))/sigma(iter);
end

end
