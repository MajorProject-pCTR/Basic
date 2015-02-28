data = load('../train_unrolled.txt');

%data = load('join.txt');

%{
y = data(:,1) ./ data(:,2);

y_class = y>0.5; %threshold for y	- old approximate approach
%}

y = data(:,2);
X = data(:,[6,7]);

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

initial_theta = zeros(size(X, 2), 1);
lambda = 1;

options = optimset('GradObj', 'on', 'MaxIter', 500);

tic();
[theta, J, exit_flag] = fminunc(@(t)(costFunction(t, X, y, lambda)), initial_theta, options);
time_taken = toc();


fprintf('Time taken for training = %f \n', time_taken)

fprintf("Train\n");
%pause;

data = load('../train_sub.txt');

X = data(:,[6,7]);
y = data(:,1) ./ data(:,2);

[X mu sigma] = featureNormalize(X);
m = length(y);
X = [ones(m,1) X];

pred = predict(theta, X);

pred(1:10)

[cost, grad] = costFunction(theta, X, y, lambda);
fprintf('Cost = %f \n\n', cost);

findAccuracy(X, y, pred);

csvwrite("../pred_train.csv", pred);


fprintf("Test\n");
%pause;

data = load('../test_sub.txt');

X = data(:,[6,7]);
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

