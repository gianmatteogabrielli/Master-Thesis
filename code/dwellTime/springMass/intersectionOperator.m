function [intersection, no_intersection] = intersectionOperator(V, W)
    intersection = [];
    no_intersection = [];



% consiglio di Giovanni Marro

% ( X inter Y)_perp = X_perp + Y_perp => X inter Y = (X_perp + Y_perp)_perp

    
    % procedura per avere il perp
%     n = size(V, 1);
%     h = size(V, 2);

    %keyboard;
    if(rank(V) == 0 || rank(W) == 0)    % se uno dei due sottospazi è nullo, allora l'intersezione è nulla.
        intersection = [];
        
    else
    %appoggio = orth([V, eye(n)]);
        appoggio = V';
        
        V_perp = null(appoggio, 'rational');
        appoggio = W';
    
        W_perp = null(appoggio, 'rational');
        
        V_inter_W_perp = [V_perp, W_perp];
        V_no_inter_W = [V_perp, W]';
    
        
        disp(['Intersection dimension: ', num2str(rank(V) + rank(W) - rank([V, W]))]);
        appoggio = V_inter_W_perp';
        intersection = null(appoggio, 'rational');
        no_intersection = null(V_no_inter_W, 'rational');
    end

    
    
    
   
    
   

   
    


end
