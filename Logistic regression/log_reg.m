%data = load('unrolled.txt');
fprintf('check\n');
pause;

data = load('join.txt');

%{
y = data(:,1) ./ data(:,2);

y_class = y>0.5; %threshold for y	- old approximate approach
%}

%{
y = data(:,2);
X = data(:,[4:end]);
%}

y = data(:,6);
X = data(:,[8:end]);

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


num_labels = 1; %giving value 2 would involve unncessary computations but give same result

lambda = 10;

all_theta = onevsall(X, y, num_labels, lambda);


fprintf("Prediction on training data\n");
pause;

pred = predict(all_theta, X);

pred(1:10)

findAccuracy(X, y, pred);


#testing on original subset file

%{
fprintf("Testing on rand_sub.txt");
pause;

data = load('rand_sub.txt');

y = data(:,1) ./ data(:,2);
X = data(:,[4:end]);

X = normalizeTestData(X,mu,sigma);

m = length(y);
X = [ones(m,1) X];

pred = predict(all_theta, X);

pred(1:10)

findAccuracy(X, y, pred);
%}
