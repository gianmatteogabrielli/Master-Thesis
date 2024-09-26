%% ------------------COSTRUZIONE ESOSISTEMA -------------------%%


clc
clear
close all


t0 = 0;
t_end = 15;
w0 = rand(4, 1);

[time, w] = ode23(@(t, w)example_dyn_exo(w, t), [t0 t_end], w0);
w_discrete = [w0];
J = [1, 2, 2, 0;
     -1, -1, -1, 0;
      0, 1, 0, 1;
      0, 1, -1, 0];

iterations = 100;
for(i = 2:iterations-1)
    w_discrete(:, i) = J*w_discrete(:, i-1);

end

figure(2)
plot([1:1:iterations-1], w_discrete(4, :));



%% PROBLEMA DI REGOLAZIONE 



clc
clear
close all




t0 = 0;
t_end = 30;
w0 = [0, 0, 0, 1]';
x0_ext = [0;0;w0];
w_discrete = [w0];
[time, x_final] = ode23(@(t, x_ext)example_dyn_extended(x_ext, t), [t0 t_end], x0_ext);
e = [1, 1, -1, -1, 0, 0]*x_final';
figure(1)
plot(time, e);
ylim([-1, 1]);






