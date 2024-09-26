function M = A_star(A_bar, B_bar, V)

    max = size(V, 2);
    S = subspaceImage(V);   %S = ker([C Q])
    N = S;  %N_0 = S
    N1 = [];
    for k = 1:max
        N1 = A_operator(A_bar, B_bar, N);
        if(size(N1, 2) ~= size(N, 2))
            N = N1;
        else
            % modifica fatta: prima c'era subspaceImage
            if(rank([N1, N]) == rank(N1))
                break;
            end
        end
    end
    M = N1;


end