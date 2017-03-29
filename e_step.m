function item_classes = e_step(counts, class_marginals, error_rates)
%Expectation Step
% 
[nUsers, nClasses, nItems] = size(counts);
item_classes = zeros(nItems, nClasses); 



for i =1:1:nItems
    for j=1:1:nClasses
        estimate = class_marginals(j);
        restruct_error_rates = reshape(error_rates(j,:,:), [nClasses, nUsers])';
        estimate = estimate * prod(prod(restruct_error_rates.^counts(:,:,i)));

        item_classes(i,j) = estimate;

        %normalize error rates by dividing by the sum over all observation classes
    end
    item_sum = sum(item_classes(i,:));
    if item_sum > 0
        item_classes(i,:) = item_classes(i,:)/item_sum;
    end
    
end

end

