data = load('../train_improved_join.txt');

%data = load('join.txt');

%{
y = data(:,1) ./ data(:,2);

y_class = y>0.5; %threshold for y	- old approximate approach
%}

y = data(:,1);
X = data(:,[3:end]);

%{
y = data(:,6);
X = data(:,[8:end]);
%}

m = length(y);
%{
fprintf('Adding Polynomial Features\n');
X = addPolyFeatures(X);

X = addQuadFeatures(X);
fprintf('Training set Quad now\n');

pause;
%}
fprintf("Normalizing Features\n");
[X mu sigma] = featureNormalize(X);
fprintf("Features normalized\n");

X = [ones(m,1) X];

%loading train_sub
train_data = load('../train_improved_join_orig.txt');

X_train = train_data(:,[4:end]);
y_train = train_data(:,1) ./ train_data(:,2);

[X_train mu sigma] = featureNormalize(X_train);
X_train = [ones(length(y_train),1) X_train];

%loading valid_sub
valid_data = load('../valid_improved_join_orig.txt');
y_valid = valid_data(:,1) ./ valid_data(:,2);
X_valid = valid_data(:,[4:end]);

X_valid = normalizeTestData(X_valid, mu, sigma);
X_valid = [ones(length(y_valid),1) X_valid];

%log_reg with validation
lambda_list = [0 0.25 0.5 0.75 1 5 10];

initial_theta = zeros(size(X, 2), 1);

cost_valid = -1;
time_taken = -1;
cost_diff = 100;
best_lambda = lambda_list(1);

options = optimset('GradObj', 'on', 'MaxIter', 500);

for lambda = lambda_list

	tic();
	[theta_temp, J, exit_flag] = fminunc(@(t)(costFunction(t, X, y, lambda)), initial_theta, options);
	time_taken_temp = toc();

	[cost_temp1, grad] = costFunction(theta_temp, X_train, y_train, lambda);
	[cost_temp2, grad] = costFunction(theta_temp, X_valid, y_valid, lambda);

	if(time_taken == -1 || time_taken_temp > time_taken)
		time_taken = time_taken_temp;			%gives max time taken for gradient descent
	endif

	fprintf('lambda, Cost_diff, cost_temp2-cost_temp1, cost_temp2, Cost_valid, best_lambda = %f, %f, %f, %f, %f, %f\n', lambda, cost_diff, cost_temp2-cost_temp1, cost_temp2, cost_valid, best_lambda);

	if(cost_valid == -1 || ((cost_diff > (cost_temp2-cost_temp1)) && (cost_valid > cost_temp2)) )
		cost_diff = cost_temp2-cost_temp1; 
		cost_valid = cost_temp2;
		theta = theta_temp;
		best_lambda = lambda;
	endif

end

fprintf('Min Cost for valid_data = %f \n\n', cost_valid);
fprintf('Best lambda = %f\n', best_lambda);

fprintf('Time taken for training = %f \n', time_taken)

fprintf("Train\n");
%pause;

lambda = best_lambda;

pred = predict(theta, X_train);

pred(1:10)

[cost, grad] = costFunction(theta, X_train, y_train, lambda);
fprintf('Cost = %f \n\n', cost);

findAccuracy(X_train, y_train, pred);

csvwrite("../pred_train.csv", pred);


fprintf("Test\n");
%pause;

data = load('../test_improved_join_orig.txt');

X = data(:,[4:end]);
y = data(:,1) ./ data(:,2);

X = normalizeTestData(X,mu,sigma);

m = length(y);
X = [ones(m,1) X];

pred = predict(theta, X);

pred(1:10)

[cost, grad] = costFunction(theta, X, y, lambda);
fprintf('Cost = %f \n\n', cost);

findAccuracy(X, y, pred);

csvwrite("../pred_test.csv", pred);

