% initialise the zero L matrix with a user/ fixed number of user labels
%to a task randomly to form an L matrix from the original matrix

[nItems, nUsers] = size(original_responses);
new_L = zeros(nItems, nUsers);
nrand_users = n_random_users;

for i = 1:1:nItems
   [rId, cId] = find(original_responses(i,:) - new_L(i,:));
   perm_users = cId(randperm(length(cId)));
   
   if nrand_users > length(perm_users)
       nrand_users = length(perm_users);
   end
   
   for nru = 1:1:nrand_users
       rand_label = perm_users(nru);
       new_L(i, rand_label) = original_responses(i, rand_label);
   end
   nrand_users = n_random_users;
end
