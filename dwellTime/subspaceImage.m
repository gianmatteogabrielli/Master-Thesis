function I = subspaceImage(V)

    n = rank(V);
    I = [];
    index = 1;
    for i = 1:size(V, 2)
        if(rank([I, V(:, i)]) ~= rank(I))
            I = [I, V(:, i)];
            if(index == n)
                break;
            else
                index = index + 1;
            end
                
        end
    end

end