function [A,A_inf] = A_and_infnorm(n)
% This function generate the m-by-n matrix A which maps an n-vector data at
% {x_j} ti an m-vector of sampled values {p(y_j)} where p is the degree n-1
% polynomial interpolant of the data.

% Note that {x_j} and {y_j} are equispaced points from [-1, 1]
m=2*n-1;
x=linspace(-1,1,n)';
y=linspace(-1,1,m)';
Ay=zeros(m,n);
Ax=zeros(n,n);

for i=1:n;
    Ay(:,i)=y.^(i-1);
    Ax(:,i)=x.^(i-1);
end
A=Ay*Ax^(-1);
A_inf=norm(A,inf);
end
