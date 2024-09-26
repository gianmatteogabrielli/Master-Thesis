function w_dot = example_dyn_exo(w, t)
    S = [1, 2, 0, 2;
        -1, -1, 0, -1;
         0, 0, 1, 0;
         0, 1, 0, 1];
    
    w_dot = S*w;


end