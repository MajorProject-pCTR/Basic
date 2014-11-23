function [theta, J_history, h_history] = gradientDescent(X, y, theta, alpha, num_iters)

m = length(y);
J_history = zeros(num_iters, 1);

for iter = 1:num_iters
	h = X*theta;
	delta = (X'*(h-y))/m;
	theta = theta - alpha*delta;

	J_history(iter) = computeCost(X, y, theta);
end

end
