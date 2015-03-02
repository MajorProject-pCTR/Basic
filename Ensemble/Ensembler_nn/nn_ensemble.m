%data = load('join.txt');

%y = data(:,6);			
%X = data(:,[8:end]);

data = load('../unrolled_ensemble.txt');

y = data(:,1);
X = data(:,[2:end]);

fprintf("Normalizing Features ...\n");
[X mu sigma] = featureNormalize(X);
fprintf("Features normalized\n");

fprintf("Data ready\n");

%loading train_sub
train_data = load('../train_ip_ensemble.txt');

X_train = train_data(:,[3:end]);
y_train = train_data(:,1) ./ train_data(:,2);

[X_train mu sigma] = featureNormalize(X_train);

%loading valid_sub
valid_data = load('../valid_ip_ensemble.txt');
y_valid = valid_data(:,1) ./ valid_data(:,2);
X_valid = valid_data(:,[3:end]);

X_valid = normalizeTestData(X_valid, mu, sigma);

%pause;

input_layer_size = 3;

num_labels = 1;

hidd_lay_sizes = [1 2 3];

lambda_list = [0 0.25 0.5 0.75 1 5 10];

cost_valid = -1;
time_taken = -1;
cost_diff = 100;

for hidden_layer_size = hidd_lay_sizes

fprintf('Hidden_layer_size = %d\n', hidden_layer_size);

theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
theta2 = randInitializeWeights(hidden_layer_size, num_labels);
nn_params_init = [theta1(:); theta2(:)];

for lambda = lambda_list

	fprintf('Lambda = %f\n', lambda);

	options = optimset('MaxIter', 100);
	costFunction = @(p) nnCostFunction(p, ...
		                           input_layer_size, ...
		                           hidden_layer_size, ...
		                           num_labels, X, y, lambda);

	% Now, costFunction is a function that takes in only one argument (the
	% neural network parameters)

	tic();
	[nn_params_temp, cost] = fmincg(costFunction, nn_params_init, options);
	time_taken_temp = toc();

	[cost_temp1, grad] = nnCostFunction(nn_params_temp, input_layer_size, hidden_layer_size, num_labels, X_train, y_train, lambda);
	[cost_temp2, grad] = nnCostFunction(nn_params_temp, input_layer_size, hidden_layer_size, num_labels, X_valid, y_valid, lambda);

	if(time_taken == -1 || time_taken_temp > time_taken)
		time_taken = time_taken_temp;			%gives max time taken for gradient descent
	endif

	if(cost_valid == -1 || ((cost_diff > (cost_temp2-cost_temp1)) && (cost_valid > cost_temp2)) )
		cost_diff = cost_temp2-cost_temp1; 
		cost_valid = cost_temp2;
		nn_params = nn_params_temp;
		best_lambda = lambda;
		best_hl_size = hidden_layer_size;

	endif

end

end

lambda = best_lambda;
hidden_layer_size = best_hl_size;

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

fprintf('Min Cost for valid_data = %f \n\n', cost_valid);
fprintf('Best lambda = %f Opt hidden layer size = %f\n', best_lambda, best_hl_size);

fprintf('Time taken for training = %f \n', time_taken)
%pause;

fprintf("Train\n");

pred = predict(Theta1, Theta2, X_train);

pred(1:10)

[cost, grad] = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X_train, y_train, lambda);
fprintf('Cost = %f \n\n', cost);

findAccuracy(X_train, y_train, pred, '../pred_train.csv')


fprintf("Test\n");
%pause;

data = load('../test_ip_ensemble.txt');

X = data(:,[3:end]);
y = data(:,1) ./ data(:,2);

X = normalizeTestData(X, mu, sigma);

pred = predict(Theta1, Theta2, X);

pred(1:10)

[cost, grad] = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, lambda);
fprintf('Cost = %f \n\n', cost);

findAccuracy(X, y, pred, '../pred_test.csv')

