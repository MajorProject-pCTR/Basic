function m = predict(Theta1, Theta2, X)

m = size(X, 1);
p = zeros(size(X, 1), 1);

m = size(X,1);

X = [ones(m,1) X];

all_a2 = sigmoid(Theta1 * X');
all_a2 = [ones(1,m); all_a2];

all_h = sigmoid(Theta2 * all_a2);

m = all_h';

end
