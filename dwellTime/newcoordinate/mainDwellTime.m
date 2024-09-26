clc
clear
close all
load example6_2_2_nc.mat



% tk instante di salto
% deve valere che t_{k+1} - t_k >= delta, con delta fissato

% IDEA: faccio saltare ad tempo random che parte da tk+delta secondi

t_end = 50; %s

delta = 3; %s
amplitude = 1;

% devo decidere solo il primo salto;

firstJump = 1; %s



x0 = rand(6, 1);
x_ext_history = x0;
time_history = [];
u_d = [0;0];
u = [0;0];
eps = 0.1;

ts = 0;
%keyboard;

while (abs(ts - t_end) >= delta)



    % bisogna dividere in flow, jump e dwell time
    disp(abs(ts - t_end));
    istantOfJump = ts + delta + amplitude*rand;
    tspan = [ts, istantOfJump];
    
    % dwell time
    [time, info] = ode23(@(t, x_total)extendedLinearSystem(x_total, t), tspan, x_ext_history(:, end));
    x_ext_history = [x_ext_history(:,1:end-1), info'];
    time_history = [time_history(1:end-1), time'];
    ts = time(end);
    
    % jump
    
    %u_d = K_d*T*x_ext_history(:, end);
    x_ext = E_bar*x_ext_history(:, end) + F_bar*u_d;
    time_history = [time_history, ts];
    x_ext_history = [x_ext_history, x_ext];
    
   
end





% last step of flow dynamic
tspan = [ts, t_end];
[time, info] = ode23(@(t, x_total)extendedLinearSystem(x_total, t), tspan, x_ext_history(:, end));
x_ext_history = [x_ext_history(:,1:end-1), info'];

time_history = [time_history(1:end-1), time'];




x = [x_ext_history(1, :);x_ext_history(2, :)];
w = [x_ext_history(3, :)];

e = x(2, :) - w;

figure(1);
title('Plant dynamics');

%  x1
subplot(4,1,1);
plot(time_history, x_ext_history(1, :), 'k');
ylabel('x_{1}');
xlabel('time (s)');
xlim([0, t_end-1]);
grid on

%  x2
subplot(4,1,2);
plot(time_history, x_ext_history(2, :), 'k');
ylabel('x_{2}');
xlabel('time (s)');
xlim([0, t_end-1]);
grid on


subplot(4,1,3);
plot(time_history, x_ext_history(3, :), 'k');
ylabel('x_{3}');
xlabel('time (s)');
xlim([0, t_end-1]);
grid on


subplot(4,1,4);
plot(time_history, x_ext_history(4, :), 'k');
ylabel('x_{4}');
xlabel('time (s)');
xlim([0, t_end-1]);
grid on




figure(2)

plot(time_history, e, 'k');
ylabel('e');
xlabel('time(s)')
title('Error dynamics');

xlim([0, t_end]);
grid on



figure(3)

hold on
plot(time_history,x(2, :), 'b');
plot(time_history,w, 'r');
xlabel('time(s)')
xlim([0, t_end]);
grid on
title('x_{3} (t) and w_{1}(t)');









 
