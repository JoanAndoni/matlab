%Bisection
clear *, close all, clc
x = -2.1:0.01:2.1;
f = @(a) a.^2-1;

plot(x, f(x)), hold on
grid on

x1 = -2;
x2 = 0.5;
maxIter = 100;
tol = 1e-2;
iter = 0;
err = inf;
xprev = 10;
while iter < maxIter && err > tol
    iter =iter +1;
    xn = (x1 +x2)/2;
    if f(xn)*f(x2) < 0
        x1 = xn; x1 = xn;
    elseif f(xn)*f(x2) > 0
        x1 = x1; x2 = xn;
    else
        break;
    end
    if iter > 2
        err = abs((xn -exprev)/xn);
    end
    xprev = xn;
    plot(xn, f(xn),'x')
    pause
    
end

disp(['This is the root' num2str(xn)])

plot(xn, f(xn), '^')