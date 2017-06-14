% Create an L matrix by rank, selecting a set batch at a time.
new_batch = batch;

for id = 1:1:nItems
    [rId, cId] = find(original_responses(id,:) - responses(id,:));
    len_cId = length(cId);
    if new_batch > len_cId
       new_batch = len_cId;
    end
    
    count = 0;
    for u =1:1:length(ranked_users)
        if ismember(ranked_users(u), cId)
            responses(id, ranked_users(u)) = original_responses(id, ranked_users(u));
            count = count + 1;
            if count == new_batch
                break;
            end

        end
    end
    new_batch = batch;
        
    
end

