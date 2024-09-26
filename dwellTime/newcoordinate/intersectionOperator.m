function [intersection, no_intersection] = intersectionOperator(V, W)
    intersection = [];
    no_intersection = [];



% consiglio di Giovanni Marro

% ( X inter Y)_perp = X_perp + Y_perp => X inter Y = (X_perp + Y_perp)_perp

    
    % procedura per avere il perp
%     n = size(V, 1);
%     h = size(V, 2);

    %keyboard;

    %appoggio = orth([V, eye(n)]);
    appoggio = V';
    
    V_perp = null(appoggio, 'rational');
    %V_perp = null(appoggio);
    %V_perp = round(appoggio(:, end -(n-h) + 1 :end));
    %V_perp = round(appoggio(:, end -(n-h):end));
%     n = size(W, 1);
%     h = size(W, 2);

    %keyboard;
    %appoggio = orth([W, eye(n)]);
    appoggio = W';

    W_perp = null(appoggio, 'rational');
    %W_perp = null(appoggio);
    %W_perp = round(appoggio(:, end - abs(n-h) + 1:end));
    %W_perp = round(appoggio(:, end - abs(n-h):end));
    V_inter_W_perp = [V_perp, W_perp];
    V_no_inter_W = [V_perp, W]';
    
%     n = size(V_inter_W_perp, 1);
%     h = size(V_inter_W_perp, 2);
    
    
    disp(['Intersection dimension: ', num2str(rank(V) + rank(W) - rank([V, W]))]);
    
    appoggio = V_inter_W_perp';
    %appoggio = orth([V_inter_W_perp, eye(n)]);
    
    intersection = null(appoggio, 'rational');
    %intersection = null(appoggio);
    %keyboard;
    no_intersection = V_inter_W_perp;
    %intersection = round(appoggio(:, end - abs(n-h) + 1:end));
    %intersection = round(appoggio(:, end - abs(n-h):end));
    


    
    
    
   
    
   

   
    


end
