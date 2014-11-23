function acc = findAccuracy(X, y, theta)

h = X*theta;
acc = sum(h==y)/length(y)*100;

end
