function [ item_classes, nUsers, nClasses, nItems ] = initialize( counts )
%UNTITLED3 initialize EM aalgorithm using the counts of responses (MajorityVote)
%   Detailed explanation goes here
[nUsers, nClasses, nItems] = size(counts);
response_sum_mat = sum(counts);

response_sum = [];
for i=1:1:nItems
    response_sum = [response_sum; response_sum_mat(:,:,i)];
end

item_classes = zeros(nItems, nClasses);
for i=1:1:nItems
   item_classes(i,:) =  response_sum(i,:)./ sum(response_sum(i,:));
end

