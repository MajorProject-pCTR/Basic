function [J, grad] = costFunction(theta, X, y, lambda)

m = length(y);
J = 0;
grad = zeros(size(theta));

h = sigmoid(X*theta);
J = -(y'*log(h) + (1-y)'*log(1-h))/m + (lambda/(2*m))*(theta(2:end)'*theta(2:end));

theta(1) = 0;
grad = (X'*(h-y))/m + (lambda/m)*theta;

end
