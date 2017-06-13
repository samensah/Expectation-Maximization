
[nItems, nUsers] = size(original_responses);
new_L = zeros(nItems, nUsers);


for i = 1:1:nItems
   [rId, cId] = find(original_responses(i,:) - new_L(i,:));
   choose_users = randperm(length(cId));
   for nru = 1:1:n_random_users
       rand_idx = choose_users(nru);
       rand_label = cId(rand_idx);
       new_L(i, rand_label) = original_responses(i, rand_label);
   end
end