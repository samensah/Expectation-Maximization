% Create an L matrix randomly, selecting a set batch at a time.
new_batch = batch;

for id = 1:1:nItems
   [rId, cId] = find(original_responses(id,:) - responses(id,:));
   len_cId = length(cId);
   if new_batch > len_cId
       new_batch = len_cId;
   end
   random_cId = cId(randperm(len_cId));
    for ibx = 1:1:new_batch
           if len_cId ~= 0
               rand_user = random_cId(ibx);
               responses(id, rand_user) = original_responses(id, rand_user);
           end
    end
    new_batch = batch;

end

