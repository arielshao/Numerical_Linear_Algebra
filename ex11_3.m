%% Numerical Linear Algebra Exercise 11.3

m = 50;
n = 50;
t = linspace(0,1,m);
t = t(:);
A = fliplr(vander(t));
A = A(:,1:n);
b = cos(4*t);
At = transpose(A);

%% Part a (Solving Normal Equation)
ANS_a = (At*A)\(At*b);

%% Part b (Solving with modified G-S algortihm)
[Qm,Rm] = clgs(A);
% Reduced QR
Qm = Qm(:,1:n);
Rm = Rm(1:n,:);
ANS_b = Rm\(transpose(Qm)*b);

%% Part c (Solving with householder triangularization)

%% Part d (Matlab qr)
[Qmat,Rmat] = qr(A,0);
% Reduced QR
ANS_d = Rmat\(transpose(Qmat)*b);

%% Part e (Backslash in matlab)
ANS_e = A\b;

%% Part f (SVD in matlab)
[U,S,V] = svd(A,0);
ANS_f = (S*transpose(V))\(transpose(U)*b);

% View as a list
[ANS_a ANS_b ANS_d ANS_e ANS_f]
plot(ans)
