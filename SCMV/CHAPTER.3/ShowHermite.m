% Script File: ShowHermite
% Plots a succession of cubic interpolants to cos(x).
% x(2) converges to x(1) = 0 and x(3) converges to x(4) = 3pi/2.



close all
%z = linspace(-pi/2,2*pi,100);
%CosValues = cos(z);
z = linspace(-1,1,5);
CosValues= (1./(1+25*z.^2));
xi=inline('-1+(2*(x-1)/n)');
yi=inline('1/(1+25*(x^2))');
%numX=1; 
for d = [1 .5  .3  .1  .05 .001]
   figure
   xvals(i) = xi(d-1,i);
   yvals(i)=yi(xvals(i));
   c = InterpN(xvals,yvals);
   CubicValues = HornerN(c,xvals,z); 
   plot(z,CosValues,z,CubicValues,'--',xvals,yvals,'*')
   axis([-1 1 -1 2])
   title(sprintf('Interpolation of cos(x). Separation = %5.3f',d))
end



% for numPoint=2:5
%     n=2*numPoint;   %starting from 2 points
%     f=0; xValue=0; yValue=0;
%     for i=1:n
%         xVals(i)=xi(n-1,i);    %where n-1 is for xi(n) and i for xi(x)
%         yVals(i)=yi(xVals(i));
%     end
%     p=polyfit(xVals,yVals,n-1);
%     x=[-1:0.00001:1];
%     f=polyval(p,x);
%     plot(x,f,'k','linewidth',1)
%     %plot(x,f,'k','linewidth',1)
% end