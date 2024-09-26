function e = canonicalSpan(M)
    
    n = size(M, 1);
    m = size(M, 2);
    counter = 0;
    index = [];
    for i = 1:n
        if(M(i, :) ~= 0)
            counter = counter + 1;      % mi dice quanti vettori canonici ci devono essere
            index = [index, i];
        end
    end
    e = zeros(n, counter);

    for i = 1:counter
        for j = 1:n
            if (j == index(i))
                e(j, i) = 1;
            end
        end
        
    end


