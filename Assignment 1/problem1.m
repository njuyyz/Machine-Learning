data = importdata('dataset1a.txt');
x = data(:,1);
y = data(:,2);
[D]= findMinD(x,y);