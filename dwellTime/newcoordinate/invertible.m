function M = invertible(A)

    n = size(A, 1);
    M = zeros(n, n);
    r = n; % affinchè sia invertibile, la matrice deve avere rango pieno
    E = eye(n); % matrice di vettori canonici
    
    M = A;
    for i = 1:n
        
        if(rank([M, E(:, i)]) ~= rank(M))
            M = [M, E(:, i)];
            if(rank(M) == n)
                break;
            end
        end
    end
         

end