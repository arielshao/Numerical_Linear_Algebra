%% Demonstrate loss of orthogonality using classical and modified Gram-Schmidt algorithm

% Get 12 terms of Fibonacci sequence.
n = fibonacci(3:14) ;

% Compute QR factorization of 30 random square matrices of dimension of n(i),
% for i = 1,...,12, using classical and modified G-S algorithm,
% respectively.
norms1 = zeros(30,12) ;
norms2 = zeros(30,12) ;
for i = 1:12
    for j = 1:30
        A = rand(n(i)) ;
        [QC,RC] = clgs(A) ;
        [QM,RM] = mgs(A) ;
        norms1(j,i) = norm(QC'*QC - eye(n(i)), 'inf') ;
        norms2(j,i) = norm(QM'*QM - eye(n(i)), 'inf') ;
    end
end

% Show orthogonality error scales like :
% (a) O(n^3) for classical G-S ;
% (b) O(n^2) for modified G-S.
figure(1) ; clf ;
subplot(1,2,1) ;
loglog(n, norms1', 'k.', n, n.^3/n(12)^3*mean(norms1(:,12)), 'r--') ;
title('Classical G-S') ;  
xlabel('dimension') ; ylabel('$|| Q^*Q - I ||_{\infty}$', 'Interpreter', 'latex') ;
set(gca, 'FontSize', 20) ;
subplot(1,2,2) ;
loglog(n, norms2', 'k.', n, n.^2/n(12)^2*mean(norms2(:,12)), 'r--') ;
title('Modified G-S') ;  
xlabel('dimension') ; ylabel('$|| Q^*Q - I ||_{\infty}$', 'Interpreter', 'latex') ;
set(gca, 'FontSize', 20) ;