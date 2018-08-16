%% Visualize SVD for 2x2 matrix by looking at how it maps disk to ellipse.

function visualize_svd(A)

% make sure A is 2-by-2
assert(isequal(size(A),[2,2]), 'A must be 2-by-2 !') 

[U,S,V] = svd(A) ;

% coordinates of ball
z = exp(1i*linspace(0,2*pi,50)) ;
c = real(z) ;
s = imag(z) ;

% coordinates of ellipse
Az = A*[c;s] ;
Ac = Az(1,:) ;
As = Az(2,:) ;

LW = 'LineWidth' ;
FS = 'FontSize' ;

% plots
figure(1) ; clf ;
subplot(1,2,1) ;
plot([0 V(1,1)], [0 V(2,1)], LW, 2) ; hold on,
plot([0 V(1,2)], [0 V(2,2)], LW, 2) ;
plot(c, s, LW, 1.5) ;
axis equal ; axis tight ; 
title('Ball') ; set(gca, FS, 20) ;
subplot(1,2,2) ;
plot([0 S(1,1)*U(1,1)], [0, S(1,1)*U(2,1)], LW, 2) ; hold on,
plot([0 S(2,2)*U(1,2)], [0, S(2,2)*U(2,2)], LW, 2) ;
plot(Ac, As, LW, 1.5) ;
title('Image of ball') ; 
leg = legend(['\sigma_1 = ', num2str(S(1,1))], ...
      ['\sigma_2 = ', num2str(S(2,2))]) ;
set(gca, FS, 20) ;
set(leg, 'Location', 'Best')
axis equal ; axis tight ;
set(gcf, 'Position', get(0, 'Screensize'));

end
