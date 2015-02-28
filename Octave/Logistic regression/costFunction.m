function [J, grad] = costFunction(theta, X, y, lambda)

m = length(y);

J = 0;
grad = zeros(size(theta));

h = sigmoid(X*theta);
n = size(theta);

J = -(1/m) * sum(y .* log(h) + (1-y) .* log(1-h)) + (lambda/(2*m)) * sum(theta([2:n],:) .^ 2);

grad = (X' * (h-y))/m + (lambda/m)*theta;
grad(1) = ( X'(1,:) * (h-y)(:,1) ) / m;

end
