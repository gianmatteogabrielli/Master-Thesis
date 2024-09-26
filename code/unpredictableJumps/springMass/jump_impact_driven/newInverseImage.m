function inverse_I = newInverseImage(A, V)
    inverse_I = [];
    n = size(A, 2); 
    % in questo caso dobbiamo supporre che la matrice A abbia rango pieno.
    if(det(A) ~= 0)
        inverse_I = inv(A)*V;  
    else
    %     % creo un sistema
    % 
    %     for i = 1:n
    %         appoggio = ['x', num2str(i)];
    %         var_names(i) = sym(appoggio);
    %     end
    %     v = var_names.';
    %     %keyboard;
    %     for i = 1:size(V, 2)
    % 
    %         eqns = A*v == V(:, i);
    %         res = solve(eqns, var_names);
    %         x = fieldnames(res);
    %         vector = zeros(n, 1);
    %         for j = 1:size(V, 1)
    %             if(isempty(res.(x{1})))
    %                 vector = [];
    %                 break;
    %             else
    %                 % modifica: prima c'era la i
    %                 vector(j) = res.(x{j});
    %             end
    % 
    %         end
    % 
    %         if(rank([inverse_I, vector]) ~= rank(inverse_I))
    %             inverse_I = [inverse_I, vector];
    %         end
    % 
    % 
    %     end
    % 
    % end
    appoggio = V';
    V_perp = null(appoggio, 'rational');
    appoggio = (transpose(A)*V_perp)';
    inverse_I = null(appoggio, 'rational');
    

    

end