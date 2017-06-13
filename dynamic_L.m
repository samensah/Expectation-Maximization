
for id = 1:1:nItems
    [rId, cId] = find(original_responses(id,:) - responses(id,:));
    
    for u =1:1:length(ranked_users)
        if ismember(ranked_users(u), cId)
            responses(id, u) = original_responses(id,u);
            break;
        end
        
    end
end

