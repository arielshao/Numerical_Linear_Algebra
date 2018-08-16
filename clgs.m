%% Classical Gram-Schmidt algorithm for computing QR decomposition

function [Q,R] = clgs(A)

[m,n] = size(A) ;
Q = A ;
R = zeros(m,n) ;

V = A ;
for j = 1:n
    for i = 1:j-1
        R(i,j) = Q(:,i)'*A(:,j) ;
        V(:,j) = V(:,j) - R(i,j)*Q(:,i) ;
    end
    R(j,j) = norm(V(:,j),2) ;
    Q(:,j) = V(:,j)/R(j,j) ;     
end