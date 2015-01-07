%data = load('rand_sub.txt');

y = data(:,1) ./ data(:,2);

y_class = y>0.5; %threshold for y

X = data(:,[4:end]);

m = length(y);
%{
fprintf('Adding Polynomial Features\n');
X = addPolyFeatures(X);

X = addQuadFeatures(X);
fprintf('Training set Quad now\n');

pause;
%}
fprintf("Normalizing Features ...\n");
[X mu sigma] = featureNormalize(X);
fprintf("Features normalized\n");

X = [ones(m,1) X];

pause;

num_labels = 1; %giving value 2 would involve unncessary computations but give same result

fprintf("Data ready\n");
pause;

lambda = 10;

all_theta = onevsall(X, y_class, num_labels, lambda);

pred = predict(all_theta, X);

fprintf("Prediction ready\n");
pause;

findAccuracy(X, y, pred);
