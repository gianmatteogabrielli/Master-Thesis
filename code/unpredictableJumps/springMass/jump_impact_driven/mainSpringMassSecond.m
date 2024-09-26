% clc
% clear 
% close all
% 
% 
% load invariantSubspace.mat
% load spring_mass.mat 
% 
% t_end = 11; %s
% 
% % they must have the same dimension
% instantOfJump = [1, 1.5, 3, 7, 9, 10];
% numberOfJumps = [1, 2, 1, 1, 2, 1];
% 
% 
% 
% 
% l = size(instantOfJump, 2);
% 
% 
% %keyboard;
% ts = 0;
% i = 1;
% u = [0; 0];
% 
% 
% 
% %x0 = N_star(:, 7) + N_star(:, 8);
% x0 = [1, 1, 2, 0, 2.5, 0, 4, 0, 1, 1]'; % \in N_star
% %x0 = rand(10, 1);
% % orovare a cambiare la matrice dinamica
% x_ext_history = x0;
% time_history = [];
% 
% x_jumps_value = [];
% while i < l + 1
% 
% 
%     if(ts == instantOfJump(i))
%         % jump
%         appoggio = x_ext_history(:, end);
%         for j = 1:numberOfJumps(i)
%             % u_d = K_d*T*appoggio;
%             u_d = 0;
%             x_ext = E_bar*appoggio + F_bar*u_d;
%             appoggio = x_ext;
%             ts = instantOfJump(i);
% 
%         end
%         time_history = [time_history, ts];
%         x_ext_history = [x_ext_history, appoggio];
%         x_jumps_value = [x_jumps_value, x_ext ];
%         %time_history = [time_history(1:end-1)];
%         time_history = [time_history(1:end-1), ts];
%         i = i+1;
%     else
%         % flow 
% 
%         tspan = [ts, instantOfJump(i)];
%         [time, info] = ode23(@(t, x_total)springMassDynamics(A_bar, B_bar,T, x_total, t), tspan, x_ext_history(:, end));
%         x_ext_history = [x_ext_history(:,1:end-1), info'];
%         time_history = [time_history(1:end-1), time'];
%         ts = time(end);
%     end
% 
% 
% end
% 
% % last step of flow dynamic
% 
% tspan = [ts, t_end];
% [time, info] = ode23(@(t, x_total)springMassDynamics(A_bar, B_bar,T, x_total, t), tspan, x_ext_history(:, end));
% x_ext_history = [x_ext_history(:,1:end-1), info'];
% 
% time_history = [time_history(1:end-1), time'];


% figure(1);
% title('Plant dynamics');
% 
% 
% e = C_bar*x_ext_history;
%graphs(time_history, x_ext_history, e, t_end);


clc
clear all
close all

load invariantSubspace.mat
load spring_mass.mat 


ie = 0;
ts = 0;
t_end = 15;
delta = 0.1;
eps = 10e-2;
width = [cart2Width;cart3Width];
x0 = [1, 1, 2, 0, 1, 0, 6, 0, 1, 1]'; % \in N_star
x_ext_history = x0;
time_history = [0];
c = 0;
K_tilde = [-12, 0, 0, 0, 0, 0, 11, 0, 0, 0;
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
u_history = [0;0];
K = K_tilde * T;
while (abs(ts - t_end) >= delta && t_end - ts > 0)

    tspan = [ts, ts + delta];
    options = odeset('Events', @(t, x_ext) stop_event(t, x_ext, width), 'RelTol', 1e-12, 'AbsTol', 1e-12);    
    [t, x_ext, te, ye, ie] = ode23(@(t, x_ext) springMassDynamicsSecond(A_bar, B_bar, K, x_ext, t), tspan, x_ext_history(:, end), options);
    time_history = [time_history; t];
    u = K*x_ext';
    u_history = [u_history, u];
    ts = t(end);
    %c = size(x_ext_history, 2);
    x_ext_history = [x_ext_history, x_ext'];
    
    %disp(['distanza da destra ', num2str(abs((x_ext_history(5, c:end) + width(2)/2) - (x_ext_history(3, c:end) + width(1)/2)))]); 
    %disp([', distanza da sinistra ', num2str(abs((x_ext_history(5, c:end) - width(2)/2) - (x_ext_history(3, c:end) - width(1)/2)))]);
    %keyboard;
    if(ie ~= 0) % c' è stato il trigger event
        disp(['Event detected at time:', num2str(te)]);
        %keyboard;
        % numberOfJumps = randi(3);
        % x_k = x_ext_history(:, end);
        % appoggio = zeros(n+q, 1);
        % u_d = 0;
        % for i = 1:numberOfJumps
        %     x_k = E_bar*x_k + F_bar*u_d;
        % end
        u_d = 0;
        x_k = x_ext_history(:, end);
        x_k = E_bar*x_k + F_bar*u_d;
        x_ext_history = [x_ext_history, x_k];
        time_history = [time_history; ts];
        u_history = [u_history, zeros(2,1)];
        c = c+1;
    end
end
e = C_bar*x_ext_history;
graphs(time_history, x_ext_history, e, u_history, t_end, width);













function [value, isterminal, direction] = stop_event(t, x_ext, width)
    % Definisci la condizione per fermare l'integrazione
    % Ad esempio, fermare se la prima variabile supera una soglia
    %keyboard;
    threshold = 1e-20; % Definisci la soglia
    value = zeros(2, 1);
    
    % Controllo degli indici per evitare errori
    if length(x_ext) >= 5 && length(width) >= 2
        % Distanza a destra
        value(1) = (x_ext(5) + width(2)/2) - (x_ext(3) + width(1)/2) - threshold;
        % Distanza a sinistra
        value(2) = (x_ext(5) - width(2)/2) - (x_ext(3) - width(1)/2) - threshold;
    else
        % Se gli indici non sono validi, assegna valori grandi a value
        value(1) = 1e6; % Un valore grande per evitare l'attivazione accidentale
        value(2) = 1e6;
    end

    % Ferma l'integrazione quando uno dei valori raggiunge zero
    isterminal = [1; 1];
    
    % Direzione in entrambe le direzioni
    direction = [0; 0];
end








