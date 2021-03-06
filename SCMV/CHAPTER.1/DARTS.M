% Script File: Darts
% Estimates pi using random dart throws.

close all
rand('seed',.123456) 
NumberInside = 0;
PiEstimate = zeros(500,1);
for k=1:500
   x = -1+2*rand(100,1);
   y = -1+2*rand(100,1);
   NumberInside = NumberInside + sum(x.^2 + y.^2 <= 1);
   PiEstimate(k) = (NumberInside/(k*100))*4;    
end
plot(PiEstimate)
title(sprintf('Monte Carlo Estimate of Pi = %5.3f',PiEstimate(500)));
xlabel('Hundreds of Trials') 