function log_L = calc_likelihood(counts, class_marginals, error_rates)
%  Calculate the likelihood given the current parameter estimates


[nUsers, nClasses, nItems] = size(counts);
log_L = 0.0;

for i=1:1:nItems
   item_likelihood = 0.0;
   for j=1:1:nClasses  
        class_prior = class_marginals(j);
        restruct_error_rates = reshape(error_rates(j,:,:), [nClasses, nUsers])';
        item_class_likelihood = prod(prod(restruct_error_rates.^counts(:,:,i)));
        item_class_posterior = class_prior * item_class_likelihood;
        item_likelihood = item_likelihood + item_class_posterior;  
   end
   temp = log_L + log(item_likelihood);
   log_L = temp;
end




end

