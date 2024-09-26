function G = gramian(delta)
    load example6_2_2.mat A_tilde_fin B_tilde
    A22 = A_tilde_fin(4:5, 4:5);
    B21 = B_tilde(4:5, 1);
    
    integranda = @(tau) expm(A22*(delta - tau))*(B21*B21')*expm(A22'*(delta - tau));
    G = integral(integranda, 0, delta, 'ArrayValued', true, 'RelTol', 1e-10, 'AbsTol', 1e-12);
end