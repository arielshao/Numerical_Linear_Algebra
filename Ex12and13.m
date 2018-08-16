%% Exercise 12.2
A_infnorm=[];
for n=1:30;
   [A, A_inf]=A_and_infnorm(n);
   A_infnorm=[ A_infnorm A_inf];
end
nn=1:30;
figure(1);clf
plot(nn,A_infnorm);
hold on;
lebesgue_f=2.^nn./(exp(1)*(nn-1).*log(nn))
semilogy(nn,lebesgue_f);
legend('A_{infnorm}', 'lebesgue constant')

%% Ex 12.3 (a) code adapted from cs.dartmouth homework solution
spec_mean=zeros(4,1);
for j=3:6
    figure;clf;
    spec=zeros(100,1);
    m=2.^j;
    eigs = zeros(100,m);
    for i=1:100
      A = randn(m,m)/sqrt(m);
      A=triu(A);
       eigs(i,:)=eig(A)'; 
        plot([1:m],abs(eigs(i,:)),'.'); 
        spec(i) = max(abs(eigs(i,:))); 
        hold on;
    end
spec_mean(j-2) = mean(spec);
end
figure;
plot(2.^[3:6],spec_mean,'r-');

%% Ex 12.3 (b)
spectral=[];
norm2 =[];
figure;clf;
for j=2:10
    m=2.^j;
     A = randn(m,m)/sqrt(m);
%         A=triu(A);
    spec=max(abs(eig(A)));
    spectral=[spectral spec];
    normnew=norm(A);
    norm2=[norm2 normnew];
end
plot([2.^(2:10)], spectral, 'r-');
hold on;
plot ([2.^(2:10)], norm2, '.-');
legend('spectral radius', '2-norm')
diff=[norm2-spectral]'

%% Ex 12.3 (c)
svds=[];
for j=2:10
    m=2.^j
    A = randn(m,m)/sqrt(m);
%     A=triu(A);
    singval=min(svd(A)); 
    svds=[svds singval]
end
figure;clf
plot([2.^(2:10)],svds, 'r')
xlabel('m','FontSize', 30)
ylabel('$\sigma_{min}$','Interpreter','latex','FontSize', 30)




%%
j=1:10;
prop=[];
for m=2.^j;
svds=zeros(100,1);
for i=1:100;
    A = randn(m,m)/sqrt(m);
%     A=triu(A);
    svds(i)=min(svd(A));
end
propnew=length(find(svds< 1/m))/100;
prop=[prop propnew];
end
figure; clf;
plot(2.^(1:10), prop, 'b')
xlabel('m','FontSize', 20)
ylabel('proportion of matrices such that $\sigma_{min}<1/m$','Interpreter','latex','FontSize', 20)
%% Exercise 13.2
t = 53;
n = 2^t + (-2:2)
diff(n)

%% Exercise 13.3
x = (1.920:.001:2.080)';
p1 = (x-2).^9;
p2 = x.^9 - 18*x.^8 + 144*x.^7 - 672*x.^6 + 2016*x.^5 - 4032*x.^4 + 5376*x.^3 - 4608*x.^2 + 2304*x - 512;

figure(2);clf;
plot(x,[p1 p2]);
xlabel('x'); ylabel('p(x)');
legend('(x-2)^9', 'x^9 - 18 x^8 + 144 x^7 + ... - 512')


%% Exercise 13.4

syms p(x)
p(x) = x^5-2*x^4-3*x^3+3*x^2-2*x-1;
dp = diff(p,x);

x=zeros(7,1);
for i=1:6;
    x(i+1)=x(i)-p(x(i))/dp(x(i));
end
x
    

