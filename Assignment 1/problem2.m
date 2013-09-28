data = importdata('dataset1b.txt');
x = data(:,1);
y = data(:,2);
Risk_test = findMinK(x,y)