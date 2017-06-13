% EM Parameters 
clc
format long
tic

%load frac_responses
%load web_processed_data
%load movie_review
load weather_data

% change these parameters
original_responses = L;  % L matrix
true_labels = true_labels;
classes = [1,2,3,4,5]; %the labels/classes
nusers_task = 20; %number of users to a task
n_random_users = 2; %number of random users for random_init_dynamic

iter = 0;
max_iter=100;

precisions = [];

% dynamic algorithm to select users
random_init_dynamic; % random initialisation of users

responses = new_L;  %from random_init_dynamic
for ix=1:1:nusers_task 
    EM;
    precisions = [precisions, prediction_accuracy];
    %dynamic_L;
    random_dynamic_L;
end

% copy the for loop above and paste below it to run on the same random
% initialisation on new_L, remember to comment out either dynamic_L or
% random_dynamic_L

toc