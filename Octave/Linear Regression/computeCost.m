function J = computeCost(X, y, theta)

m = length(y);
J = 0;

h = X * theta;
J = ((h-y)'*(h-y))/(2*m);

end
