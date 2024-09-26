function x_ext_dot = example_dyn_extended(x_ext, t, A_bar, B_bar)

    
% COUNTEREXAMPLE1
    Gamma = 1;
    Omega_t = [1, 0, 0];
    u = Gamma*Omega_t*x_ext(3:5);

% COUNTEREXAMPLE2
    % Gamma = [0, 1];
    % %Omega_t = [0, 1, 0, 0;0, 0, 0, 1];
    % Omega_t = [1, 0, 0, 0;0, 1, 0, 0];
    
    
    
    % u = Gamma*Omega_t*x_ext(2:5);
    %u = Gamma*Omega_t*x_ext(3:6);

    % COUNTEREXAMPLE3
    % K = [0, -1, 0];
    % u = K*x_ext;
    x_ext_dot = A_bar*x_ext + B_bar*u;

end
