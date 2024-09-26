clc
clear 
close all

S = [1, 2, 0, 2;
        -1, -1, 0, -1;
         0, 0, 1, 0;
         0, 1, 0, 1];
A = [0, 0;1, 0];
B = [1;0];
P = zeros(2, 4);
A_bar = [A, P;zeros(4, 2), S];
B_bar = [B; zeros(4, 1)];
E = [1, 0;0, 0];
J = [1, 2, 2, 0;
     -1, -1, -1, 0;
      0, 1, 0, 1;
      0, 1, -1, 0];
E_bar = [E, zeros(2, 4);
        zeros(4, 2), J];
C_bar = [1, 0, -1, -1, 0, 0];

save counterExampleOne.mat A_bar B_bar E_bar C_bar