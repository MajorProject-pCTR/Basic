function acc = findAccuracy(X, y, h, filename)

epsilon = 0.0001;
m = length(y);

d = abs(h-y);
max_diff = max(d);
min_diff = min(d);
avg_diff = mean(d);
count = sum(d<epsilon);
acc = (count/m)*100;

fprintf("Max_difference = %f\n", max_diff);
fprintf("Min_difference = %f\n", min_diff);
fprintf("Avg_difference = %f\n", avg_diff);
fprintf("Predictions with difference less than %f = %d out of %d tuples\n", epsilon, count, m);
fprintf("Accuracy = %f\n\n", acc);

csvwrite(filename, h);

end
