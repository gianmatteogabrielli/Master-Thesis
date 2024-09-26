

%% ------------------------ COUNTEREXAMPLE 2 ---------------------------------------------------------%%
 
clc
clear
close all

load counterExampleTwo.mat
w0 = [1, 0, 0, 0]';
x0 = [1;w0];
%% ------------------------ COUNTEREXAMPLE 3 ---------------------------------------------------------%%
clc
clear 
close all

load counterExample3.mat

w0 = 1;
x0 = [1;1;w0];
%% ----------------------------------------------------------------------------------------------------%%
%% ------------------------ COUNTEREXAMPLE 1 ---------------------------------------------------------%%
 
clc
clear
close all

load counterExample1.mat
w0 = [1, 0, 0]';
x0 = [1;0;w0];

t_end = 31;
instantOfJump = [5, 10, 15, 20, 25];
l = size(instantOfJump, 2);


%keyboard;
ts = 0;
i = 1;
%w0 = [1, 0, 0, 0]';
%x0 = [1;w0];

x_ext_history = x0;
time_history = [];

x_jumps_value = [];
while i < l + 1
    
    
    if(ts == instantOfJump(i))
        % jump
        appoggio = x_ext_history(:, end);
        x_ext = E_bar*appoggio;
        appoggio = x_ext;
        ts = instantOfJump(i);
        time_history = [time_history, ts];
        x_ext_history = [x_ext_history, appoggio];
        %time_history = [time_history(1:end-1)];
        time_history = [time_history(1:end-1), ts];
        i = i+1;
    else
        % flow 
        tspan = [ts, instantOfJump(i)];
        [time, info] = ode23(@(t, x_total)example_dyn_extended(x_total, t, A_bar, B_bar), tspan, x_ext_history(:, end));
        x_ext_history = [x_ext_history(:,1:end-1), info'];
        time_history = [time_history(1:end-1), time'];
        ts = time(end);
    end
   
    
end

% last step of flow dynamic

tspan = [ts, t_end];
[time, info] = ode23(@(t, x_total)example_dyn_extended(x_total, t,A_bar, B_bar), tspan, x_ext_history(:, end));
x_ext_history = [x_ext_history(:,1:end-1), info'];

time_history = [time_history(1:end-1), time'];



e = C_bar*x_ext_history;
subplot(2, 1, 1)
hold on
plot(time_history, x_ext_history(1, :), 'LineWidth', 2, 'Color','k');
plot(time_history, x_ext_history(end, :), 'k', 'LineWidth',2, 'LineStyle', '--');
xlabel('time (s)', 'FontSize',22);
ylabel('x, w', 'FontSize',22);
xlim([0 t_end]);
grid on
set(gca, 'FontSize', 22);

figure(2)
plot(time_history, e, 'LineWidth', 2, 'Color','k');
xlabel('time (s)', 'FontSize',22);
ylabel('e', 'FontSize',22);
grid on
xlim([0, t_end]);

set(gca, 'FontSize', 22);
