% Script File: ShowMixed
% Minimizes the sep function by doing a few steepest descent steps
% (with line search) and then a few full Newton steps.


close all
SDSteps = 2;  % The number of steepest descent steps.
NSteps = 10;  % The number of Newton steps.

planet1 = struct('A',10,'P',2,'phi', pi/8); 
planet2 = struct('A', 4,'P',1,'phi',-pi/7);

Lmax = 1;           % Max line step 
con_size = 20;      % Size of the contour plot
% Plot the two orbits.
figure
t=linspace(0,2*pi);
Orbit(t,planet1,'-');
hold on
Orbit(t,planet2,'--');
hold off
% Display contours of the sep function.
tRange = linspace(0,2*pi,con_size);
Z = zeros(con_size,con_size);
for i=1:con_size
   for j=1:con_size
      t = [tRange(j);tRange(i)];
      Z(i,j) = Sep(t,planet1,planet2);
   end
end
figure
C = contour(tRange,tRange,Z,10);
title('Enter Contour Labels (Optional). To quit, strike <return>.')
xlabel('t1')
ylabel('t2')
Clabel(C,'manual') 
% Get ready for the iteration.
title('Enter Starting Point for Steepest Descent')
tc = zeros(2,1);
[tc(1),tc(2)] = ginput(1);
fc = Sep(tc,planet1,planet2);
gc = gSep(tc,planet1,planet2);
tvals = tc;
fvals = fc;
gvals = norm(gc);
title('')
% Steepest Descent with line search:
clc
disp('Step     sep              t(1)                 t(2)          norm(grad)')
disp('------------------------------------------------------------------------')
disp(sprintf('%2.0f %10.6f     %18.15f   %18.15f    %5.1e ',0,fc,tc,norm(gc)))
figure(3)
for step = 1:SDSteps    
   [tnew,fnew,gnew] = SDStep(tc,fc,gc,planet1,planet2,Lmax,0);      
   tvals = [tvals tnew];       tc = tnew;
   fvals = [fvals fnew];       fc = fnew;
   gvals = [gvals norm(gnew)]; gc = gnew;
   disp(sprintf('%2.0f %10.6f     %18.15f   %18.15f    %5.1e ',step,fc,tc,norm(gc)))
end
disp('------------------------------------------------------------------------')
[gc,Hc] = gHSep(tc,planet1,planet2);
for step=SDSteps+1:SDSteps+NSteps;
   tc = tc - Hc\gc;
   [gc,Hc] = gHSep(tc,planet1,planet2);
   fc = Sep(tc,planet1,planet2);	  
   tvals = [tvals tc];       
   fvals = [fvals fc];      
   gvals = [gvals norm(gc)]; 
   disp(sprintf('%2.0f %10.6f     %18.15f   %18.15f    %5.1e ',step,fc,tc,norm(gc)))
end
% Show solution on orbit plot:
figure(1)
hold on
last = length(gvals); 
pt1 = Orbit(tvals(1,last),planet1,'*');
pt2 = Orbit(tvals(2,last),planet2,'*');
plot([pt1.x pt2.x],[pt1.y pt2.y])
title(sprintf('min Sep = %8.4f',fvals(last)))
hold off
% Show the descent path on the contour plot:

figure(2)
hold on
plot(tvals(1,:),tvals(2,:),tvals(1,1),tvals(2,1),'o')
hold off
title(sprintf('tmin = (%8.3f,%8.3f)   norm(gmin)= %8.4e',tvals(1,last),tvals(2,last),gvals(last)))
% Plot the descent of the sep and its gradient:
figure(4)
subplot(2,1,1)
plot(fvals)
title('Value of Sep')
xlabel('Iteration')
subplot(2,1,2)
semilogy(gvals)
title('Value of norm(gSep).')
xlabel('Iteration')