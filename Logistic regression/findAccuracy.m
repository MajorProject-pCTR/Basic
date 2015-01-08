function acc = findAccuracy(X, y, h)

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

csvwrite("log_reg_output.txt", h);
csvwrite("comp_log_reg_output.txt", 1-h);

h = [h y];
csvwrite("output_visualize_log_reg.txt", h);

end
