function acc = findAccuracy(X, y, theta)

h = X*theta;
epsilon = 0.0001;
m = length(y);

d = abs(h-y);
max_diff = max(d);
min_diff = min(d);
count = sum(d<epsilon);
acc = (count/m)*100;

fprintf("Max_difference = %f\n", max_diff);
fprintf("Min_difference = %f\n", min_diff);
fprintf("Predictions with difference less than %f = %d\n out of %d tuples", epsilon, count, m);
fprintf("Accuracy = %f\n", acc);

end
