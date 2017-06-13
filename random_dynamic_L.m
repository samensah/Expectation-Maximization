
for id = 1:1:nItems
    [rId, cId] = find(original_responses(id,:) - responses(id,:));
    len_cId = length(cId);
        if len_cId ~= 0
            rand_user = cId(randi(len_cId));
            responses(id, rand_user) = original_responses(id, rand_user);
        end
end

