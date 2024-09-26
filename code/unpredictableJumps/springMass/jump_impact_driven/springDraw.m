function s = springDraw(x_ext_history)
    figure(8);
    visual = 30;
    hold on;
    axis manual;
    visualsx = min(x_ext_history(3,:)) - visual;
    visualdx = max(x_ext_history(5,:)) + visual + 40;
    xlim([visualsx, visualdx]);
    ylim([-10, 10]);
    
    % Impostazioni dei carrelli
    carWidth2 = 7;    % Larghezza del carrello blu (m2)
    carHeight = 0.3;  % Altezza dei carrelli
    wallHeight = 0.6; % Altezza dei muretti del carrello blu (m2)
    carWidth3 = 1;    % Larghezza del carrello rosso (m3)
    carWidth1 = 4;
    carWidth4 = 4;
    wheelRadius_m2 = 0.2;
    wheelRadius_m3 = 0.1;
    wallwidth = 0.1;
    springLenght1 = 20;
    springLenght2 = 40;
    wheelRadius_m1 = 0.20/2;
    wheelRadius_m4 = 0.20/2;
    wallh = wallHeight+carWidth3/2;
    
    line(xlim, [-1 -1], 'Color', 'k');
    line([-15, -15], [-1, -0.7],'Color', 'k');
    line([-50, -15], [-0.7, -0.7],'Color', 'k');
    line([15, visualdx], [0, 0], 'Color', 'k');
    line([15, 15], [0, -1],'Color', 'k');
    
    % creazione della molla k1
    k1_x_start = x_ext_history(1,1) + carWidth1/2 - springLenght1;
    k1_x_end = x_ext_history(3,1) - carWidth2/2;
    k1_y_start = -wallHeight/3 - wallHeight/2  + carHeight/2;
    k1_y_end = k1_y_start;
    
    spring_k1 = plot([k1_x_start k1_x_end], [k1_y_start k1_y_end],'LineWidth', 1.5, 'Color', 'k');  
    
    % creazione della molla k2
    k2_x_start = x_ext_history(5,1) + carWidth3/2;
    k2_x_end = x_ext_history(7,1) - carWidth4/2 + springLenght2;
    k2_y_start =carHeight;
    k2_y_end = k2_y_start;
    
    spring_k2 = plot([k2_x_start k2_x_end], [k2_y_start k2_y_end],'LineWidth', 1.5, 'Color', 'k');  
    
    
    % Creazione del carrello m2 con muretti
    wallsx = rectangle('Position',[x_ext_history(3,1) - carWidth2/2- wallwidth, -wallHeight, wallwidth, wallh], 'FaceColor', 'b');
    walldx = rectangle('Position',[x_ext_history(3,1) + carWidth2/2, -wallHeight, wallwidth, wallh], 'FaceColor', 'b');
    hCarrello2 = rectangle('Position', [x_ext_history(3,1) - carWidth2/2, -wallHeight/2, carWidth2, wallHeight/2], 'FaceColor', 'b');
    % Creazione del carrello m3
    hCarrello3 = rectangle('Position', [x_ext_history(5,1) - carWidth3/2, 0, carWidth3, carHeight], 'FaceColor', 'r');
    
    % Creazione del carrello m1
    hCarrello1 = rectangle('Position', [x_ext_history(1,1) - carWidth1/2 - springLenght1, -wallHeight/3 - wallHeight/2, carWidth1, carHeight], 'FaceColor', 'g');
    % Creazione del carrello m4
    hCarrello4 = rectangle('Position', [x_ext_history(7,1) - carWidth4/2 + springLenght2 , 0, carWidth4, carHeight], 'FaceColor', 'yellow');
    
    % Aggiunta di ruote per m2 
    hWheel1 = rectangle('Position', [x_ext_history(3,1) - carWidth2/4 - wheelRadius_m2, -wallHeight - 2*wheelRadius_m2, 2*wheelRadius_m2, 2*wheelRadius_m2], 'Curvature', [1, 1], 'FaceColor', 'k');
    hWheel2 = rectangle('Position', [x_ext_history(3,1) + carWidth2/4 - wheelRadius_m2, -wallHeight - 2*wheelRadius_m2, 2*wheelRadius_m2, 2*wheelRadius_m2], 'Curvature', [1, 1], 'FaceColor', 'k');
    
    % Aggiunta di ruote per m3
    hWheel3 = rectangle('Position', [x_ext_history(5,1) - carWidth3/4 - wheelRadius_m3, carHeight, 2*wheelRadius_m3, 2*wheelRadius_m3], 'Curvature', [1, 1], 'FaceColor', 'k');
    hWheel4 = rectangle('Position', [x_ext_history(5,1) + carWidth3/4 - wheelRadius_m3, carHeight, 2*wheelRadius_m3, 2*wheelRadius_m3], 'Curvature', [1, 1], 'FaceColor', 'k');
    
    % Aggiunta di ruote per m1
    
    hWheel5 = rectangle('Position', [x_ext_history(1,1) - carWidth1/4 - springLenght1 - wheelRadius_m1, -wallHeight - 2*wheelRadius_m1, 2*wheelRadius_m1, 2*wheelRadius_m1], 'Curvature', [1, 1], 'FaceColor', 'k');
    hWheel6 = rectangle('Position', [x_ext_history(1,1) + carWidth1/4 - springLenght1 - wheelRadius_m1, -wallHeight - 2*wheelRadius_m1, 2*wheelRadius_m1, 2*wheelRadius_m1], 'Curvature', [1, 1], 'FaceColor', 'k');
    
    
    hWheel7 = rectangle('Position', [x_ext_history(7,1) - carWidth4/4 + springLenght2 - wheelRadius_m4, carHeight - 2*wheelRadius_m4, 2*wheelRadius_m4, 2*wheelRadius_m4], 'Curvature', [1, 1], 'FaceColor', 'k');
    hWheel8 = rectangle('Position', [x_ext_history(7,1) + carWidth4/4 + springLenght2 - wheelRadius_m4, carHeight - 2*wheelRadius_m4, 2*wheelRadius_m4, 2*wheelRadius_m4], 'Curvature', [1, 1], 'FaceColor', 'k');

    
    
    % Titolo e etichette
    title('Animazione dei Carrelli');
    xlabel('Posizione');
    ylabel('Traccia');
    
    % Loop per l'animazione che utilizza i tempi della simulazione
    step_size = 2;
    for k = 2:step_size:length(x_ext_history)
        % Aggiorna la posizione dei carrelli e delle ruote
        set(wallsx,'Position',[x_ext_history(3,k) - carWidth2/2- wallwidth, -wallHeight, wallwidth, wallh]);
        set(walldx,'Position',[x_ext_history(3,k) + carWidth2/2, -wallHeight, wallwidth, wallh]);
        set(hCarrello2, 'Position', [x_ext_history(3,k) - carWidth2/2, -wallHeight, carWidth2, wallHeight]);
        set(hCarrello3, 'Position', [x_ext_history(5,k) - carWidth3/2, 2*wheelRadius_m3, carWidth3, carHeight]);
        set(hCarrello1, 'Position', [x_ext_history(1,k) - carWidth1/2- springLenght1, -wallHeight/3 - wallHeight/2, carWidth1, carHeight]);
        set(hCarrello4, 'Position', [x_ext_history(7,k) - carWidth4/2 + springLenght2 , 2*wheelRadius_m3, carWidth4, carHeight]);
        % Aggiorna la posizione delle ruote per il carrello blu (m2)
        set(hWheel1, 'Position', [x_ext_history(3,k) - carWidth2/4 - wheelRadius_m2, -wallHeight - 2*wheelRadius_m2, 2*wheelRadius_m2, 2*wheelRadius_m2]);
        set(hWheel2, 'Position', [x_ext_history(3,k) + carWidth2/4 - wheelRadius_m2, -wallHeight - 2*wheelRadius_m2, 2*wheelRadius_m2, 2*wheelRadius_m2]);
    
        % Aggiorna la posizione delle ruote per il carrello rosso (m3)
        set(hWheel3, 'Position', [x_ext_history(5,k) - carWidth3/4 - wheelRadius_m3, 0, 2*wheelRadius_m3, 2*wheelRadius_m3]);
        set(hWheel4, 'Position', [x_ext_history(5,k) + carWidth3/4 - wheelRadius_m3, 0, 2*wheelRadius_m3, 2*wheelRadius_m3]);


        % Aggiorna la posizione delle ruote per il carrello verde (m1)
        set(hWheel5, 'Position', [x_ext_history(1,k) - carWidth1/4 - springLenght1 - wheelRadius_m1, -wallHeight - wheelRadius_m1, 2*wheelRadius_m1, 2*wheelRadius_m1]);
        set(hWheel6, 'Position', [x_ext_history(1,k) + carWidth1/4 - springLenght1 - wheelRadius_m1, -wallHeight - wheelRadius_m1, 2*wheelRadius_m1, 2*wheelRadius_m1]);
        
        % Aggiorna la posizione delle ruote per il carrello giallo (m4)
        set(hWheel7, 'Position', [x_ext_history(7,k) - carWidth4/4 + springLenght2 - wheelRadius_m4, carHeight - 3*wheelRadius_m4, 2*wheelRadius_m4, 2*wheelRadius_m4]);
        set(hWheel8, 'Position', [x_ext_history(7,k) + carWidth4/4 + springLenght2 - wheelRadius_m4, carHeight - 3*wheelRadius_m4, 2*wheelRadius_m4, 2*wheelRadius_m4]);

        
        k1_x_start = x_ext_history(1,k) + carWidth1/2 - springLenght1;
        k1_x_end = x_ext_history(3,k) - carWidth2/2;
        k1_y_start = -wallHeight/3 - wallHeight/2  + carHeight/2;
        k1_y_end = k1_y_start;
        new_width = 50/abs(k1_x_start - k1_x_end);
        set(spring_k1, 'XData', [k1_x_start k1_x_end], 'YData', [k1_y_start k1_y_end],'LineWidth', new_width);
        
        k2_x_start = x_ext_history(5,k) + carWidth3/2;
        k2_x_end = x_ext_history(7,k) - carWidth4/2 + springLenght2;
        k2_y_start = carHeight;
        k2_y_end = k2_y_start;
        new_width = 100/abs(k2_x_start - k2_x_end);
        set(spring_k2, 'XData', [k2_x_start k2_x_end], 'YData', [k2_y_start k2_y_end],'LineWidth', new_width); 
    
    
    
        % Aggiorna l'animazione
        drawnow;
        %pause((time_history(k) - time_history(k-1))/10); % Segui i tempi della simulazione
    end
end