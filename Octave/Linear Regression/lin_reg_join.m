data = load('../train_improved_join_orig.txt');

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

%pause;

valid_data = load('../valid_improved_join_orig.txt');
y_valid = valid_data(:,1) ./ valid_data(:,2);
X_valid = valid_data(:,[4:end]);

X_valid = normalizeTestData(X_valid, mu, sigma);
X_valid = [ones(length(y_valid),1) X_valid];

fprintf('Starting Gradient Descent\n'); 

alpha_list = [0.001 0.003 0.01 0.03 0.1 0.3];
num_iters = 1000;

init_theta = zeros(size(X,2),1);
min_cost = -1;
theta = zeros(size(X,2),1);
time_taken = -1;
best_alpha = alpha_list(1);

for alpha = alpha_list
	tic();
	[theta_temp, J_history] = gradientDescent(X,y,init_theta,alpha,num_iters);
	time_taken_temp = toc();

	cost = computeCost(X_valid, y_valid, theta_temp);

	if(time_taken == -1 || time_taken_temp > time_taken)
		time_taken = time_taken_temp;			%gives max time taken for gradient descent
	endif

	if(min_cost == -1 || min_cost > cost)
		min_cost = cost;
		theta = theta_temp;
		best_alpha = alpha;
	else
		break;
	endif

end

fprintf('Min Cost for valid_data = %f \n\n', min_cost);
fprintf('Best alpha = %f\n', best_alpha);

%fprintf("Gradient Descent Complete\n");
%pause;

%fprintf('initial 10 values of J\n');
%J_history(1:10)

%fprintf('final 10 values of J\n');
%J_history(num_iters-10+1:end)

%convergence graph
%figure;
%plot(1:numel(J_history), J_history, '-g', 'LineWidth', 2);
%xlabel('Number of iterations');
%ylabel('Cost J');

cost = 0;
cost = computeCost(X, y, theta);

fprintf('Time taken for training = %f \n', time_taken)

fprintf('Train \n');
fprintf('Cost = %f \n\n', cost);

findAccuracy(X, y, theta, "../pred_train.csv");

%pause;


fprintf('Test \n');

data = load('../test_improved_join_orig.txt');
y_test = data(:,1) ./ data(:,2);
X_test = data(:,[4:end]);

X_test = normalizeTestData(X_test, mu, sigma);

m_test = length(y_test);

X_test = [ones(m_test,1) X_test];

cost = computeCost(X_test, y_test, theta);

fprintf('Cost = %f \n\n', cost);

findAccuracy(X_test, y_test, theta, "../pred_test.csv");
