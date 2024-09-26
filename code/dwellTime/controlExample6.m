function u = controlExample6(caseOfControl, x, delta, t0, time_samples)
    load example6_2_2.mat A_tilde_fin B_tilde K1 K2
    
    
    
    switch(caseOfControl)
        case 0 %dwell
            
            % DEVO PRIMA CANCELLARE L ULTIMA COMPONENTE DELLA MATRICE A_BAR
            % PER GARANTIRMI UNA INVARIANZA RISPETTO AL FLOW
%             keyboard;
%             tfin = t + delta;
%             
%             A22 = A_tilde_fin(4:5, 4:5);
%             B21 = B_tilde(4:5, 1);
%             integranda = @(tau) expm(A22*(tfin - tau))*(B21*B21')*expm(A22'*(tfin - tau));
%             % gramian
%             options = odeset('RelTol',1e-10,'AbsTol',1e-12);
%             G = integral(integranda, t, tfin, 'ArrayValued', true, 'RelTol', 1e-10, 'AbsTol', 1e-12);
%             z = T*x;
%             z20 = z(4:5);
%             v = -inv(G)*expm(A22*delta)*z20;
% 
%             
%             
%             u1 = @(t0, t) integral(@(tau) u1_integral(tau, t), t0, t, 'ArrayValued', true) * v;
%             u2 = 0;
%             K1 = K_tilde*T;
%             K2 = K2_tilde*T;
            A22 = A_tilde_fin(4:5, 4:5);
            B21 = B_tilde(4:5, 1);
            

            % da notare come questo non sia il controllo totale, ma solo la
            % parte dipendente dal tempo. Quindi non sarà uno scalare, ma
            % un vettore!
            time_interval = linspace(t0, delta, time_samples);
            u1_function = @(tau) B21'*expm(A22'*(delta - tau));
            u1_cell = arrayfun(u1_function, time_interval, 'UniformOutput', false);
            u1 = cell2mat(u1_cell');
            u = u1;

        case 1 %flow

            %keyboard;
            
            u = (K1 + K2)*x;

            
            
        case 2 %jump
            %keyboard;
            u = [0;0];
           
    end



end
