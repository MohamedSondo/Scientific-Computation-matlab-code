  function root = Bisection(fname,a,b,delta)
% root = Bisection(fname,a,b,delta)
% Method of bisection.
%
% fname is a string that names a continuous function  f(x) of a single variable.
% a and b define an interval [a,b] and f(a)f(b) < 0
% delta   non-negative real.
%
% root is the midpoint of an interval [alpha,beta]
% with the property that f(alpha)f(beta)<=0 and
%            |
%             |beta-alpha| <= delta+eps*max(|alpha|,|beta|)

fa = feval(fname,a); 
fb = feval(fname,b);
if fa*fb > 0
   disp('Initial interval is not bracketing.')
   return
end
if nargin==3
   delta = 0;
end
while abs(a-b) > delta+eps*max(abs(a),abs(b))
   mid = (a+b)/2;
   fmid = feval(fname,mid);    
   if fa*fmid<=0
      % There is a root in [a,mid].
      b  = mid; 
      fb = fmid;
   else
      % There is a root in [mid,b].
      a  = mid; 
      fa = fmid;
   end  
end
root = (a+b)/2;