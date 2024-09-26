function dxdt = springMassDynamics(A_bar, B_bar,T, x_ext, t)

    K_tilde =[-0.5, 0, 0, 0, 0, 0, -0.5000, 0, 0, 0;
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

   
    u = K_tilde*T*x_ext;
    dxdt = A_bar*x_ext + B_bar*u;


end