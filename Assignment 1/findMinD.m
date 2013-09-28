function [ D] = findMinD( x,y )

%config the experiment repeat time
randomCycle = 10;

%config the max value we pick to training learning funciton
dimensionMax = 10;

%initialize a random matrix to randomly select training data and testing
%data
matrix_rand = ones(randomCycle,size(y,1));
for j = 1:randomCycle
    matrix_rand(j,:) = randsample(size(y,1),size(y,1));
end
for cycle = 1:randomCycle
    cycle
    %initialize X,XT,Y,YT
    X = zeros(size(y,1)/2,1);
    XT = zeros(size(y,1)/2,1);
    Y = zeros(size(y,1)/2,1);
    YT = zeros(size(y,1)/2,1);
    
    %initialize X,Y
    for i = 1:size(y,1)/2
        X(i) = x(matrix_rand(cycle,i));
        Y(i) = y(matrix_rand(cycle,i));
    end
    
    %initialize XT,YT
    for m = (size(y,1)/2+1):size(y,1)
        XT(m-5) = x(matrix_rand(cycle,m));
        YT(m-5) = y(matrix_rand(cycle,m));
    end
   
    %initialize the data in training procedure.
    errTList = ones(dimensionMax);
    errList = ones(dimensionMax);
    D = 2;
    err0 = inf('double');
    
    %training learning function
    while D<=dimensionMax
        [err,model,errT] = polyreg(X,Y,D,XT,YT);
        errTList(D) = errT;
        errList(D) = err;
        D = D + 1;
    end
    
    % plot the Cross-validation figures
    M = (1:dimensionMax);
    %subplot(2, randomCycle/2,k);
    figure;
    plot(M, errTList,':',M,errList,'-r')
    axis([0 10 0 0.3])


end


end

