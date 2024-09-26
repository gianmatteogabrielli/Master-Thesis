clc
clear 
close all


clc
clear
close all
load spring_mass.mat
load invariantSubspace.mat



% tk instante di salto
% deve valere che t_{k+1} - t_k >= delta, con delta fissato

% IDEA: faccio saltare ad tempo random che parte da tk+delta secondi

t_end = 25; %s
time_samples = 200;
delta = 0.5; %s
amplitude = 1;

% devo decidere solo il primo salto;

firstJump = 1; %s



x0 = Z_star(:,2)+ Z_star(:,1);
x_ext_history = x0;
time_history = [];
u_d = [0;0];
u = [0;0];
istantOfJump = firstJump;
jumps = firstJump;
c = 1;
t0 = 0;
ts = 0;
%keyboard;
% while (abs(ts - t_end) >= delta)
%     %keyboard;
% 
% 
%     % bisogna dividere in flow, jump e dwell time
%     disp(abs(ts - t_end));
%     
%     dwelltime = ts + delta;
%     istantOfJump = ts + delta + amplitude*rand;
%     
%     tspan = [ts, dwelltime];
%     
%     % dwell time: definire la legge di controllo in dwell time
%     u = controlExample6(0, x_ext_history(:, end), delta, ts);
%     [time, info] = ode23(@(t, x_total)extendedLinearSystem(x_total, t, u), tspan, x_ext_history(:, end));
%     x_ext_history = [x_ext_history(:,1:end-1), info'];
%     time_history = [time_history(1:end-1), time'];
%     ts = time(end);
%     tspan = [ts, istantOfJump];
%     
%     
%     % flow
%     u = controlExample6(1, x_ext_history(:, end), delta, ts);
%     [time, info] = ode23(@(t, x_total)extendedLinearSystem(x_total, t, u), tspan, x_ext_history(:, end));
%     x_ext_history = [x_ext_history(:,1:end-1), info'];
%     time_history = [time_history(1:end-1), time'];
%     ts = time(end);
% 
%     
%     % jump: definire la legge di controllo per il salto
%     u_d = controlExample6(2, x_ext_history(:, end), delta, ts);
%     %u_d = K_d*T*x_ext_history(:, end);
%     x_ext = E_bar*x_ext_history(:, end) + F_bar*u_d;
%     time_history = [time_history, ts];
%     x_ext_history = [x_ext_history, x_ext];
%     
%    
% end
G = gramian(delta);
invG = inv(G);
A22 = A_tilde_fin(4:5, 4:5);

% Set ODE solver options for tighter tolerances
options = odeset('RelTol',1e-6,'AbsTol',1e-9);
while (abs(ts - t_end) >= delta && t_end - ts > 0)
    %keyboard;
    disp(abs(ts - t_end));

    % FLOW: 
    
    fprintf('%d ° flow\n', c);
    tspan = [ts, istantOfJump];
    u = controlExample6(1, x_ext_history(:, end), delta, ts, time_samples);
    [time, info] = ode23(@(t, x_total)extendedLinearSystem(x_total, t, invG, A22, delta, u, 0, x_ext_history(:, end)), tspan, x_ext_history(:, end), options);
    x_ext_history = [x_ext_history(:,1:end-1), info'];
    time_history = [time_history(1:end-1), time'];
    ts = time(end);
    %z = T*x_ext_history(:, end)

    
    % JUMP: 
    
    fprintf('%d ° jump\n', c);
    u_d = controlExample6(2, x_ext_history(:, end), delta, ts, time_samples);
    x_ext = E_bar*x_ext_history(:, end) + F_bar*u_d;
    time_history = [time_history, ts];
    x_ext_history = [x_ext_history, x_ext];
    %z = T*x_ext_history(:, end)
    
    % DWELL TIME:
    
    dwelltime = ts + delta;
    istantOfJump = ts + delta + amplitude*rand;
    jumps = [jumps, istantOfJump];
    
    tspan = [ts, dwelltime];

    fprintf('%d ° dwell time interval\n', c);
    % dwell time: definire la legge di controllo in dwell time
    u1_nonfinal = controlExample6(0, x_ext_history(:, end), delta, t0, time_samples);
    time_interval = linspace(ts, dwelltime, time_samples);
    u_interpolated = @(t) interp1(time_interval, u1_nonfinal, t, 'linear');
    
    [time, info] = ode23(@(t, x_total)extendedLinearSystem(x_total, t, invG, A22, delta, u_interpolated, 1, x_ext), tspan, x_ext, options);
    x_ext_history = [x_ext_history(:,1:end-1), info'];
    %z = T*x_ext_history(:, end);
    time_history = [time_history(1:end-1), time']; 
    ts = time(end);
    c = c+1;
    
end

u = controlExample6(1, x_ext_history(:, end), delta, ts, time_samples);
% last step of flow dynamic
tspan = [ts, t_end];
[time, info] = ode23(@(t, x_total)extendedLinearSystem(x_total, t, invG, A22, delta, u, 0, x_ext_history(:, end)), tspan, x_ext_history(:, end), options);
x_ext_history = [x_ext_history(:,1:end-1), info'];

time_history = [time_history(1:end-1), time'];

e = C_bar*x_ext_history;
z = T*x_ext_history;

graphs(time_history, x_ext_history, e, t_end);



 
