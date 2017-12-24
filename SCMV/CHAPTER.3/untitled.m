clear all;
close all;
f = @(x) 1./(1 + 25*x.^2);
figure(1);
clf;

x = linspace(-1,1,500);
y_true = f(x);
plot(x,y_true,'r','linewidth',2);
hold on;

% Equally spaced points
N = 10;    % Degree of the polynomial we try to fit
xdata = linspace(-1,1,N+1)';
ydata = f(xdata);

p = polyfit(xdata,ydata,N);

y_fit = polyval(p,x);

poly_10 = plot(x,y_fit,'b','linewidth',2);

plot(xdata,ydata,'k.','markersize',30);
snapnow;