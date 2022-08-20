close all
clc
%%
% Question 1
%%
% part a)
n = 100000;
lambda = 1;
Exponential_Vector = Exponential_Distribution(n,lambda);
figure('units','normalized','outerposition',[0 0 1 1]);
histogram(Exponential_Vector,100);
title({'Exponential distribution empirical pdf';'number of bins = 100'})
%%
% part b)
n = 100000;
sigma = 1;
Rayleigh_Vector = Rayleigh_Distribution(n,sigma);
figure('units','normalized','outerposition',[0 0 1 1]);
histogram(Rayleigh_Vector,100);
title({'Rayleigh distribution empirical pdf';'number of bins = 100'})
%%
% Question 2
%%
load('data.mat');
Categories = unique(table2array(data(:,1)));
Energy_Attribute_Transpose = table2array(data(:,2));
Energy_Attribute_1 = transpose(Energy_Attribute_Transpose);
Energy_Attribute_2 = Energy_Attribute_1.*Energy_Attribute_1;
Energy_Attribute_3 = Energy_Attribute_1.*Energy_Attribute_2;
figure('units','normalized','outerposition',[0 0 1 1]);
histogram(Energy_Attribute_1,100);
title({'Energy_{kcal} attribution empirical pdf';'number of bins = 100'})
First_Order_Momemt = mean(Energy_Attribute_1);
second_Order_Momemt = mean(Energy_Attribute_2);
third_Order_Momemt = mean(Energy_Attribute_3);
First_Order_Centeral_Momemt = moment(Energy_Attribute_1,1);
second_Order_Centeral_Momemt = moment(Energy_Attribute_1,2);
third_Order_Centeral_Momemt = moment(Energy_Attribute_1,3);
Baked_Products_Rows = (data.FoodGroup == 'Baked Products');
Table_of_Baked_Products = data(Baked_Products_Rows,:);
First_Three_Attribute_of_Baked_Products = table2array(Table_of_Baked_Products(:,2:4));
Beef_Products_Rows = (data.FoodGroup == 'Beef Products');
Table_of_Beef_Products = data(Beef_Products_Rows,:);
First_Three_Attribute_of_Beef_Products = table2array(Table_of_Beef_Products(:,2:4));
Nut_and_Seed_Products_Rows = (data.FoodGroup == 'Nut and Seed Products');
Table_of_Nut_and_Seed_Products = data(Nut_and_Seed_Products_Rows,:);
First_Three_Attribute_of_Nut_and_Seed_Products = table2array(Table_of_Nut_and_Seed_Products(:,2:4));
Vegetables_and_Vegetable_Products_Rows = (data.FoodGroup == 'Vegetables and Vegetable Products');
Table_of_Vegetables_and_Vegetable_Products = data(Vegetables_and_Vegetable_Products_Rows,:);
First_Three_Attribute_of_Vegetables_and_Vegetable_Products = table2array(Table_of_Vegetables_and_Vegetable_Products(:,2:4));
figure('units','normalized','outerposition',[0 0 1 1]);
scatter3(First_Three_Attribute_of_Baked_Products(:,1),First_Three_Attribute_of_Baked_Products(:,2),First_Three_Attribute_of_Baked_Products(:,3),...
    5,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor',[0 0 0],'LineWidth',1)
hold on
scatter3(First_Three_Attribute_of_Beef_Products(:,1),First_Three_Attribute_of_Beef_Products(:,2),First_Three_Attribute_of_Beef_Products(:,3),...
    5,'MarkerEdgeColor',[0 0 0.5],'MarkerFaceColor',[0 0 0.5],'LineWidth',1)
hold on
scatter3(First_Three_Attribute_of_Nut_and_Seed_Products(:,1),First_Three_Attribute_of_Nut_and_Seed_Products(:,2),First_Three_Attribute_of_Nut_and_Seed_Products(:,3),...
    5,'MarkerEdgeColor',[0 0 1],'MarkerFaceColor',[0 0 1],'LineWidth',1)
hold on
scatter3(First_Three_Attribute_of_Vegetables_and_Vegetable_Products(:,1),First_Three_Attribute_of_Vegetables_and_Vegetable_Products(:,2),First_Three_Attribute_of_Vegetables_and_Vegetable_Products(:,3),...
    5,'MarkerEdgeColor',[0 0.5 1],'MarkerFaceColor',[0 0.5 1],'LineWidth',1)
hold off
title({'Energy_{kcal}, Protein_g and Fat_g';'of Baked Products, Beef Products, Nut and Seed Products and Vegetables and Vegetable Products'})
xlabel('Energy_{kcal}')
ylabel('Protein_g')
zlabel('Fat_g')
figure_legend = legend({'Baked Products', 'Beef Products', 'Nut and Seed Products', 'Vegetables and Vegetable Products'},'location','northeast');
title(figure_legend,'\bf Food Groop')
legend('boxoff')
%%
load('data.mat');
Data_Matrix = table2array(data(:,2:end));
for i = 1:size(Data_Matrix,2)
    Data_Matrix(:,i) = (Data_Matrix(:,i)-mean(Data_Matrix(:,i)))/sqrt(var(Data_Matrix(:,i)));
end
Correlation_Matrix = zeros(size(Data_Matrix,2),size(Data_Matrix,2));
for i = 1:size(Data_Matrix,2)
    for j = 1:size(Data_Matrix,2)
        Correlation_Matrix(i,j) = mean((Data_Matrix(:,i) - mean(Data_Matrix(:,i))).*(Data_Matrix(:,j) - mean(Data_Matrix(:,j))))/sqrt(var(Data_Matrix(:,i))*var(Data_Matrix(:,j)));
    end
end
for i = 1:size(Data_Matrix,2)-1
    for j = i+1:size(Data_Matrix,2)
        if(Correlation_Matrix(i,j) > 0.9)
            Data_Matrix(:,j) = 0;
        end
    end
end
counter = 0;
for i = 1:size(Data_Matrix,2)
    if(Data_Matrix(:,i-counter) == 0)
        Data_Matrix(:,i-counter) = [];
        counter = counter + 1;
    end
end
[coeff,score,latent,tsquared,explained,mu] = pca(Data_Matrix);
figure('units','normalized','outerposition',[0 0 1 1]);
plot(explained);
title('percentage of the total variance explained by each principal component')
xlabel('principal component number')
ylabel('percentage of the total variance')
Coeff_Abstract = abs(coeff);
Sorted_Coeff_Abstract = sort(Coeff_Abstract,1,'descend');
Score_Table = array2table(score);
Baked_Products_Rows = (data.FoodGroup == 'Baked Products');
PCA_of_Baked_Products_Table = Score_Table(Baked_Products_Rows,:);
PCA_of_Baked_Products_First_Three_Attribute = table2array(PCA_of_Baked_Products_Table(:,1:3));
Beef_Products_Rows = (data.FoodGroup == 'Beef Products');
PCA_of_Beef_Products_Table = Score_Table(Beef_Products_Rows,:);
PCA_of_Beef_Products_First_Three_Attribute = table2array(PCA_of_Beef_Products_Table(:,1:3));
Nut_and_Seed_Products_Rows = (data.FoodGroup == 'Nut and Seed Products');
PCA_of_Nut_and_Seed_Products_Table = Score_Table(Nut_and_Seed_Products_Rows,:);
PCA_of_Nut_and_Seed_Products_First_Three_Attribute = table2array(PCA_of_Nut_and_Seed_Products_Table(:,1:3));
Vegetables_and_Vegetable_Products_Rows = (data.FoodGroup == 'Vegetables and Vegetable Products');
PCA_of_Vegetables_and_Vegetable_Products_Table = Score_Table(Vegetables_and_Vegetable_Products_Rows,:);
PCA_of_Vegetables_and_Vegetable_Products_First_Three_Attribute = table2array(PCA_of_Vegetables_and_Vegetable_Products_Table(:,2:4));
figure('units','normalized','outerposition',[0 0 1 1]);
scatter3(PCA_of_Baked_Products_First_Three_Attribute(:,1),PCA_of_Baked_Products_First_Three_Attribute(:,2),PCA_of_Baked_Products_First_Three_Attribute(:,3),...
    5,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor',[0 0 0],'LineWidth',1)
hold on
scatter3(PCA_of_Beef_Products_First_Three_Attribute(:,1),PCA_of_Beef_Products_First_Three_Attribute(:,2),PCA_of_Beef_Products_First_Three_Attribute(:,3),...
    5,'MarkerEdgeColor',[0 0 0.5],'MarkerFaceColor',[0 0 0.5],'LineWidth',1)
hold on
scatter3(PCA_of_Nut_and_Seed_Products_First_Three_Attribute(:,1),PCA_of_Nut_and_Seed_Products_First_Three_Attribute(:,2),PCA_of_Nut_and_Seed_Products_First_Three_Attribute(:,3),...
    5,'MarkerEdgeColor',[0 0 1],'MarkerFaceColor',[0 0 1],'LineWidth',1)
hold on
scatter3(PCA_of_Vegetables_and_Vegetable_Products_First_Three_Attribute(:,1),PCA_of_Vegetables_and_Vegetable_Products_First_Three_Attribute(:,2),PCA_of_Vegetables_and_Vegetable_Products_First_Three_Attribute(:,3),...
    5,'MarkerEdgeColor',[0 0.5 1],'MarkerFaceColor',[0 0.5 1],'LineWidth',1)
hold off
axis([-5 5 -5 5 -5 5])
title({'First, Second and third PC';'of Baked Products, Beef Products, Nut and Seed Products and Vegetables and Vegetable Products PCA'})
xlabel('First PC')
ylabel('Second PC')
zlabel('Third PC')
figure_legend = legend({'Baked Products', 'Beef Products', 'Nut and Seed Products', 'Vegetables and Vegetable Products'},'location','northeast');
title(figure_legend,'\bf Food Groop')
legend('boxoff')
%%
% Question 1 functions
%%
% part a)
function Exponential_Vector = Exponential_Distribution(n,lambda)
%     syms x lambda fX FX
%     fX(x,lambda) = lambda*exp(-lambda*x);
%     FX(x,lambda) = int(fX,x,[0 x]);
%     FX_1(x,lambda) = finverse(FX,x);
    Exponential_Vector = rand(n,1);
    Exponential_Vector = -log(1-Exponential_Vector)./lambda;
end
%%
% part b)
function Rayleigh_Vector = Rayleigh_Distribution(n,sigma)
%     syms y sigma fY FY
%     fY(y,sigma) = (y/sigma^2)*exp(-y^2/(2*sigma^2));
%     FY(y,sigma) = int(fY,y,[0 y]);
%     FY_1(y,sigma) = finverse(FY,y);
    Rayleigh_Vector = rand(n,1);
    Rayleigh_Vector = 2.^(1/2).*sigma.*(-log(1-Rayleigh_Vector)).^(1/2);
end