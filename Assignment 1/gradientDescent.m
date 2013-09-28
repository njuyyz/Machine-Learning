function [ theta ] = gradientDescent( X,y )


theta = ones(size(X,2),1);
epsilo = 0.001;
gama = 10;
m = size(X,1);
risk = 0;
cycle = 1;
Risk=0;
errCount = zeros(1000,1);
while cycle<1000
    
    s = sigmoid(X*theta);
    o = s-y;
    Risk = 1/m*sum(-y.*log(s)-(1-y).*log(1-s));
    grad = 1/m*sum(repmat(o,1,size(X,2)).*X)';
    thetaT = theta - (gama*grad);
    errCount(cycle) = sum((y-0.5*ones(length(y),1)).*(s-0.5*ones(length(y),1))<0);
    s = sum((thetaT-theta).^2);
    if sum((thetaT-theta).^2)<= epsilo
        theta = thetaT;
        break
    end
    theta = thetaT;
    cycle = cycle+1;
end
cycle
Risk

% Plot Boundary
plotDecisionBoundary(theta, X, y);

figure;
S = (1:cycle+5);
errCount = errCount(1:cycle+5);
plot(S,errCount);

end
