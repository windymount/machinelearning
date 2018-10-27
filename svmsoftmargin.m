function f=svmsoftmargin(x,y,c,ker)
n = size(x);
if nargin == 3
    ker = @(a,b)a'*b;
end
A = zeros(n(1));
for i = 1:n
    for j = 1:n
        A(i,j)=y(i)*y(j)*ker(x(i,:)',x(j,:)');
    end
end

cvx_begin
    variable a(n(1))
    minimize (-(ones(n(1),1)'*a)+0.5*(a'*A*a))
    subject to
        a'*y==0;
        0<=a<=c;
cvx_end

if nargin == 3
    theta = sum(a.*y.*x);
    [m,i]=min(abs(a-c/2));
    b = y(i)-theta*x(i,:)';
    theta = theta';
    f = @(x)sign(theta'*x+b);
end

if nargin == 4
    
    [m,i]=min(abs(a-c/2));
    b = y(i)-thetax(x(i,:)',n,x,y,a,ker);
    f = @(h)sign(thetax(h,n,x,y,a,ker)+b);
end
end
function r = thetax(m,n,x,y,a,ker)
    r = 0;
    for i = 1:n(1)
        r = r+a(i)*y(i)*ker(x(i,:)',m);
    end
end
    
    
    
    
