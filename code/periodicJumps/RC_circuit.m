function info = RC_circuit(x, tau_m, t, k)

 load dataSystem.mat

 x_system = x(1:3);
 
 x1 = x_system(1);
 x2 = x_system(2);
 x3 = x_system(3);

 %keyboard;
 
 
 %u1 = u(1);
 %u2 = u(2);
 w0 = x(4:5);

 a = A(1, 1);
 b = A(2, 2);
 c = A(3, 3);

 %keyboard;

% Integra le equazioni differenziali per w per ottenere il valore di w all'istante t
if(t ==0) 
    w_at_t = zeros(2, 1);
else
    [~, w_values] = ode23(@(t, w)exoSystem(S, w, t), [0 1], w0);
    %w_at_t = w_values(end, :)';
    w_at_t = w0;
end

% Ottieni l'ultimo valore di w calcolato
 
 u = outputRegulation(A, B, C, S, Q, tau_m, t - k*tau_m, w_at_t);

 dxdt = A*x_system + B*u;
%  dxdt1 = -a*x1 + a*u1;
%  dxdt2 = -b*x2 + b*u2;
%  dxdt3 = -c*x3 + c*u2;
 dwdt = exoSystem(S, w0, t);

 
 

 info = [dxdt;dwdt;u];


end