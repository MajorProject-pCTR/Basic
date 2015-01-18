data = load('xaa');
m = size(data);

fprintf("Loaded the dataset\n");
pause;

index = 1;

for i = 1 : m
	click = data(i,1);
	impression = data(i,2);

	for i = 1 : click
		class_data(index,:) = [index 1 data(i,[3:end])];
		index++;
	end

	for i = 1 : impression - click
		class_data(index,:) = [index 0 data(i,[3:end])];
		index++;
	end	
end	

fprintf("Created new dataset\n");
pause;

csvwrite("input_for_class.txt", class_data);
