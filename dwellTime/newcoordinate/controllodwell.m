function u1 = controllodwell(t0, t, delta,x0, invG)
    load example6_2_2.mat A_tilde_fin B_tilde T
    
    A22 = A_tilde_fin(4:5, 4:5);
    B21 = B_tilde(4:5, 1);
    
    
    
    z0 = T*x0;
    
    z20 = z0(4:5);
    v = -invG*expm(A22*delta)*z20;
    
    % Definisci la funzione anonima per l'integrale
    u1_function = @(t, t0) B21'*expm(A22'*(t - t0))*v;

    
    % Definisci la funzione anonima per il controllo u1
    u1 = u1_function(t, t0);
    
    % Calcola e restituisci il valore di u1
end
