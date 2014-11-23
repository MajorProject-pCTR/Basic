function acc = findAccuracy(X, y, theta)

h = round(X*theta);
acc = sum(h==y)/length(y)*100;

end
