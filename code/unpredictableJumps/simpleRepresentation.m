function M = simpleRepresentation(A)
    n = size(A, 1);
    m = size(A, 2);
    M = zeros(n, m);
    for i = 1:n
        for j = 1:m
            if (A(i, j) > 0.5)
                M(i, j) = 1;
            elseif(A(i, j) < -0.5)
                M(i, j) = -1;
            else
                M(i, j) = 0;
            end
        end
    end

end
