function [ error_rates ] = Init_error_rates(counts, item_classes, nUsers, nClasses)
%Initialize Error Rates
%   Detailed explanation goes here
error_rates = zeros(nClasses, nClasses, nUsers);

for k = 1:1:nUsers
    for j = 1:1:nClasses
        for l = 1:1:nClasses
            restruct = reshape(counts(k,l,:), [1, length(counts(k,l,:))]);
            error_rates(j, l, k) = dot(item_classes(:,j), restruct);
        end
        % normalize by summing over all observation classes
        sum_over_responses = sum(error_rates(j,:,k));
        if sum_over_responses > 0
            error_rates(j,:,k) = error_rates(j,:,k)/sum_over_responses;
        end
    end
    
    
end


end

