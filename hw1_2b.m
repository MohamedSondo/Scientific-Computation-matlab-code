%%Mohamed Sondo Script for hw problem 2b
%%cancellation, covering all case downto 0.
h=10.^(-20:0);
x=1.2;
%derivation
f1=(sin(x+h)-sin(x)) ./h;
% suggested formula to avoid cancelation evaluated at 1.2
f2=2. * cos(x+h*0.5).* sin(h*0.5)./h;
ex=cos(x);
%plot
loglog(h,abs(f1-ex),'r',h,abs(f2-ex),'b',h,h,'k--');
title('Error approximation of f''(1.2)');
legend('f1','f2','o(h)');
xlabel('h');
ylabel('f''(xo-fi(xoh)');
grid on