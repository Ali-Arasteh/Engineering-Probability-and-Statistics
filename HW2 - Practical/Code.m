close all
clc
%%
% Question 1 
%%
% 1)
X = normrnd(0,1,[1,100000]);
Y = exprnd(0.05,[1,100000]);
%%
% 2)
figure('units','normalized','outerposition',[0 0 1 1]);
subplot(2,3,1);
Histogram(X,100);
title('X empirical pdf, number of bins = 100')
subplot(2,3,2);
Histogram(X,1000);
title('X empirical pdf, number of bins = 1000')
subplot(2,3,3);
Histogram(X,10000);
title('X empirical pdf, number of bins = 10000')
subplot(2,3,4);
Histogram(Y,100);
title('Y empirical pdf, number of bins = 100')
subplot(2,3,5);
Histogram(Y,1000);
title('Y empirical pdf, number of bins = 1000')
subplot(2,3,6);
Histogram(Y,10000);
title('Y empirical pdf, number of bins = 10000')

%%
% 3)
figure('units','normalized','outerposition',[0 0 1 1]);
Z = X.^2;
Histogram(Z,1000);
title('Z = X^2 empirical pdf, number of bins = 1000')
%%
% 4)
figure('units','normalized','outerposition',[0 0 1 1]);
T = sqrt(Y);
Histogram(T,1000);
title('Y = sqrt(Y) empirical pdf, number of bins = 1000')
%%
% 5)
load('samples.mat');
figure('units','normalized','outerposition',[0 0 1 1]);
Histogram(samples,1000);
title('samples empirical pdf, number of bins = 1000')
%%
% 6)
load('samples.mat');
Tsamples = samples.';
parameters = fitdist(Tsamples,'Normal');
%%
% 7)
load('samples.mat');
load('parameters.mat');
syms x
probabilitydensityfunction = pdf(parameters,x);
figure('units','normalized','outerposition',[0 0 1 1]);
fplot(probabilitydensityfunction);
title('samples probability density function')
%%
% 8)
load('samples.mat');
load('parameters.mat');
syms x
cumulativedistributionfunction = cdf(parameters,x);
figure('units','normalized','outerposition',[0 0 1 1]);
fplot(cumulativedistributionfunction);
title('samples cumulative distribution function')
%%
% Question 2
%%
n = 30;
N = 1000;
xt = zeros(1,n^2);
for i = 1:N
    ispermeable = 0;
    A = zeros(n);
    while(ispermeable ~= 1)
        a = rand();
        index = ceil((n^2)*a);
        A(index) = 1;
        ispermeable = permeability(A,n);
    end
    counter = 0;
    for j = 1:n^2
        if(A(j) == 1)
            counter = counter+1;
        end
    end
    xt(i) = counter/n^2;
end
sum = 0;
for i = 1:N
    sum = sum + xt(i);
end
average = sum/N;
sum = 0;
for i = 1:N
    sum = sum + (xt(i)-average)^2;
end
variance = sum/(N-1);
errorpercent = sqrt(variance)/sqrt(N)*100;
figure('units','normalized','outerposition',[0 0 1 1]);
h = histogram(xt,n);
title('histogram of xt')
%%
n = 30;
ispermeable = 0;
A = zeros(n);
figure('units','normalized','outerposition',[0 0 1 1]);
while(ispermeable ~= 1)
    a = rand();
    index = ceil((n^2)*a);
    A(index) = 1;
    imagesc(A);
    drawnow
    ispermeable = permeability(A,n);
end
%%
% Question 1 functions 
function Output = Histogram(X,bin)
    Output = zeros(1,bin);
    Maximum = max(X);
    Minimum = min(X);
    Length = Maximum-Minimum;
    Delta = Length./bin;
    for i = 1:length(X)
        if(X(i)==Minimum)
            Index = 1;
        else
            Index = ceil((X(i)-Minimum)./Delta);
            Output(Index) = Output(Index)+1;
        end
    end
    Middle = Minimum+(Delta./2):Delta:(Maximum-(Delta./2));
    stem(Middle,Output,'.-');
end
%%
% Question 2 functions 
function m = permeability(A,n)
    x = A(1,:);
    for i = 2:n
        x = x.*A(i,:);
        for j = 1:n
            if(x(1) == 1)
                if(A(i,2) == 1)
                    x(2) = 1;
                end
            end
            for k = 2:n-1
                if(x(k) == 1)
                    if(A(i,k-1) == 1)
                        x(k-1) = 1;
                    end
                    if(A(i,k+1) == 1)
                        x(k+1) = 1;
                    end
                end
            end
            if(x(n) == 1)
                if(A(i,n-1) == 1)
                    x(n-1) = 1;
                end
            end
        end
    end
    for i = 1:n
        if(x(i) == 1)
            m = 1;
            break;
        end
        m = 0;
    end
end