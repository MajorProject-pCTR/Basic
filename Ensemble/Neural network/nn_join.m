%data = load('join.txt');

%y = data(:,6);			
%X = data(:,[8:end]);

data = load('../train_improved_join.txt');

y = data(:,1);
X = data(:,[3:end]);

fprintf("Normalizing Features ...\n");
[X mu sigma] = featureNormalize(X);
fprintf("Features normalized\n");

fprintf("Data ready\n");

%loading train_sub
train_data = load('../train_improved_join_orig.txt');

X_train = train_data(:,[4:end]);
y_train = train_data(:,1) ./ train_data(:,2);

[X_train mu sigma] = featureNormalize(X_train);

%loading valid_sub
valid_data = load('../valid_improved_join_orig.txt');
y_valid = valid_data(:,1) ./ valid_data(:,2);
X_valid = valid_data(:,[4:end]);

X_valid = normalizeTestData(X_valid, mu, sigma);

%pause;

input_layer_size = 13;
hidden_layer_size = 6;
num_labels = 1;

lambda = 0;

theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
theta2 = randInitializeWeights(hidden_layer_size, num_labels);
nn_params = [theta1(:); theta2(:)];


options = optimset('MaxIter', 100);
costFunction = @(p) nnCostFunction(p, ...
		                   input_layer_size, ...
		                   hidden_layer_size, ...
		                   num_labels, X, y, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)

tic();
[nn_params, cost] = fmincg(costFunction, nn_params, options);
time_taken = toc();

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

fprintf('Time taken for training = %f \n', time_taken)
%pause;

fprintf("Unrolled_train\n");

pred = predict(Theta1, Theta2, X);

[cost, grad] = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, lambda);
fprintf('Cost = %f \n\n', cost);

csvwrite('../nn_train_unrolled.csv', pred);

fprintf("Train\n");

pred = predict(Theta1, Theta2, X_train);

[cost, grad] = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X_train, y_train, lambda);
fprintf('Cost = %f \n\n', cost);

csvwrite('../nn_train.csv', pred);

fprintf("Valid\n");

pred = predict(Theta1, Theta2, X_valid);

[cost, grad] = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X_valid, y_valid, lambda);
fprintf('Cost = %f \n\n', cost);

csvwrite('../nn_valid.csv', pred);

fprintf("Test\n");

data = load('../test_improved_join_orig.txt');

X = data(:,[4:end]);
y = data(:,1) ./ data(:,2);

X = normalizeTestData(X, mu, sigma);

pred = predict(Theta1, Theta2, X);

[cost, grad] = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, lambda);
fprintf('Cost = %f \n\n', cost);

csvwrite('../nn_test.csv', pred);

