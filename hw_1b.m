%% Mohamed Sondo hw1_b
%% here begin f1 and g1 computation
f1 = @(x,delta) cos(x + delta)-cos(x);
disp('f1')
disp(f1(3,1.*10^(-11)))
y1=f1(3,1.*10^(-11));
g1 = @(x,delta) (y1/delta)+sin(x);
g1(3,1.*10^(-11));

%% here begin f2 and g2 computation
f2=@(x,delta) -2*sin((2*x + delta)/2)*sin(delta/2);
disp('f2')
%disp('both f1 and f2 are same value numericaly')
disp(f2(3,1.*10^(-11)))
disp('both f1 and f2 are same the value numericaly')
fprintf('\n')
y2=f2(3,1.*10^(-11));
g2= @(x,delta)(y2/delta)+sin(x);
disp('answer for g1 using f1 is:')
ans1=g1(3,1.*10^(-11));
disp(ans1)
disp('awswer for g2 using  f2 is:')
ans2=g2(3,1.*10^(-11));
disp(ans2)

