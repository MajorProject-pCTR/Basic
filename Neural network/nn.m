data = load('join.txt');

y = data(:,6);			
X = data(:,[8:end]);

fprintf("Normalizing Features ...\n");
[X mu sigma] = featureNormalize(X);
fprintf("Features normalized\n");

fprintf("Data ready\n");

%pause;

input_layer_size = 9;
hidden_layer_size = 5;
num_labels = 1;

theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
theta2 = randInitializeWeights(hidden_layer_size, num_labels);
nn_params = [theta1(:); theta2(:)];

lambda = 0;

options = optimset('MaxIter', 100);
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)

[nn_params, cost] = fmincg(costFunction, nn_params, options);

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

fprintf("Onto the prediction\n");
%pause;

pred = predict(Theta1, Theta2, X);

pred(1:10)
findAccuracy(X, y, pred);

