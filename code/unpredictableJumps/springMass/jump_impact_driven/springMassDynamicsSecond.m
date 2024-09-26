function dxdt = springMassDynamicsSecond(A_bar, B_bar, K, x_ext, t)
    % Matrice K_tilde per il controllo k1:0.5
    % K_tilde = [-0.5, 0, 0, 0, 0, 0, -0.5000, 0, 0, 0;
    %             0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    
    %Matrice K_tilde per il controllo k1:2
    % K_tilde = [-2, 0, 0, 0, 0, 0, 1, 0, 0, 0;
    %             0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    
    %Matrice K_tilde per il controllo k1:12
    
    % Calcolo del controllo
    
    u = K * x_ext;
    
    % Dinamiche del sistema
    dxdt = A_bar * x_ext + B_bar * u;
end
