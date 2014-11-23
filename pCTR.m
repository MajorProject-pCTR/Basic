fprintf('Loading the dataset.....\n');
data = load('rand_sub.txt');

y = data(:,1) ./ data(:,2);
X = data(:,[6,7]);

m = length(y);

X = [ones(m,1) X];

fprintf('Loaded the dataset\n');
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
pause;

acc = findAccuracy(X, y, theta);

fprintf('Training set accuracy : %f \n', acc);
pause;

%%%%%%

fprintf('Onto test set xaa\n');
pause;
data = load('xaa');
y_test = data(:,1) ./ data(:,2);
X_test = data(:,[6,7]);

m_test = length(y_test);

X_test = [ones(m_test,1) X_test];

cost = computeCost(X_test, y_test, theta);

fprintf('Cost = %f \n', cost);
pause;

acc = findAccuracy(X_test, y_test, theta);

fprintf('Test set accuracy : %f \n', acc);

%%%%%%

fprintf('Onto test set xar\n');
pause;
data = load('xar');
y_test = data(:,1) ./ data(:,2);
X_test = data(:,[6,7]);

m_test = length(y_test);

X_test = [ones(m_test,1) X_test];

cost = computeCost(X_test, y_test, theta);

fprintf('Cost = %f \n', cost);
pause;

acc = findAccuracy(X_test, y_test, theta);

fprintf('Test set accuracy : %f \n', acc);

%%%%%%

fprintf('Onto test set xbl\n');
pause;
data = load('xbl');
y_test = data(:,1) ./ data(:,2);
X_test = data(:,[6,7]);

m_test = length(y_test);

X_test = [ones(m_test,1) X_test];

cost = computeCost(X_test, y_test, theta);

fprintf('Cost = %f \n', cost);
pause;

acc = findAccuracy(X_test, y_test, theta);

fprintf('Test set accuracy : %f \n', acc);
