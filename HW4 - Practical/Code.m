close all
clc
%%
% Question 1
%%
% 1)
data = readtable('California_birth_1.xls');
weeks_table = data(:,4);
weeks_array = table2array(weeks_table);
weeks_mean = mean(weeks_array);
weeks_median = median(weeks_array);
weeks_variance = var(weeks_array);
weeks_min = min(weeks_array);
weeks_max = max(weeks_array);
tgrams_table = data(:,12);
tgrams_array = table2array(tgrams_table);
tgrams_mean = mean(tgrams_array);
tgrams_median = median(tgrams_array);
tgrams_variance = var(tgrams_array);
tgrams_min = min(tgrams_array);
tgrams_max = max(tgrams_array);
%%
% 2)
%%
% 3_a)
% H0 : average = 25 , H1 : average > 25;
data = readtable('California_birth_1.xls');
mage_table = data(:,3);
mage_array = table2array(mage_table);
n = length(mage_array);
sum = 0;
for i = 1:n
    sum = sum + mage_array(i,1);
end
mage_average = sum / n;
sum = 0;
for i = 1:n
    sum = sum + (mage_array(i,1) - mage_average) ^ 2;
end
mage_s = sqrt(sum / (n - 1));
mage_T = (mage_average - 25) / (mage_s / sqrt(n));
alfa = 0.05;
mage_critical_section = tinv(1 - alfa,n - 1);
mage_p_value = 1 - tcdf(mage_T,n - 1);
%%
% 3_b)
% H0 : average = 39 , H1 : average < 39;
data = readtable('California_birth_1.xls');
weeks_table = data(:,4);
weeks_array = table2array(weeks_table);
n = length(mage_array);
sum = 0;
for i = 1:n
    sum = sum + weeks_array(i,1);
end
weeks_average = sum / n;
sum = 0;
for i = 1:n
    sum = sum + (weeks_array(i,1) - weeks_average) ^ 2;
end
weeks_s = sqrt(sum / (n - 1));
weeks_T = (weeks_average - 39) / (weeks_s / sqrt(n));
alfa = 0.05;
weeks_critical_section = tinv(alfa,n - 1);
weeks_p_value = tcdf(weeks_T,n - 1);
%%
% 4)
data = readtable('California_birth_1.xls');
smoker_rows = (data.SMOKE == 1);
smoker_table = data(smoker_rows,12);
smoker_array = table2array(smoker_table);
smoker_n = length(smoker_array);
sum = 0;
for i = 1:smoker_n
    sum = sum + smoker_array(i,1);
end
smoker_average = sum / smoker_n;
sum = 0;
for i = 1:smoker_n
    sum = sum + (smoker_array(i,1) - smoker_average) ^ 2;
end
smoker_s = sqrt(sum / (smoker_n - 1));
non_smoker_rows = (data.SMOKE == 0);
non_smoker_table = data(non_smoker_rows,12);
non_smoker_array = table2array(non_smoker_table);
non_smoker_n = length(non_smoker_array);
sum = 0;
for i = 1:non_smoker_n
    sum = sum + non_smoker_array(i,1);
end
non_smoker_average = sum / non_smoker_n;
sum = 0;
for i = 1:non_smoker_n
    sum = sum + (non_smoker_array(i,1) - non_smoker_average) ^ 2;
end
non_smoker_s = sqrt(sum / (non_smoker_n - 1));
figure('units','normalized','outerposition',[0 0 1 1]);
histogram(smoker_array,[100:400:2100 2100:300:3000 3000:200:4000 4000:500:5000]);
hold on
histogram(non_smoker_array,[100:400:2100 2100:300:3000 3000:200:4000 4000:500:5000]);
title('smoker and non smoker tgrams');
legend('smoker','non smoker');
smoke_T = (smoker_average - non_smoker_average) / (sqrt(((smoker_n - 1) * smoker_s ^ 2 + (non_smoker_n - 1) * non_smoker_s ^ 2) / (smoker_n + non_smoker_n - 2)) * sqrt((1 / smoker_n) + (1 / non_smoker_n)));
alfa = 0.05;
smoke_critical_section = tinv(alfa,smoker_n + non_smoker_n - 2);
smoke_p_value = tcdf(smoke_T,smoker_n + non_smoker_n - 2);
%%
% Question 2
%%
% 1)
load('nursery.mat');
n = 12960;
m = 9;
train = 10000;
test = n - train;
parents_table = nursery(:,1);
parents_array = table2array(parents_table);
parents_unique_table = unique(parents_table);
parents_unique_array = table2array(parents_unique_table);
has_nurs_table = nursery(:,2);
has_nurs_array = table2array(has_nurs_table);
has_nurs_unique_table = unique(has_nurs_table);
has_nurs_unique_array = table2array(has_nurs_unique_table);
form_table = nursery(:,3);
form_array = table2array(form_table);
form_unique_table = unique(form_table);
form_unique_array = table2array(form_unique_table);
childern_table = nursery(:,4);
childern_array = table2array(childern_table);
for i = 1:n
   if((childern_array(i) ~= 1) && (childern_array(i) ~= 2) && (childern_array(i) ~= 3))
       childern_array(i) = 4;
   end
end
childern_table = array2table(childern_array);
childern_unique_table = unique(childern_table);
childern_unique_array = table2array(childern_unique_table);
housing_table = nursery(:,5);
housing_array = table2array(housing_table);
housing_unique_table = unique(housing_table);
housing_unique_array = table2array(housing_unique_table);
finance_table = nursery(:,6);
finance_array = table2array(finance_table);
finance_unique_table = unique(finance_table);
finance_unique_array = table2array(finance_unique_table);
social_table = nursery(:,7);
social_array = table2array(social_table);
social_unique_table = unique(social_table);
social_unique_array = table2array(social_unique_table);
health_table = nursery(:,8);
health_array = table2array(health_table);
health_unique_table = unique(health_table);
health_unique_array = table2array(health_unique_table);
class_table = nursery(:,9);
class_array = table2array(class_table);
class_unique_table = unique(class_table);
class_unique_array = table2array(class_unique_table);
parents_numeric_array = zeros(n,1);
for j = 1:length(parents_unique_array)
    selected_rows = (parents_array == parents_unique_array(j));
    parents_numeric_array(selected_rows) = j;
end
has_nurs_numeric_array = zeros(n,1);
for j = 1:length(has_nurs_unique_array)
    selected_rows = (has_nurs_array == has_nurs_unique_array(j));
    has_nurs_numeric_array(selected_rows) = j;
end
form_numeric_array = zeros(n,1);
for j = 1:length(form_unique_array)
    selected_rows = (form_array == form_unique_array(j));
    form_numeric_array(selected_rows) = j;
end
childern_numeric_array = zeros(n,1);
for j = 1:length(childern_unique_array)
    selected_rows = (childern_array == childern_unique_array(j));
    childern_numeric_array(selected_rows) = j;
end
housing_numeric_array = zeros(n,1);
for j = 1:length(housing_unique_array)
    selected_rows = (housing_array == housing_unique_array(j));
    housing_numeric_array(selected_rows) = j;
end
finance_numeric_array = zeros(n,1);
for j = 1:length(finance_unique_array)
    selected_rows = (finance_array == finance_unique_array(j));
    finance_numeric_array(selected_rows) = j;
end
social_numeric_array = zeros(n,1);
for j = 1:length(social_unique_array)
    selected_rows = (social_array == social_unique_array(j));
    social_numeric_array(selected_rows) = j;
end
health_numeric_array = zeros(n,1);
for j = 1:length(health_unique_array)
    selected_rows = (health_array == health_unique_array(j));
    health_numeric_array(selected_rows) = j;
end
class_numeric_array = zeros(n,1);
for j = 1:length(class_unique_array)
    selected_rows = (class_array == class_unique_array(j));
    class_numeric_array(selected_rows) = j;
end
data_numeric_array = zeros(n,m);
data_numeric_array(:,1) = parents_numeric_array;
data_numeric_array(:,2) = has_nurs_numeric_array;
data_numeric_array(:,3) = form_numeric_array;
data_numeric_array(:,4) = childern_numeric_array;
data_numeric_array(:,5) = housing_numeric_array;
data_numeric_array(:,6) = finance_numeric_array;
data_numeric_array(:,7) = social_numeric_array;
data_numeric_array(:,8) = health_numeric_array;
data_numeric_array(:,9) = class_numeric_array;
%%
% 2)
random_order = randperm(n);
random_order_data = zeros(n,m);
for i = 1:n
    random_order_data(i,:) = data_numeric_array(random_order(i),:);
end
random_order_parents_numeric_array = random_order_data(:,1);
random_order_has_nurs_numeric_array = random_order_data(:,2);
random_order_form_numeric_array = random_order_data(:,3);
random_order_childern_numeric_array = random_order_data(:,4);
random_order_housing_numeric_array = random_order_data(:,5);
random_order_finance_numeric_array = random_order_data(:,6);
random_order_social_numeric_array = random_order_data(:,7);
random_order_health_numeric_array = random_order_data(:,8);
random_order_class_numeric_array = random_order_data(:,9);
random_order_train_data = random_order_data(1:train,:);
random_order_train_parents_numeric_array = random_order_train_data(:,1);
random_order_train_has_nurs_numeric_array = random_order_train_data(:,2);
random_order_train_form_numeric_array = random_order_train_data(:,3);
random_order_train_childern_numeric_array = random_order_train_data(:,4);
random_order_train_housing_numeric_array = random_order_train_data(:,5);
random_order_train_finance_numeric_array = random_order_train_data(:,6);
random_order_train_train_social_numeric_array = random_order_train_data(:,7);
random_order_train_health_numeric_array = random_order_train_data(:,8);
random_order_train_class_numeric_array = random_order_train_data(:,9);
random_order_test_data = random_order_data(train + 1:n,:);
random_order_test_parents_numeric_array = random_order_test_data(:,1);
random_order_test_has_nurs_numeric_array = random_order_test_data(:,2);
random_order_test_form_numeric_array = random_order_test_data(:,3);
random_order_test_childern_numeric_array = random_order_test_data(:,4);
random_order_test_housing_numeric_array = random_order_test_data(:,5);
random_order_test_finance_numeric_array = random_order_test_data(:,6);
random_order_test_social_numeric_array = random_order_test_data(:,7);
random_order_test_health_numeric_array = random_order_test_data(:,8);
random_order_test_class_numeric_array = random_order_test_data(:,9);
%%
% 3)
class_probability = zeros(5,1);
not_recom_rows = (random_order_train_class_numeric_array == 1);
not_recom_number = sum(not_recom_rows);
random_order_not_recom_train_data = random_order_train_data(not_recom_rows,:);
class_probability(1) = not_recom_number / n;
priority_rows = (random_order_train_class_numeric_array == 2);
priority_number = sum(priority_rows);
random_order_priority_train_data = random_order_train_data(priority_rows,:);
class_probability(2) = priority_number / n;
recommend_rows = (random_order_train_class_numeric_array == 3);
recommend_number = sum(recommend_rows);
random_order_recommend_train_data = random_order_train_data(recommend_rows,:);
class_probability(3) = recommend_number / n;
spec_prior_rows = (random_order_train_class_numeric_array == 4);
spec_prior_number = sum(spec_prior_rows);
random_order_spec_prior_train_data = random_order_train_data(spec_prior_rows,:);
class_probability(4) = spec_prior_number / n;
very_recom_rows = (random_order_train_class_numeric_array == 5);
very_recom_number = sum(very_recom_rows);
random_order_very_recom_train_data = random_order_train_data(very_recom_rows,:);
class_probability(5) = very_recom_number / n;

% parents

parents_conditional_probability = zeros(length(class_unique_array),length(parents_unique_array));

not_recom_great_pret_rows = (random_order_not_recom_train_data(:,1) == 1);
not_recom_great_pret_number = sum(not_recom_great_pret_rows);
parents_conditional_probability(1,1) = not_recom_great_pret_number / not_recom_number;
not_recom_pretentious_rows = (random_order_not_recom_train_data(:,1) == 2);
not_recom_pretentious_number = sum(not_recom_pretentious_rows);
parents_conditional_probability(1,2) = not_recom_pretentious_number / not_recom_number;
not_recom_usual_rows = (random_order_not_recom_train_data(:,1) == 3);
not_recom_usual_number = sum(not_recom_usual_rows);
parents_conditional_probability(1,3) = not_recom_usual_number / not_recom_number;

priority_great_pret_rows = (random_order_priority_train_data(:,1) == 1);
priority_great_pret_number = sum(priority_great_pret_rows);
parents_conditional_probability(2,1) = priority_great_pret_number / priority_number;
priority_pretentious_rows = (random_order_priority_train_data(:,1) == 2);
priority_pretentious_number = sum(priority_pretentious_rows);
parents_conditional_probability(2,2) = priority_pretentious_number / priority_number;
priority_usual_rows = (random_order_priority_train_data(:,1) == 3);
priority_usual_number = sum(priority_usual_rows);
parents_conditional_probability(2,3) = priority_usual_number / priority_number;

recommend_great_pret_rows = (random_order_recommend_train_data(:,1) == 1);
recommend_great_pret_number = sum(recommend_great_pret_rows);
parents_conditional_probability(3,1) = recommend_great_pret_number / recommend_number;
recommend_pretentious_rows = (random_order_recommend_train_data(:,1) == 2);
recommend_pretentious_number = sum(recommend_pretentious_rows);
parents_conditional_probability(3,2) = recommend_pretentious_number / recommend_number;
recommend_usual_rows = (random_order_recommend_train_data(:,1) == 3);
recommend_usual_number = sum(recommend_usual_rows);
parents_conditional_probability(3,3) = recommend_usual_number / recommend_number;

spec_prior_great_pret_rows = (random_order_spec_prior_train_data(:,1) == 1);
spec_prior_great_pret_number = sum(spec_prior_great_pret_rows);
parents_conditional_probability(4,1) = spec_prior_great_pret_number / spec_prior_number;
spec_prior_pretentious_rows = (random_order_spec_prior_train_data(:,1) == 2);
spec_prior_pretentious_number = sum(spec_prior_pretentious_rows);
parents_conditional_probability(4,2) = spec_prior_pretentious_number / spec_prior_number;
spec_prior_usual_rows = (random_order_spec_prior_train_data(:,1) == 3);
spec_prior_usual_number = sum(spec_prior_usual_rows);
parents_conditional_probability(4,3) = spec_prior_usual_number / spec_prior_number;

very_recom_great_pret_rows = (random_order_very_recom_train_data(:,1) == 1);
very_recom_great_pret_number = sum(very_recom_great_pret_rows);
parents_conditional_probability(5,1) = very_recom_great_pret_number / very_recom_number;
very_recom_pretentious_rows = (random_order_very_recom_train_data(:,1) == 2);
very_recom_pretentious_number = sum(very_recom_pretentious_rows);
parents_conditional_probability(5,2) = very_recom_pretentious_number / very_recom_number;
very_recom_usual_rows = (random_order_very_recom_train_data(:,1) == 3);
very_recom_usual_number = sum(very_recom_usual_rows);
parents_conditional_probability(5,3) = very_recom_usual_number / very_recom_number;

% has_nurs

has_nurs_conditional_probability = zeros(length(class_unique_array),length(has_nurs_unique_array));

not_recom_critical_rows = (random_order_not_recom_train_data(:,2) == 1);
not_recom_critical_number = sum(not_recom_critical_rows);
has_nurs_conditional_probability(1,1) = not_recom_critical_number / not_recom_number;
not_recom_improper_rows = (random_order_not_recom_train_data(:,2) == 2);
not_recom_improper_number = sum(not_recom_improper_rows);
has_nurs_conditional_probability(1,2) = not_recom_improper_number / not_recom_number;
not_recom_less_proper_rows = (random_order_not_recom_train_data(:,2) == 3);
not_recom_less_proper_number = sum(not_recom_less_proper_rows);
has_nurs_conditional_probability(1,3) = not_recom_less_proper_number / not_recom_number;
not_recom_proper_rows = (random_order_not_recom_train_data(:,2) == 4);
not_recom_proper_number = sum(not_recom_proper_rows);
has_nurs_conditional_probability(1,4) = not_recom_proper_number / not_recom_number;
not_recom_very_crit_rows = (random_order_not_recom_train_data(:,2) == 5);
not_recom_very_crit_number = sum(not_recom_very_crit_rows);
has_nurs_conditional_probability(1,5) = not_recom_very_crit_number / not_recom_number;

priority_critical_rows = (random_order_priority_train_data(:,2) == 1);
priority_critical_number = sum(priority_critical_rows);
has_nurs_conditional_probability(2,1) = priority_critical_number / priority_number;
priority_improper_rows = (random_order_priority_train_data(:,2) == 2);
priority_improper_number = sum(priority_improper_rows);
has_nurs_conditional_probability(2,2) = priority_improper_number / priority_number;
priority_less_proper_rows = (random_order_priority_train_data(:,2) == 3);
priority_less_proper_number = sum(priority_less_proper_rows);
has_nurs_conditional_probability(2,3) = priority_less_proper_number / priority_number;
priority_proper_rows = (random_order_priority_train_data(:,2) == 4);
priority_proper_number = sum(priority_proper_rows);
has_nurs_conditional_probability(2,4) = priority_proper_number / priority_number;
priority_very_crit_rows = (random_order_priority_train_data(:,2) == 5);
priority_very_crit_number = sum(priority_very_crit_rows);
has_nurs_conditional_probability(2,5) = priority_very_crit_number / priority_number;

recommend_critical_rows = (random_order_recommend_train_data(:,2) == 1);
recommend_critical_number = sum(recommend_critical_rows);
has_nurs_conditional_probability(3,1) = recommend_critical_number / recommend_number;
recommend_improper_rows = (random_order_recommend_train_data(:,2) == 2);
recommend_improper_number = sum(recommend_improper_rows);
has_nurs_conditional_probability(3,2) = recommend_improper_number / recommend_number;
recommend_less_proper_rows = (random_order_recommend_train_data(:,2) == 3);
recommend_less_proper_number = sum(recommend_less_proper_rows);
has_nurs_conditional_probability(3,3) = recommend_less_proper_number / recommend_number;
recommend_proper_rows = (random_order_recommend_train_data(:,2) == 4);
recommend_proper_number = sum(recommend_proper_rows);
has_nurs_conditional_probability(3,4) = recommend_proper_number / recommend_number;
recommend_very_crit_rows = (random_order_recommend_train_data(:,2) == 5);
recommend_very_crit_number = sum(recommend_very_crit_rows);
has_nurs_conditional_probability(3,5) = recommend_very_crit_number / recommend_number;

spec_prior_critical_rows = (random_order_spec_prior_train_data(:,2) == 1);
spec_prior_critical_number = sum(spec_prior_critical_rows);
has_nurs_conditional_probability(4,1) = spec_prior_critical_number / spec_prior_number;
spec_prior_improper_rows = (random_order_spec_prior_train_data(:,2) == 2);
spec_prior_improper_number = sum(spec_prior_improper_rows);
has_nurs_conditional_probability(4,2) = spec_prior_improper_number / spec_prior_number;
spec_prior_less_proper_rows = (random_order_spec_prior_train_data(:,2) == 3);
spec_prior_less_proper_number = sum(spec_prior_less_proper_rows);
has_nurs_conditional_probability(4,3) = spec_prior_less_proper_number / spec_prior_number;
spec_prior_proper_rows = (random_order_spec_prior_train_data(:,2) == 4);
spec_prior_proper_number = sum(spec_prior_proper_rows);
has_nurs_conditional_probability(4,4) = spec_prior_proper_number / spec_prior_number;
spec_prior_very_crit_rows = (random_order_spec_prior_train_data(:,2) == 5);
spec_prior_very_crit_number = sum(spec_prior_very_crit_rows);
has_nurs_conditional_probability(4,5) = spec_prior_very_crit_number / spec_prior_number;

very_recom_critical_rows = (random_order_very_recom_train_data(:,2) == 1);
very_recom_critical_number = sum(very_recom_critical_rows);
has_nurs_conditional_probability(5,1) = very_recom_critical_number / very_recom_number;
very_recom_improper_rows = (random_order_very_recom_train_data(:,2) == 2);
very_recom_improper_number = sum(very_recom_improper_rows);
has_nurs_conditional_probability(5,2) = very_recom_improper_number / very_recom_number;
very_recom_less_proper_rows = (random_order_very_recom_train_data(:,2) == 3);
very_recom_less_proper_number = sum(very_recom_less_proper_rows);
has_nurs_conditional_probability(5,3) = very_recom_less_proper_number / very_recom_number;
very_recom_proper_rows = (random_order_very_recom_train_data(:,2) == 4);
very_recom_proper_number = sum(very_recom_proper_rows);
has_nurs_conditional_probability(5,4) = very_recom_proper_number / very_recom_number;
very_recom_very_crit_rows = (random_order_very_recom_train_data(:,2) == 5);
very_recom_very_crit_number = sum(very_recom_very_crit_rows);
has_nurs_conditional_probability(5,5) = very_recom_very_crit_number / very_recom_number;

% form

form_conditional_probability = zeros(length(class_unique_array),length(form_unique_array));

not_recom_critical_rows = (random_order_not_recom_train_data(:,3) == 1);
not_recom_critical_number = sum(not_recom_critical_rows);
form_conditional_probability(1,1) = not_recom_critical_number / not_recom_number;
not_recom_improper_rows = (random_order_not_recom_train_data(:,3) == 2);
not_recom_improper_number = sum(not_recom_improper_rows);
form_conditional_probability(1,2) = not_recom_improper_number / not_recom_number;
not_recom_less_proper_rows = (random_order_not_recom_train_data(:,3) == 3);
not_recom_less_proper_number = sum(not_recom_less_proper_rows);
form_conditional_probability(1,3) = not_recom_less_proper_number / not_recom_number;
not_recom_proper_rows = (random_order_not_recom_train_data(:,3) == 4);
not_recom_proper_number = sum(not_recom_proper_rows);
form_conditional_probability(1,4) = not_recom_proper_number / not_recom_number;

priority_critical_rows = (random_order_priority_train_data(:,3) == 1);
priority_critical_number = sum(priority_critical_rows);
form_conditional_probability(2,1) = priority_critical_number / priority_number;
priority_improper_rows = (random_order_priority_train_data(:,3) == 2);
priority_improper_number = sum(priority_improper_rows);
form_conditional_probability(2,2) = priority_improper_number / priority_number;
priority_less_proper_rows = (random_order_priority_train_data(:,3) == 3);
priority_less_proper_number = sum(priority_less_proper_rows);
form_conditional_probability(2,3) = priority_less_proper_number / priority_number;
priority_proper_rows = (random_order_priority_train_data(:,3) == 4);
priority_proper_number = sum(priority_proper_rows);
form_conditional_probability(2,4) = priority_proper_number / priority_number;

recommend_critical_rows = (random_order_recommend_train_data(:,3) == 1);
recommend_critical_number = sum(recommend_critical_rows);
form_conditional_probability(3,1) = recommend_critical_number / recommend_number;
recommend_improper_rows = (random_order_recommend_train_data(:,3) == 2);
recommend_improper_number = sum(recommend_improper_rows);
form_conditional_probability(3,2) = recommend_improper_number / recommend_number;
recommend_less_proper_rows = (random_order_recommend_train_data(:,3) == 3);
recommend_less_proper_number = sum(recommend_less_proper_rows);
form_conditional_probability(3,3) = recommend_less_proper_number / recommend_number;
recommend_proper_rows = (random_order_recommend_train_data(:,3) == 4);
recommend_proper_number = sum(recommend_proper_rows);
form_conditional_probability(3,4) = recommend_proper_number / recommend_number;

spec_prior_critical_rows = (random_order_spec_prior_train_data(:,3) == 1);
spec_prior_critical_number = sum(spec_prior_critical_rows);
form_conditional_probability(4,1) = spec_prior_critical_number / spec_prior_number;
spec_prior_improper_rows = (random_order_spec_prior_train_data(:,3) == 2);
spec_prior_improper_number = sum(spec_prior_improper_rows);
form_conditional_probability(4,2) = spec_prior_improper_number / spec_prior_number;
spec_prior_less_proper_rows = (random_order_spec_prior_train_data(:,3) == 3);
spec_prior_less_proper_number = sum(spec_prior_less_proper_rows);
form_conditional_probability(4,3) = spec_prior_less_proper_number / spec_prior_number;
spec_prior_proper_rows = (random_order_spec_prior_train_data(:,3) == 4);
spec_prior_proper_number = sum(spec_prior_proper_rows);
form_conditional_probability(4,4) = spec_prior_proper_number / spec_prior_number;

very_recom_critical_rows = (random_order_very_recom_train_data(:,3) == 1);
very_recom_critical_number = sum(very_recom_critical_rows);
form_conditional_probability(5,1) = very_recom_critical_number / very_recom_number;
very_recom_improper_rows = (random_order_very_recom_train_data(:,3) == 2);
very_recom_improper_number = sum(very_recom_improper_rows);
form_conditional_probability(5,2) = very_recom_improper_number / very_recom_number;
very_recom_less_proper_rows = (random_order_very_recom_train_data(:,3) == 3);
very_recom_less_proper_number = sum(very_recom_less_proper_rows);
form_conditional_probability(5,3) = very_recom_less_proper_number / very_recom_number;
very_recom_proper_rows = (random_order_very_recom_train_data(:,3) == 4);
very_recom_proper_number = sum(very_recom_proper_rows);
form_conditional_probability(5,4) = very_recom_proper_number / very_recom_number;

% childern

childern_conditional_probability = zeros(length(class_unique_array),length(childern_unique_array));

not_recom_critical_rows = (random_order_not_recom_train_data(:,4) == 1);
not_recom_critical_number = sum(not_recom_critical_rows);
childern_conditional_probability(1,1) = not_recom_critical_number / not_recom_number;
not_recom_improper_rows = (random_order_not_recom_train_data(:,4) == 2);
not_recom_improper_number = sum(not_recom_improper_rows);
childern_conditional_probability(1,2) = not_recom_improper_number / not_recom_number;
not_recom_less_proper_rows = (random_order_not_recom_train_data(:,4) == 3);
not_recom_less_proper_number = sum(not_recom_less_proper_rows);
childern_conditional_probability(1,3) = not_recom_less_proper_number / not_recom_number;
not_recom_proper_rows = (random_order_not_recom_train_data(:,4) == 4);
not_recom_proper_number = sum(not_recom_proper_rows);
childern_conditional_probability(1,4) = not_recom_proper_number / not_recom_number;

priority_critical_rows = (random_order_priority_train_data(:,4) == 1);
priority_critical_number = sum(priority_critical_rows);
childern_conditional_probability(2,1) = priority_critical_number / priority_number;
priority_improper_rows = (random_order_priority_train_data(:,4) == 2);
priority_improper_number = sum(priority_improper_rows);
childern_conditional_probability(2,2) = priority_improper_number / priority_number;
priority_less_proper_rows = (random_order_priority_train_data(:,4) == 3);
priority_less_proper_number = sum(priority_less_proper_rows);
childern_conditional_probability(2,3) = priority_less_proper_number / priority_number;
priority_proper_rows = (random_order_priority_train_data(:,4) == 4);
priority_proper_number = sum(priority_proper_rows);
childern_conditional_probability(2,4) = priority_proper_number / priority_number;

recommend_critical_rows = (random_order_recommend_train_data(:,4) == 1);
recommend_critical_number = sum(recommend_critical_rows);
childern_conditional_probability(3,1) = recommend_critical_number / recommend_number;
recommend_improper_rows = (random_order_recommend_train_data(:,4) == 2);
recommend_improper_number = sum(recommend_improper_rows);
childern_conditional_probability(3,2) = recommend_improper_number / recommend_number;
recommend_less_proper_rows = (random_order_recommend_train_data(:,4) == 3);
recommend_less_proper_number = sum(recommend_less_proper_rows);
childern_conditional_probability(3,3) = recommend_less_proper_number / recommend_number;
recommend_proper_rows = (random_order_recommend_train_data(:,4) == 4);
recommend_proper_number = sum(recommend_proper_rows);
childern_conditional_probability(3,4) = recommend_proper_number / recommend_number;

spec_prior_critical_rows = (random_order_spec_prior_train_data(:,4) == 1);
spec_prior_critical_number = sum(spec_prior_critical_rows);
childern_conditional_probability(4,1) = spec_prior_critical_number / spec_prior_number;
spec_prior_improper_rows = (random_order_spec_prior_train_data(:,4) == 2);
spec_prior_improper_number = sum(spec_prior_improper_rows);
childern_conditional_probability(4,2) = spec_prior_improper_number / spec_prior_number;
spec_prior_less_proper_rows = (random_order_spec_prior_train_data(:,4) == 3);
spec_prior_less_proper_number = sum(spec_prior_less_proper_rows);
childern_conditional_probability(4,3) = spec_prior_less_proper_number / spec_prior_number;
spec_prior_proper_rows = (random_order_spec_prior_train_data(:,4) == 4);
spec_prior_proper_number = sum(spec_prior_proper_rows);
childern_conditional_probability(4,4) = spec_prior_proper_number / spec_prior_number;

very_recom_critical_rows = (random_order_very_recom_train_data(:,4) == 1);
very_recom_critical_number = sum(very_recom_critical_rows);
childern_conditional_probability(5,1) = very_recom_critical_number / very_recom_number;
very_recom_improper_rows = (random_order_very_recom_train_data(:,4) == 2);
very_recom_improper_number = sum(very_recom_improper_rows);
childern_conditional_probability(5,2) = very_recom_improper_number / very_recom_number;
very_recom_less_proper_rows = (random_order_very_recom_train_data(:,4) == 3);
very_recom_less_proper_number = sum(very_recom_less_proper_rows);
childern_conditional_probability(5,3) = very_recom_less_proper_number / very_recom_number;
very_recom_proper_rows = (random_order_very_recom_train_data(:,4) == 4);
very_recom_proper_number = sum(very_recom_proper_rows);
childern_conditional_probability(5,4) = very_recom_proper_number / very_recom_number;

% housing

housing_conditional_probability = zeros(length(class_unique_array),length(housing_unique_array));

not_recom_great_pret_rows = (random_order_not_recom_train_data(:,5) == 1);
not_recom_great_pret_number = sum(not_recom_great_pret_rows);
housing_conditional_probability(1,1) = not_recom_great_pret_number / not_recom_number;
not_recom_pretentious_rows = (random_order_not_recom_train_data(:,5) == 2);
not_recom_pretentious_number = sum(not_recom_pretentious_rows);
housing_conditional_probability(1,2) = not_recom_pretentious_number / not_recom_number;
not_recom_usual_rows = (random_order_not_recom_train_data(:,5) == 3);
not_recom_usual_number = sum(not_recom_usual_rows);
housing_conditional_probability(1,3) = not_recom_usual_number / not_recom_number;

priority_great_pret_rows = (random_order_priority_train_data(:,5) == 1);
priority_great_pret_number = sum(priority_great_pret_rows);
housing_conditional_probability(2,1) = priority_great_pret_number / priority_number;
priority_pretentious_rows = (random_order_priority_train_data(:,5) == 2);
priority_pretentious_number = sum(priority_pretentious_rows);
housing_conditional_probability(2,2) = priority_pretentious_number / priority_number;
priority_usual_rows = (random_order_priority_train_data(:,5) == 3);
priority_usual_number = sum(priority_usual_rows);
housing_conditional_probability(2,3) = priority_usual_number / priority_number;

recommend_great_pret_rows = (random_order_recommend_train_data(:,5) == 1);
recommend_great_pret_number = sum(recommend_great_pret_rows);
housing_conditional_probability(3,1) = recommend_great_pret_number / recommend_number;
recommend_pretentious_rows = (random_order_recommend_train_data(:,5) == 2);
recommend_pretentious_number = sum(recommend_pretentious_rows);
housing_conditional_probability(3,2) = recommend_pretentious_number / recommend_number;
recommend_usual_rows = (random_order_recommend_train_data(:,5) == 3);
recommend_usual_number = sum(recommend_usual_rows);
housing_conditional_probability(3,3) = recommend_usual_number / recommend_number;

spec_prior_great_pret_rows = (random_order_spec_prior_train_data(:,5) == 1);
spec_prior_great_pret_number = sum(spec_prior_great_pret_rows);
housing_conditional_probability(4,1) = spec_prior_great_pret_number / spec_prior_number;
spec_prior_pretentious_rows = (random_order_spec_prior_train_data(:,5) == 2);
spec_prior_pretentious_number = sum(spec_prior_pretentious_rows);
housing_conditional_probability(4,2) = spec_prior_pretentious_number / spec_prior_number;
spec_prior_usual_rows = (random_order_spec_prior_train_data(:,5) == 3);
spec_prior_usual_number = sum(spec_prior_usual_rows);
housing_conditional_probability(4,3) = spec_prior_usual_number / spec_prior_number;

very_recom_great_pret_rows = (random_order_very_recom_train_data(:,5) == 1);
very_recom_great_pret_number = sum(very_recom_great_pret_rows);
housing_conditional_probability(5,1) = very_recom_great_pret_number / very_recom_number;
very_recom_pretentious_rows = (random_order_very_recom_train_data(:,5) == 2);
very_recom_pretentious_number = sum(very_recom_pretentious_rows);
housing_conditional_probability(5,2) = very_recom_pretentious_number / very_recom_number;
very_recom_usual_rows = (random_order_very_recom_train_data(:,5) == 3);
very_recom_usual_number = sum(very_recom_usual_rows);
housing_conditional_probability(5,3) = very_recom_usual_number / very_recom_number;

% finance

finance_conditional_probability = zeros(length(class_unique_array),length(finance_unique_array));

not_recom_great_pret_rows = (random_order_not_recom_train_data(:,6) == 1);
not_recom_great_pret_number = sum(not_recom_great_pret_rows);
finance_conditional_probability(1,1) = not_recom_great_pret_number / not_recom_number;
not_recom_pretentious_rows = (random_order_not_recom_train_data(:,6) == 2);
not_recom_pretentious_number = sum(not_recom_pretentious_rows);
finance_conditional_probability(1,2) = not_recom_pretentious_number / not_recom_number;

priority_great_pret_rows = (random_order_priority_train_data(:,6) == 1);
priority_great_pret_number = sum(priority_great_pret_rows);
finance_conditional_probability(2,1) = priority_great_pret_number / priority_number;
priority_pretentious_rows = (random_order_priority_train_data(:,6) == 2);
priority_pretentious_number = sum(priority_pretentious_rows);
finance_conditional_probability(2,2) = priority_pretentious_number / priority_number;

recommend_great_pret_rows = (random_order_recommend_train_data(:,6) == 1);
recommend_great_pret_number = sum(recommend_great_pret_rows);
finance_conditional_probability(3,1) = recommend_great_pret_number / recommend_number;
recommend_pretentious_rows = (random_order_recommend_train_data(:,6) == 2);
recommend_pretentious_number = sum(recommend_pretentious_rows);
finance_conditional_probability(3,2) = recommend_pretentious_number / recommend_number;

spec_prior_great_pret_rows = (random_order_spec_prior_train_data(:,6) == 1);
spec_prior_great_pret_number = sum(spec_prior_great_pret_rows);
finance_conditional_probability(4,1) = spec_prior_great_pret_number / spec_prior_number;
spec_prior_pretentious_rows = (random_order_spec_prior_train_data(:,6) == 2);
spec_prior_pretentious_number = sum(spec_prior_pretentious_rows);
finance_conditional_probability(4,2) = spec_prior_pretentious_number / spec_prior_number;

very_recom_great_pret_rows = (random_order_very_recom_train_data(:,6) == 1);
very_recom_great_pret_number = sum(very_recom_great_pret_rows);
finance_conditional_probability(5,1) = very_recom_great_pret_number / very_recom_number;
very_recom_pretentious_rows = (random_order_very_recom_train_data(:,6) == 2);
very_recom_pretentious_number = sum(very_recom_pretentious_rows);
finance_conditional_probability(5,2) = very_recom_pretentious_number / very_recom_number;

% social

social_conditional_probability = zeros(length(class_unique_array),length(social_unique_array));

not_recom_great_pret_rows = (random_order_not_recom_train_data(:,7) == 1);
not_recom_great_pret_number = sum(not_recom_great_pret_rows);
social_conditional_probability(1,1) = not_recom_great_pret_number / not_recom_number;
not_recom_pretentious_rows = (random_order_not_recom_train_data(:,7) == 2);
not_recom_pretentious_number = sum(not_recom_pretentious_rows);
social_conditional_probability(1,2) = not_recom_pretentious_number / not_recom_number;
not_recom_usual_rows = (random_order_not_recom_train_data(:,7) == 3);
not_recom_usual_number = sum(not_recom_usual_rows);
social_conditional_probability(1,3) = not_recom_usual_number / not_recom_number;

priority_great_pret_rows = (random_order_priority_train_data(:,7) == 1);
priority_great_pret_number = sum(priority_great_pret_rows);
social_conditional_probability(2,1) = priority_great_pret_number / priority_number;
priority_pretentious_rows = (random_order_priority_train_data(:,7) == 2);
priority_pretentious_number = sum(priority_pretentious_rows);
social_conditional_probability(2,2) = priority_pretentious_number / priority_number;
priority_usual_rows = (random_order_priority_train_data(:,7) == 3);
priority_usual_number = sum(priority_usual_rows);
social_conditional_probability(2,3) = priority_usual_number / priority_number;

recommend_great_pret_rows = (random_order_recommend_train_data(:,7) == 1);
recommend_great_pret_number = sum(recommend_great_pret_rows);
social_conditional_probability(3,1) = recommend_great_pret_number / recommend_number;
recommend_pretentious_rows = (random_order_recommend_train_data(:,7) == 2);
recommend_pretentious_number = sum(recommend_pretentious_rows);
social_conditional_probability(3,2) = recommend_pretentious_number / recommend_number;
recommend_usual_rows = (random_order_recommend_train_data(:,7) == 3);
recommend_usual_number = sum(recommend_usual_rows);
social_conditional_probability(3,3) = recommend_usual_number / recommend_number;

spec_prior_great_pret_rows = (random_order_spec_prior_train_data(:,7) == 1);
spec_prior_great_pret_number = sum(spec_prior_great_pret_rows);
social_conditional_probability(4,1) = spec_prior_great_pret_number / spec_prior_number;
spec_prior_pretentious_rows = (random_order_spec_prior_train_data(:,7) == 2);
spec_prior_pretentious_number = sum(spec_prior_pretentious_rows);
social_conditional_probability(4,2) = spec_prior_pretentious_number / spec_prior_number;
spec_prior_usual_rows = (random_order_spec_prior_train_data(:,7) == 3);
spec_prior_usual_number = sum(spec_prior_usual_rows);
social_conditional_probability(4,3) = spec_prior_usual_number / spec_prior_number;

very_recom_great_pret_rows = (random_order_very_recom_train_data(:,7) == 1);
very_recom_great_pret_number = sum(very_recom_great_pret_rows);
social_conditional_probability(5,1) = very_recom_great_pret_number / very_recom_number;
very_recom_pretentious_rows = (random_order_very_recom_train_data(:,7) == 2);
very_recom_pretentious_number = sum(very_recom_pretentious_rows);
social_conditional_probability(5,2) = very_recom_pretentious_number / very_recom_number;
very_recom_usual_rows = (random_order_very_recom_train_data(:,7) == 3);
very_recom_usual_number = sum(very_recom_usual_rows);
social_conditional_probability(5,3) = very_recom_usual_number / very_recom_number;

% health

health_conditional_probability = zeros(length(class_unique_array),length(health_unique_array));

not_recom_great_pret_rows = (random_order_not_recom_train_data(:,8) == 1);
not_recom_great_pret_number = sum(not_recom_great_pret_rows);
health_conditional_probability(1,1) = not_recom_great_pret_number / not_recom_number;
not_recom_pretentious_rows = (random_order_not_recom_train_data(:,8) == 2);
not_recom_pretentious_number = sum(not_recom_pretentious_rows);
health_conditional_probability(1,2) = not_recom_pretentious_number / not_recom_number;
not_recom_usual_rows = (random_order_not_recom_train_data(:,8) == 3);
not_recom_usual_number = sum(not_recom_usual_rows);
health_conditional_probability(1,3) = not_recom_usual_number / not_recom_number;

priority_great_pret_rows = (random_order_priority_train_data(:,8) == 1);
priority_great_pret_number = sum(priority_great_pret_rows);
health_conditional_probability(2,1) = priority_great_pret_number / priority_number;
priority_pretentious_rows = (random_order_priority_train_data(:,8) == 2);
priority_pretentious_number = sum(priority_pretentious_rows);
health_conditional_probability(2,2) = priority_pretentious_number / priority_number;
priority_usual_rows = (random_order_priority_train_data(:,8) == 3);
priority_usual_number = sum(priority_usual_rows);
health_conditional_probability(2,3) = priority_usual_number / priority_number;

recommend_great_pret_rows = (random_order_recommend_train_data(:,8) == 1);
recommend_great_pret_number = sum(recommend_great_pret_rows);
health_conditional_probability(3,1) = recommend_great_pret_number / recommend_number;
recommend_pretentious_rows = (random_order_recommend_train_data(:,8) == 2);
recommend_pretentious_number = sum(recommend_pretentious_rows);
health_conditional_probability(3,2) = recommend_pretentious_number / recommend_number;
recommend_usual_rows = (random_order_recommend_train_data(:,8) == 3);
recommend_usual_number = sum(recommend_usual_rows);
health_conditional_probability(3,3) = recommend_usual_number / recommend_number;

spec_prior_great_pret_rows = (random_order_spec_prior_train_data(:,8) == 1);
spec_prior_great_pret_number = sum(spec_prior_great_pret_rows);
health_conditional_probability(4,1) = spec_prior_great_pret_number / spec_prior_number;
spec_prior_pretentious_rows = (random_order_spec_prior_train_data(:,8) == 2);
spec_prior_pretentious_number = sum(spec_prior_pretentious_rows);
health_conditional_probability(4,2) = spec_prior_pretentious_number / spec_prior_number;
spec_prior_usual_rows = (random_order_spec_prior_train_data(:,8) == 3);
spec_prior_usual_number = sum(spec_prior_usual_rows);
health_conditional_probability(4,3) = spec_prior_usual_number / spec_prior_number;

very_recom_great_pret_rows = (random_order_very_recom_train_data(:,8) == 1);
very_recom_great_pret_number = sum(very_recom_great_pret_rows);
health_conditional_probability(5,1) = very_recom_great_pret_number / very_recom_number;
very_recom_pretentious_rows = (random_order_very_recom_train_data(:,8) == 2);
very_recom_pretentious_number = sum(very_recom_pretentious_rows);
health_conditional_probability(5,2) = very_recom_pretentious_number / very_recom_number;
very_recom_usual_rows = (random_order_very_recom_train_data(:,8) == 3);
very_recom_usual_number = sum(very_recom_usual_rows);
health_conditional_probability(5,3) = very_recom_usual_number / very_recom_number;
%%
% 4)
random_order_test_data_conditional_probability = zeros(test,5);
for i = 1:test
    for j = 1:length(class_unique_array)
        random_order_test_data_conditional_probability(i,j) =  class_probability(j) * ...
            parents_conditional_probability(j,random_order_test_parents_numeric_array(i)) * ...
            has_nurs_conditional_probability(j,random_order_test_has_nurs_numeric_array(i)) * ...
            form_conditional_probability(j,random_order_test_form_numeric_array(i)) * ...
            childern_conditional_probability(j,random_order_test_childern_numeric_array(i)) * ...
            housing_conditional_probability(j,random_order_test_housing_numeric_array(i)) * ...
            finance_conditional_probability(j,random_order_test_finance_numeric_array(i)) * ...
            social_conditional_probability(j,random_order_test_social_numeric_array(i)) * ...
            health_conditional_probability(j,random_order_test_health_numeric_array(i));
    end
end
max_random_order_test_data_conditional_probability = max(random_order_test_data_conditional_probability,[],2);
predicted_class = zeros(test,1);
for i = 1:test
    for j = 1:5
        if(random_order_test_data_conditional_probability(i,j) == max_random_order_test_data_conditional_probability(i))
            predicted_class(i,1) = j;
        end
    end
end
predicted_class_matrix = zeros(5,test);
random_order_test_class_numeric_matrix = zeros(5,test);
for i = 1:test
    predicted_class_matrix(predicted_class(i),i) = 1;
    random_order_test_class_numeric_matrix(random_order_test_class_numeric_array(i),i) = 1;
end
plotconfusion(random_order_test_class_numeric_matrix,predicted_class_matrix);
confusion_matrix = confusionmat(random_order_test_class_numeric_array,predicted_class);
%%
% 5)
[coeff,score,latent,tsquared,explained,mu] = pca(random_order_data(:,1:8));
%%
% Question 3
%%
% a)
load('forestfires.mat');
n = 517;
m = 13;
train = 400;
test = n - train;
month_table = forestfires(:,3);
month_array = table2array(month_table);
month_unique_table = unique(month_table);
month_unique_array = table2array(month_unique_table);
day_table = forestfires(:,4);
day_array = table2array(day_table);
day_unique_table = unique(day_table);
day_unique_array = table2array(day_unique_table);
month_numeric_array = zeros(n,1);
for j = 1:length(month_unique_array)
    selected_rows = (month_array == month_unique_array(j));
    month_numeric_array(selected_rows) = j;
end
day_numeric_array = zeros(n,1);
for j = 1:length(day_unique_array)
    selected_rows = (day_array == day_unique_array(j));
    day_numeric_array(selected_rows) = j;
end
data_numeric_array = zeros(n,m);
data_numeric_array(:,1:2) = table2array(forestfires(:,1:2));
data_numeric_array(:,3) = month_numeric_array;
data_numeric_array(:,4) = day_numeric_array;
data_numeric_array(:,5:13) = table2array(forestfires(:,5:13));
%%
% b)
random_order = randperm(n);
random_order_data = zeros(n,m);
for i = 1:n
    random_order_data(i,:) = data_numeric_array(random_order(i),:);
end
random_order_train_data = random_order_data(1:train,:);
random_order_test_data = random_order_data(train + 1:n,:);
%%
% c)
random_order_train_data_table = array2table(random_order_train_data);
mdl = fitlm(random_order_train_data_table,'Linear');
%%
% d)
%%
% e)
sum = 0;
for i = 1:train
   sum = sum + (random_order_train_data(i,13) - mdl.Fitted(i)) ^ 2;
end
MSE_Fitted = sum / train;
%%
% f)
predict = mdl.predict(random_order_test_data(:,1:12));
sum = 0;
for i = 1:test
   sum = sum + (random_order_test_data(i,13) - predict(i)) ^ 2;
end
MSE_predict = sum / test;