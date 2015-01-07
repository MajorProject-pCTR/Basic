function m = predict(all_theta, X)  %m=actual value of probability is returned

m = size(all_theta, 1);
p = size(all_theta, 1);

[m, p] = max(X*all_theta', [], 2);

end
