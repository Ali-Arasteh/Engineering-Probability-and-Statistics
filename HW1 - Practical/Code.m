close all
clc
%%
% question 1 
%%
% 1)
n = 100;
p = 0.4;
q = 1 - p;
numberOfErrors = 1:n;
probabilityOfError = zeros(1,n);
for i = 1:n
    probabilityOfError(i) = nchoosek(n,i)*power(p,i)*power(q,n-i);
end
figure();
stem(numberOfErrors,probabilityOfError);
title('Probability of k error in n bit');
xlabel('Number of Errors');
ylabel('Probability');
%%
% 2)
%%
% 3)
numberOfTrial = 10000;
n = 100;
p = 0.4;
q = 1 - p;
r = 1;
c = n;
numberOfError = zeros(1,numberOfTrial);
for k = 1:numberOfTrial
    sentData = zeros(r,c);
    for i = 1:r
        for j = 1:c
            randomNumber = rand();
            if (randomNumber <= 0.5)
                sentData(i,j) = 0;
            else
                sentData(i,j) = 1;
            end
        end
    end
    receivdData = sendSimulator(sentData,p);
    sentData
    receivdData
    counter = 0;
    for i = 1:r
        for j = 1:c
            randomNumber = rand();
            if (sentData(i,j) ~= receivdData(i,j))
                counter = counter + 1;
            end
        end
    end
    numberOfError(k) = counter;
end
figure();
histogram(numberOfError,'Normalization','probability');
title('Histogram plot');
xlabel('Number of Errors');
ylabel('Probability');
%%
% 4)
%%
% 5)
figure();
subplot(3,1,1);
syms x y
n = 100;
p = 0.4;
q = 1 - p;
np = n * p;
npq = n * p * q;
y = (1 / sqrt(2 * pi * npq)) * exp(-((x-np)^2/(2 * npq)));
fplot(y,[0 100]);
title('Gaussian plot');
xlabel('Number of Errors');
ylabel('Probability');
subplot(3,1,2);
numberOfTrial = 100000;
n = 100;
r = 1;
c = n;
numberOfError = zeros(1,numberOfTrial);
for k = 1:numberOfTrial
    sentData = zeros(r,c);
    for i = 1:r
        for j = 1:c
            randomNumber = rand();
            if (randomNumber <= 0.5)
                sentData(i,j) = 0;
            else
                sentData(i,j) = 1;
            end
        end
    end
    receivdData = sendSimulator(sentData,p);
    counter = 0;
    for i = 1:r
        for j = 1:c
            randomNumber = rand();
            if (sentData(i,j) ~= receivdData(i,j))
                counter = counter + 1;
            end
        end
    end
    numberOfError(k) = counter;
end
histogram(numberOfError,'Normalization','probability');
title('Histogram plot');
xlabel('Number of Errors');
ylabel('Probability');
subplot(3,1,3);
numberOfErrors = 1:n;
probabilityOfError = zeros(1,n);
for i = 1:n
    probabilityOfError(i) = nchoosek(n,i)*power(p,i)*power(q,n-i);
end
stem(numberOfErrors,probabilityOfError);
title('Probability of k error in n bit');
xlabel('Number of Errors');
ylabel('Probability');
%%
% 6)
figure();
subplot(3,1,1);
syms x y
n = 100;
p = 0.01;
q = 1 - p;
np = n * p;
npq = n * p * q;
y = (1 / sqrt(2 * pi * npq)) * exp(-((x-np)^2/(2 * npq)));
fplot(y,[0 10]);
title('Gaussian plot');
xlabel('Number of Errors');
ylabel('Probability');
subplot(3,1,2);
numberOfTrial = 100000;
n = 100;
r = 1;
c = n;
numberOfError = zeros(1,numberOfTrial);
for k = 1:numberOfTrial
    sentData = zeros(r,c);
    for i = 1:r
        for j = 1:c
            randomNumber = rand();
            if (randomNumber <= 0.5)
                sentData(i,j) = 0;
            else
                sentData(i,j) = 1;
            end
        end
    end
    receivdData = sendSimulator(sentData,p);
    counter = 0;
    for i = 1:r
        for j = 1:c
            randomNumber = rand();
            if (sentData(i,j) ~= receivdData(i,j))
                counter = counter + 1;
            end
        end
    end
    numberOfError(k) = counter;
end
histogram(numberOfError,'Normalization','probability');
title('Histogram plot');
xlabel('Number of Errors');
ylabel('Probability');
subplot(3,1,3);
numberOfErrors = 0:n;
probabilityOfError = zeros(1,n + 1);
for i = 0:n
    probabilityOfError(i + 1) = nchoosek(n,i)*power(p,i)*power(q,n-i);
end
stem(numberOfErrors(1,1:11),probabilityOfError(1,1:11));
title('Probability of k error in n bit');
xlabel('Number of Errors');
ylabel('Probability');
%%
% 7)
figure();
subplot(3,1,1);
n = 100;
p = 0.01;
q = 1 - p;
np = n * p;
x = 0:10;
y = zeros(1,10);
for i = 0:10
y(i + 1) = (exp(-np) * (np)^x(i + 1)) / factorial(x(i + 1));
end
plot(x,y);
title('Poisson plot');
xlabel('Number of Errors');
ylabel('Probability');
subplot(3,1,2);
numberOfTrial = 100000;
n = 100;
r = 1;
c = n;
numberOfError = zeros(1,numberOfTrial);
for k = 1:numberOfTrial
    sentData = zeros(r,c);
    for i = 1:r
        for j = 1:c
            randomNumber = rand();
            if (randomNumber <= 0.5)
                sentData(i,j) = 0;
            else
                sentData(i,j) = 1;
            end
        end
    end
    receivdData = sendSimulator(sentData,p);
    counter = 0;
    for i = 1:r
        for j = 1:c
            randomNumber = rand();
            if (sentData(i,j) ~= receivdData(i,j))
                counter = counter + 1;
            end
        end
    end
    numberOfError(k) = counter;
end
histogram(numberOfError,'Normalization','probability');
title('Histogram plot');
xlabel('Number of Errors');
ylabel('Probability');
subplot(3,1,3);
numberOfErrors = 0:n;
probabilityOfError = zeros(1,n + 1);
for i = 0:n
    probabilityOfError(i + 1) = nchoosek(n,i)*power(p,i)*power(q,n-i);
end
stem(numberOfErrors(1,1:11),probabilityOfError(1,1:11));
title('Probability of k error in n bit');
xlabel('Number of Errors');
ylabel('Probability');
%%
% question 2: approximation of pi number 
%%
% 1)
%%
% 2)
numberOfRandomNumbers = 10000;
x = 2*rand(1,numberOfRandomNumbers) - 1;
y = 2*rand(1,numberOfRandomNumbers) - 1;
counter = 0;
for i = 1:numberOfRandomNumbers
    if((x(i)^2 + y(i)^2) < 1)
       counter = counter + 1; 
    end
end
probability = counter / numberOfRandomNumbers
cir = (x.^2 + y.^2) <= 1;
figure();
scatter(x,y,1,'MarkerEdgeColor',[0 0.5 0.75],'MarkerFaceColor',[0 0.5 1],'LineWidth',1);
hold on
scatter(x(cir),y(cir),1,'MarkerEdgeColor',[0 0 0.25],'MarkerFaceColor',[0 0 0.5],'LineWidth',1);
title('Scatter plot');
%%
% question 2: approximation of pi number 
%%
% 1)
%%
% 2)
numberOfRandomNumbers = 10000;
x = 2*rand(1,numberOfRandomNumbers) - 1;
y = 2*rand(1,numberOfRandomNumbers) - 1;
counter = 0;
for i = 1:numberOfRandomNumbers
    if((x(i)^2 + y(i)^2) < 1)
       counter = counter + 1; 
    end
end
probability = counter / numberOfRandomNumbers;
cir = (x.^2 + y.^2) <= 1;
figure();
scatter(x,y,1,'MarkerEdgeColor',[0 0.5 0.75],'MarkerFaceColor',[0 0.5 1],'LineWidth',1);
hold on
scatter(x(cir),y(cir),1,'MarkerEdgeColor',[0 0 0.25],'MarkerFaceColor',[0 0 0.5],'LineWidth',1);
title('Scatter plot');
%%
% 3)
%%
% question 2: approximation of neper number 
%%
% 1)
%%
% 2)
numberOfTrials = 1000;
numberOfLetters = 100000;
x = 1:numberOfLetters;
numberOfTrialsWithZeroCorrect = 0;
for k = 1:numberOfTrials
    y = randperm(numberOfLetters);
    counter = 0;
    for i = 1:numberOfLetters
        if (x(i) == y(i))
            counter = counter + 1;
        end
    end    
    if (counter == 0)
        numberOfTrialsWithZeroCorrect = numberOfTrialsWithZeroCorrect + 1;
    end
end
atLeastOneCorrectProbability = 1 - (numberOfTrialsWithZeroCorrect/numberOfTrials);
%%
% 3)
%%
% functions
function [receivdData] = sendSimulator(sentData,p)
    q = 1 - p;
    [r,c] = size(sentData);
    receivdData = zeros(r,c);
    for i = 1:r
        for j = 1:c
            randomNumber = rand();
            if (randomNumber <= p)
                if (sentData(i,j) == 0)
                    receivdData(i,j) = 1;
                elseif (sentData(i,j) == 1)
                    receivdData(i,j) = 0;
                end
            else
                receivdData(i,j) = sentData(i,j);
            end
        end
    end
end