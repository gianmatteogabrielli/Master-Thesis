function M = invariantSubspaceAlgorithm(A_bar, B_bar, E_bar, F_bar, C_bar, n, q, dwell_time)

    %matlab lo calcola male


    ker_C_bar = null(C_bar, 'rational');
        
    %keyboard;

    %ker_C_bar = simpleRepresentation(null(C_bar));
    max_iterations = size(ker_C_bar, 2);
    switch(dwell_time)
        case 0
        %keyboard;
        M1 = A_star(E_bar, F_bar, ker_C_bar);
        l = A_star(A_bar, B_bar, ker_C_bar);
        for i = 1:max_iterations
            
            M2 = A_star(A_bar, B_bar, M1);
            if(size(M1, 2) == size(M2, 2) || (size(M1, 2) == 0 & size(M2, 2) == 0))
                break

            else
                M1 = A_star(E_bar, F_bar, M2);
            end

            % if(rank([M1, M2]) == rank(M1))
            %     break;
            % end
            %M1 = A_star(E_bar, F_bar, M2);
    
        end
        case 1
            M1 = A_operator(E_bar, F_bar, ker_C_bar);
            M2 = A_star(A_bar, B_bar, M1);
        case 2
            M2 = A_star(A_bar, B_bar, ker_C_bar);
    end

    
    M = M2;
    sprintf('Invariant subspace dimension: ', num2str(size(M, 2)));
end