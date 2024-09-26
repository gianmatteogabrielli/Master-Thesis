function eqns = cartesianRepresentation(A, rk)
    % Inizializza la matrice ridotta
    R = A;
    [m, n] = size(R);

    % Inizializza l'array dei pivot
    pivot = zeros(1, n);

    % Per ogni colonna, riduci a scala
    colonna_pivot = 1;
    for colonna = 1:n
        % Trova il pivot nella colonna corrente
        riga_pivot = find(R(colonna_pivot:m, colonna), 1) + colonna_pivot - 1;
        if ~isempty(riga_pivot)
            % Scambia le righe per mettere il pivot sulla diagonale
            R([colonna_pivot, riga_pivot], :) = R([riga_pivot, colonna_pivot], :);

            % Normalizza la riga pivot
            if(colonna < n)
                R(colonna_pivot, :) = R(colonna_pivot, :) / R(colonna_pivot, colonna);
            end
            % Azzera gli elementi sotto il pivot
            for riga = colonna_pivot+1:m
                R(riga, :) = R(riga, :) - R(riga, colonna) * R(colonna_pivot, :);
            end

            % Memorizza il pivot
            pivot(colonna) = colonna_pivot;

            % Passa alla prossima colonna pivot
            colonna_pivot = colonna_pivot + 1;
        end

        % Se abbiamo esaurito le righe o le colonne, esci
        if colonna_pivot > m || colonna_pivot > n
            break;
        end
    end

    keyboard;

    for i = 1:m-rk
        eqns(i) = R(end+1 -i,end)==0;
    
    end

    


end
