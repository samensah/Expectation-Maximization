function [ class_marginals, initerror_rates ] = mStep( counts, item_classes )
%EM Algorithm, M-Step
%   Detailed explanation goes here

[nUsers, nClasses, nItems] = size(counts);
class_marginals = sum(item_classes)/nItems;

initerror_rates = Init_error_rates(counts, item_classes, nUsers, nClasses);

end

