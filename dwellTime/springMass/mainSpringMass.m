clc
clear 
close all


load invariantSubspace.mat
load spring_mass.mat 

t_end = 11; %s

% they must have the same dimension
instantOfJump = [1, 1.5, 3, 7, 9, 10];
numberOfJumps = [1, 2, 1, 1, 2, 1];




l = size(instantOfJump, 2);
 

%keyboard;
ts = 0;
i = 1;
u = [0; 0];



x0 = N_star(:, 7) + N_star(:, 8);
%x0 = rand(10, 1);
% orovare a cambiare la matrice dinamica
x_ext_history = x0;
time_history = [];

x_jumps_value = [];
while i < l + 1
    
    
    if(ts == instantOfJump(i))
        % jump
        appoggio = x_ext_history(:, end);
        for j = 1:numberOfJumps(i)
            % u_d = K_d*T*appoggio;
            u_d = 0;
            x_ext = E_bar*appoggio + F_bar*u_d;
            appoggio = x_ext;
            ts = instantOfJump(i);
            
        end
        time_history = [time_history, ts];
        x_ext_history = [x_ext_history, appoggio];
        x_jumps_value = [x_jumps_value, x_ext ];
        %time_history = [time_history(1:end-1)];
        time_history = [time_history(1:end-1), ts];
        i = i+1;
    else
        % flow 
        
        tspan = [ts, instantOfJump(i)];
        [time, info] = ode23(@(t, x_total)springMassDynamics(A_bar, B_bar,T, x_total, t), tspan, x_ext_history(:, end));
        x_ext_history = [x_ext_history(:,1:end-1), info'];
        time_history = [time_history(1:end-1), time'];
        ts = time(end);
    end
   
    
end

% last step of flow dynamic

tspan = [ts, t_end];
[time, info] = ode23(@(t, x_total)springMassDynamics(A_bar, B_bar,T, x_total, t), tspan, x_ext_history(:, end));
x_ext_history = [x_ext_history(:,1:end-1), info'];

time_history = [time_history(1:end-1), time'];


figure(1);
title('Plant dynamics');


e = C_bar*x_ext_history;
graphs(time_history, x_ext_history, e, t_end);









