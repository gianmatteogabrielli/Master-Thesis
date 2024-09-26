function complementar = complementarSubspace(X, Y)

    complementar = [];
    r1 = rank(X);
    r2 = rank(Y);
    index = 1;
    if(rank(X) + rank(Y) - rank([X, Y]) > 0)
        disp("Ci sono elementi comuni");
        d = size(Y, 2);
        r_appoggio = rank([X, Y]);
        for i = 1:d
            
            if(size([X, Y(:, 1:d-i)], 2) ~= size(X, 2))

                r = rank([X, Y(:, 1:d-i)]);
                if(r ~= r_appoggio)
                    complementar = [complementar,Y(:, d-i+1)];
                end
                r_appoggio = r;
            else
                break;
            end
          
                
                
        end
    else
        disp("Non ci sono elementi comuni");
        complementar = Y;
    end
        
%     if (size(X, 2) > size(Y, 2))
%         d = size(Y, 2);
%         for i = 1:d
%             if(rank([X, Y(:, i)]) ~= rank(X) && rank([complementar, Y(:, i)])~= rank(complementar))
%                 complementar = [complementar, Y(:, i)];
%             end
%         end
%     else
%         d = size(X, 2);
%         for i = 1:d
%             if(rank([Y, X(:, i)]) ~= rank(X) && rank([complementar, Y(:, i)])~= rank(complementar))
%                 complementar = [complementar, Y(:, i)];
%             end
%         end
%     end


end
