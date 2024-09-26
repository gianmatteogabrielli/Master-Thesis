clc
clear
close all
load dataSystem.mat

tau_m = 1;
t_end = 15; %s

spans = t_end/tau_m;

x_history = [];
time_plot = [];
error_history = [];
u_history = [];

x_d = [1; -1; 1];
w_d = [1; 0];
u = [0;0];

for k = 0:spans-1
    disp(k);
    tspan = [k*tau_m, (k+1)*tau_m];
    [time, info] = ode23(@(t, x_total)RC_circuit(x_total, tau_m, t, k), tspan, [x_d; w_d;u]);
    x_flow = info(:, 1:3);  % Stato principale
    w_flow = info(:, 4:5);  % Esosistema
    u_flow = info(:, 6:end);
    %keyboard;
    error_flow = x_flow(:, 3) - w_flow(:,1);
    x_d = E*x_flow(end, :)';
    w_d = J*w_flow(end, :)';
    %u = u_flow(end, :)';
    x_history = [x_history, x_flow'];
    error_history = [error_history; error_flow];
    u_history = [u_history; u_flow];
    time_plot = [time_plot; time];

end


%% GRAFICI

figure;
title('Plant dynamics');

%  x1
subplot(3,1,1);
plot(time_plot, x_history(1, :), 'k','LineWidth',2);
ylabel('x_{1}');
xlabel('time (s)');
grid on
set(gca, 'FontSize', 22); % Aumenta la dimensione del carattere sui numeri degli assi

%  x2
subplot(3,1,2);
plot(time_plot, x_history(2, :), 'k', 'LineWidth',2);
ylabel('x_{2}');
xlabel('time (s)');
grid on
set(gca, 'FontSize', 22); % Aumenta la dimensione del carattere sui numeri degli assi

%  x3
subplot(3,1,3);
plot(time_plot, x_history(3, :), 'k', 'LineWidth',2);
ylabel('x_{3}');
xlabel('time (s)');
grid on
set(gca, 'FontSize', 22); % Aumenta la dimensione del carattere sui numeri degli assi

figure(2)
title('Time history of e(t, k)','FontSize', 22);
plot(time_plot, error_history, 'k', 'LineWidth',2);
ylabel('e');
xlabel('time(s)');
grid on
set(gca, 'FontSize', 22); % Aumenta la dimensione del carattere sui numeri degli assi

figure(3)
title('Control');
plot(time_plot, u_history(:, 1), 'LineWidth', 2, 'Color','k'); % Prima componente con linea continua nera
hold on; % Mantieni il grafico corrente per aggiungere un'altra curva
plot(time_plot, u_history(:, 2), 'LineWidth', 2, 'Color','k', 'LineStyle', '--'); % Seconda componente con linea tratteggiata nera
hold off;
%legend('u_1(t, k)', 'u_2(t, k)', 'FontSize', 22);
ylabel('u_{1}, u_{2}');
xlabel('time(s)');
grid on
set(gca, 'FontSize', 22); % Aumenta la dimensione del carattere sui numeri degli assi





figure(4);
    subplot(3, 3, [1, 2]);
    plot(time_plot, x_history(1,:),'LineWidth', 2, 'Color','k');
    legend('State x_{1}(t, k)', 'FontSize', 22);
    grid on;
    set(gca, 'FontSize', 22);

    subplot(3,3,[4, 5]);
    plot(time_plot, x_history(2,:),'LineWidth', 2, 'Color','k');
    legend('State x_{2}(t, k)', 'FontSize', 22);
    grid on;
    set(gca, 'FontSize', 22);

    subplot(3,3,[7, 8]);
    plot(time_plot, x_history(3,:),'LineWidth', 2, 'Color','k');
    legend('State x_{3}(t, k)', 'FontSize', 22);
    set(gca, 'FontSize', 22);
    grid on;
    
    subplot(3, 3, [3;6;9])
    plot(time_plot, error_history,'LineWidth', 2, 'Color','k');
    legend('Error e(t, k)', 'FontSize', 22);
    grid on;
    set(gca, 'FontSize', 22);
 % figure(2);
 %    subplot(2, 2, 1);
 %    plot(phase.RealTime, trajDes, phase.RealTime, xx4, phase.RealTime, xx1, 'LineWidth', 1);
 %    legend('Desired Position', 'Estimated Position', 'System Position');
 %    grid on;
 % 
 %    subplot(2,2,3);
 %    plot( phase.RealTime, trajDes_dot,  phase.RealTime, xx5, phase.RealTime, xx2, 'LineWidth', 1);
 %    legend('Desired Velocity', 'Estimated Velocity', 'System Velocity');
 %    grid on;
 % 
 %    subplot(2,2,[2,4]);
 %    plot( phase.RealTime, uu1, 'LineWidth', 1);
 %    legend('Control');
 %    grid on;
