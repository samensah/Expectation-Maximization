function [ items, users, classes, counts ] = responses_to_counts( responses, classes )
% This counts the number of a specific response for each user on each item.
% No responses by user on a specific row produces a zero row for that item

%classes is a vector of the labels
% No of rows represent the number of items
[nItems, nUsers] = size(responses);
items = 1:1:nItems;
nClasses = length(classes);
users = 1:1:nUsers;
% m user rows, n classes for each item
counts = zeros(nUsers, nClasses, nItems);

for i = 1:1:nItems
    for u = 1:1:nUsers;
        j = find(classes == responses(i,u));
        counts(u, j, i) = counts(u, j, i) + 1;  
    end

end

end

