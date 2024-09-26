function g = graphs(time_history, x_ext_history, e, t_end)

    %  x1
    subplot(2,4,1);
    plot(time_history, x_ext_history(1, :), 'k');
    ylabel('x_{1}');
    xlabel('time (s)');
    xlim([0, t_end-1]);
    grid on
    
    %  x2
    subplot(2,4,2);
    plot(time_history, x_ext_history(2, :), 'k');
    ylabel('x_{2}');
    xlabel('time (s)');
    xlim([0, t_end-1]);
    grid on
    
    %  x3
    subplot(2,4,3);
    plot(time_history, x_ext_history(3, :), 'k');
    ylabel('x_{3}');
    xlabel('time (s)');
    xlim([0, t_end-1]);
    grid on
    
    %  x4
    subplot(2,4,4);
    plot(time_history, x_ext_history(4, :), 'k');
    ylabel('x_{4}');
    xlabel('time (s)');
    xlim([0, t_end-1]);
    grid on
    
    %  x5
    subplot(2,4,5);
    plot(time_history, x_ext_history(5, :), 'k');
    ylabel('x_{5}');
    xlabel('time (s)');
    xlim([0, t_end-1]);
    grid on
    
    %  x6
    subplot(2,4,6);
    plot(time_history, x_ext_history(6, :), 'k');
    ylabel('x_{6}');
    xlabel('time (s)');
    xlim([0, t_end-1]);
    grid on
    
    %  x7
    subplot(2,4,7);
    plot(time_history, x_ext_history(7, :), 'k');
    ylabel('x_{7}');
    xlabel('time (s)');
    xlim([0, t_end-1]);
    grid on
    
    %  x8
    subplot(2,4,8);
    plot(time_history, x_ext_history(8, :), 'k');
    ylabel('x_{8}');
    xlabel('time (s)');
    xlim([0, t_end-1]);
    grid on
    
    

    figure(2)
    title('Error dynamics');
    plot(time_history, e, 'k');
    ylabel('e');
    xlabel('time(s)')
    ylim([-1, 1]);
    xlim([0, 11]);
    grid on
    
    





end