function [ errTList ] = findMinK( X,Y )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
xT = X(abs(5.0/10*(size(X,1))+1):size(X,1),:);
yT = Y(abs(5.0/10*(size(Y,1))+1):size(Y,1),:);
x = X(1:abs(5.0/10*(size(X,1))),:);
y = Y(1:abs(5.0/10*(size(Y,1))),:);

D = 1;
%err0 = inf('double');
modelMin = 0;
errTList = ones(20,1);
errList = ones(20,1);
while D<21
    [err,model,errT] = sinreg(x,y,D,xT,yT);
    errTList(D) = errT;
    errList(D) = err;
    %if err0 > errT
        %err0 = errT;
        %modelMin = model;
    %else
     %   break;
    %end
    D = D + 1;
end
M = zeros(20);
for i = 1:20
    M(i) = i;
end
figure;
plot(M, errTList,':',M,errList,'-r')

axis([0 20 0 0.1])
end

