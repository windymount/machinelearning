X = load("outdata1.txt");
n = size(X);
m = floor(2*n(1)/3);
y = X(1:m,1);
x = X(1:m,2:n(2));
testx=X(m+1:n(1),2:n(2));
testy=X(m+1:n(1),1);
f = svmsoftmargin(x,y,0.5,@(x,y)exp(-0.5*norm(x-y)));
c =  n(1)-m;
s = 0;
for i =1:c
    if f(testx(i,:)')==testy(i)
        s = s+1;
    end
end
crate = s/c;