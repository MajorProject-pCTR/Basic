%data = load('rand_sub.txt');

y = data(:,1) ./ data(:,2);
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

fprintf('Starting Gradient Descent\n'); 

alpha = 0.01;
num_iters = 1000;

theta = zeros(size(X,2),1);
[theta, J_history] = gradientDescent(X,y,theta,alpha,num_iters);

fprintf("Gradient Descent Complete\n");
pause;

fprintf('initial 10 values of J\n');
J_history(1:10)

fprintf('final 10 values of J\n');
J_history(num_iters-10+1:end)

%convergence graph
figure;
plot(1:numel(J_history), J_history, '-g', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

cost = 0;
cost = computeCost(X, y, theta);

fprintf('Cost(Training dataset) = %f \n', cost);

findAccuracy(X, y, theta);

pause;

%%%%%%
%{
fprintf('Onto test set xaa\n');

data = load('xaa');
y_test = data(:,1) ./ data(:,2);
X_test = data(:,[6,7]);

m_test = length(y_test);

X_test = [ones(m_test,1) X_test];

cost = computeCost(X_test, y_test, theta);

fprintf('Cost = %f \n', cost);

findAccuracy(X_test, y_test, theta);

%%%%%%

