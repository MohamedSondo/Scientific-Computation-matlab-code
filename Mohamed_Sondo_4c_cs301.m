
%Mohamed Sondo CS 301 HW1 Problem 4C
%Matlab Scipt to compute difference variance in problem 4b.
%% Program strats here

n=1000000; x=rand(1,n)*100 +1;

sum=0;var1=0;var2=0;

for i=1:n;

sum=sum+x(i);

end

mean_val=sum/n;

for i=1:n;

var1=var1+(x(i)-mean_val).^2;

end

var1=var1/n;

for i=1:n;

var2=var2+x(i).^2;

end

var2=(var2/n) -(mean(x)).^2;

disp('Variance Using Method 1')

disp(var1)

disp('Variance using Method 2')

disp(var2)

disp('MATLAB function calculated Variance')

disp(var(x))