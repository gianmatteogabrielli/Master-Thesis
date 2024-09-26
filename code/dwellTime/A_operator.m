function N = A_operator(A_m, B_m, V)
    
    
    d = size(V, 2); % vettore che compongono una base di V
    imB = subspaceImage(B_m);
    inverse = inverseImage(A_m, [V, imB]); %marro
    %keyboard;
    V_image = subspaceImage(V);
    inverse_image = subspaceImage(inverse);
    %keyboard;
    % va fatta realmente l'im? perchè l algoritmo dice:    V inter (V + im(B))
    [intersection, no_intersection] = intersectionOperator(V_image, inverse_image);
    N = intersection;
    
end