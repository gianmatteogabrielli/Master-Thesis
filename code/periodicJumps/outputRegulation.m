function u = outputRegulation(A, B, C, S, Q, tau_m, sigma, w)

    load matrixComponents.mat
    
    

    % parte costante del controllo (heart of regulator)
    Pi_3c = -Q;
    Gamma_2c = 1/B32 * (A33*Q - Q*S);
    

    % definizione matrici -----------------------------------------------

    A0 = [A11, A12; 0, A22];

    tau_m = 1;
    A_tilde = [E11, E12; E21, E22]*expm(A0*tau_m);
    B_tilde = [E11; E21];
    C_tilde = [E31, E32]*expm(A0*tau_m);
    D_tilde = E31;
    S_tilde = J*expm(S*tau_m);

    P_hat = [A13; A23]*Pi_3c + [B12; B22]*Gamma_2c;
    
    % funzione integranda 
    
    % chiedere al prof se esiste un modo più veloce
    
    syms  p1 p2 p3 p4 g1 g2 
    integranda1 = @(tau) expm(A0 * (tau_m - tau))* P_hat* expm(S*tau);

    % Calcolo dell'integrale definito
    int1 = integral(integranda1, 0, tau_m, 'ArrayValued', true);

    %keyboard;

    P_tilde = [E13*Pi_3c; E23*Pi_3c]*expm(S*tau_m) + [E11, E12; E21, E22]*int1;
    Q_tilde = (E33*Pi_3c - Pi_3c*J)*expm(S*tau_m) + [E31, E32]*int1;

    % ------------------------------------------------------------------------------%
    ppi = [p1, p2; p3, p4];
    ggamma = [g1, g2];
    eqn1 = ppi*S_tilde == A_tilde*ppi + B_tilde*ggamma + P_tilde;
    
    eqn2(1, :) = C_tilde*ppi + D_tilde*ggamma + Q_tilde == zeros(1, 2);
    eqn2(2, :) = [0, 0];
    
    sol = solve([eqn1, eqn2], [p1, p2, p3, p4, g1, g2]);

    pi_tilde = [double(sol.p1), double(sol.p2); double(sol.p3), double(sol.p4)];
    Gamma1_tilde = [double(sol.g1), double(sol.g2)];
    
    
    %gramian_pre = expm(A11 * (tau_m - tau))* B11* B11' * expm(A11 * (tau_m - tau))';
    %gramian = int(gramian_pre, 0, tau_m);
    %keyboard;
    integranda = @(tau) expm(A11*(tau_m - tau))* B11* B11' * expm(A11*(tau_m - tau))';
    gramian = integral(integranda, 0, tau_m, 'ArrayValued', true);

    Gamma1v = B11'*expm(A11 * (tau_m - sigma))'*inv(gramian)*Gamma1_tilde*inv(expm(S*sigma));
    %keyboard;
    u1 = Gamma1v*w;
    u2 = Gamma_2c*w;
    


    u = [u1;u2];


end