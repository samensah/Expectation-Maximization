clear all
clc
format long

load responses
load frac_responses

% change these parameters
responses = responses'; % transpose responses
classes = [1,2,3]; %the labels/classes
iter = 0;
tol=0.00001; 
max_iter=100;


[ items, users, classes, counts ] = responses_to_counts( responses, classes );

converged = false;
old_class_marginals = [];
old_error_rates = [];

[item_classes, nUsers, nClasses, nItems]  = initialize( counts );

while ~converged
    iter = iter + 1;
    disp(iter);
    %M-Step
    [ class_marginals, error_rates ] = mStep( counts, item_classes );
    %E-Step
    item_classes = e_step(counts, class_marginals, error_rates);
    % check likelihood
    log_L = calc_likelihood(counts, class_marginals, error_rates);


    if ~isempty(old_class_marginals)
         class_marginals_diff = sum(abs(class_marginals - old_class_marginals));
         error_rates_diff = sum(sum(sum(abs(error_rates - old_error_rates))));

         if (class_marginals_diff < tol && error_rates_diff < tol) || iter > max_iter      
            converged = true;
         end
    else

    end
    % update current values
    old_class_marginals = class_marginals;
    old_error_rates = error_rates;
        
end

