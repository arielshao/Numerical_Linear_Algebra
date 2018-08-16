%% Question 7 (i)
for n=[7 47 87];
    A=randn(n);
    b=ones(n,1);
    [x,flag,relres,iter,resvec]=gmres(A,b,[],1.e-6,size(A,1));
    flag
    relres
    iter
end
% Since flag==0 for all the cases tested above, this shows that the GMRES
% algorithm successfully converge to the solution of Ax=b when A is a dense
% matrix.

%% (ii)
A=sprandn(100,100,0.1);
b=ones(100,1);
[x,flag,relres,iter,resvec]=gmres(A,b,[],1.e-6,size(A,1));
flag
relres
iter
figure;
semilogy(resvec)
% Flag==0 in this case as well, so the GMRES algorithm converges for sparse
% matrix.

%% (iii)

A=sprandn(100,100,0.1)+2*eye(100,100);
b=ones(100,1);
[x,flag,relres,iter,resvec]=gmres(A,b,[],1.e-6,size(A,1));
flag
relres
iter
figure;
semilogy(resvec)

% The GMRES algorithm converges in this case as well but the algorithm
% takes less than 100 iterations to converge and the residual norm is of order of e-07.

%% (iv)
A=sprandn(100,100,0.1)+4*eye(100,100);
b=ones(100,1);
[x,flag,relres,iter,resvec]=gmres(A,b,[],1.e-6,size(A,1));
flag
relres
iter
figure;
semilogy(resvec)
%The GMRES algorithm converges in this case but the algorithm
% takes fewer iterations to converge and the residual norm is of order of e-07.

%% (v)
X=randn(9,9);
A=X*diag([1,1,-4,3,3,-4,-4,-4,3])/X;
b=ones(9,1);
[x,flag,relres,iter,resvec]=gmres(A,b,[],1.e-6,size(A,1));
flag
relres
iter
figure;
semilogy(resvec)
% The GMRES algorithm converges within only 3 iterations and the relative residual norm of order of
% e-15.

%% (iv) 

X=randn(10,10);
A=hess(X);
b=ones(10,1);
[x,flag,relres,iter,resvec]=gmres(A,b,[],1.e-6,size(A,1));
flag
relres
iter
figure;
semilogy(resvec)
% The GMRES algorithm converges for the 10*10 Hessenberg matrix.