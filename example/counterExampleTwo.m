clc
clear 
close all

S = [0, 1, 0, 0;
        -1, 0, 0, 0;
         0, 0, 0, 1;
         0, 0, -1, 0];
A = 0;
B = 1;
P = zeros(1, 4);
A_bar = [A, P;zeros(4, 1), S];
B_bar = [B; zeros(4, 1)];
E = 1;
J = [1, 0, 0, 0;
    0, 1, 0, 0;
     0, 0, 0, 1;
     0, 0, 1, 0];
E_bar = [E, zeros(1, 4);
        zeros(4, 1), J];
C_bar = [1 -1 0 -1 0];


save counterExampleTwo.mat A_bar B_bar E_bar C_bar