% EM Parameters 
clc
format long
addpath(genpath(pwd));
tic


load weather_data

% change these parameters
original_responses = Lnew;  
true_labels = labelstrue1;
classes = [1,2,3,4,5]; 
nusers_task = 12; %number of users to a task
n_random_users = 1; %number of random users for random_init_dynamic
batch = 1; % batch for label aggregation in random_dynamic_L, select a batch at a time randomly 
iter = 0;
max_iter=100;

precisions = [];

printstr = sprintf('\n\n For Full Batch\n'); 
fprintf('%s',printstr);

responses = Lnew;

EM;
MV_DS;

% dynamic algorithm to select users
random_init_dynamic; % random initialisation of users

responses = new_L;  %from random_init_dynamic

printstr = sprintf('\n\n For Ranked\n'); 
fprintf('%s',printstr);

for ix=1:1:nusers_task 
    EM;
    MV_DS;
    %precisions = [precisions, prediction_accuracy];
    dynamic_L;
    %random_dynamic_L;

end

printstr = sprintf('\n\n For Random\n'); 
fprintf('%s',printstr);

responses = new_L;
for ix=1:1:nusers_task 
    EM;
    MV_DS;
    %MV_DS;
    %precisions = [precisions, prediction_accuracy];
    %dynamic_L;
    random_dynamic_L;

end

sum(sum(original_responses - responses)) 

% copy the for loop above and paste below it to run on the same random
% initialisation on new_L, remember to comment out either dynamic_L or
% random_dynamic_L

toc