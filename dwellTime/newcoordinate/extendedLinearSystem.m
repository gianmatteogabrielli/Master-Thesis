function x_ext_dot = extendedLinearSystem(x_ext, t, invG, A22, delta, u, dwell_case, xpj)
    load example6_2_2.mat K1 K2 A_bar B_bar inverse_T
    
    
    if(dwell_case)
        z = inverse_T*xpj;
        z20 = z(4:5);
        v = -invG*expm(A22*delta)*z20;
        u1 = u(t)*v;
        u2 = 0;
        u = [u1;u2]+(K1 + K2)*x_ext;
    else
        u = (K1 + K2)*x_ext;
    end
    
    x_ext_dot = A_bar*x_ext + B_bar*u;
    

end
