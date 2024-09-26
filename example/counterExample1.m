clc
clear
close all

A = zeros(2, 2);
B = [1;0];
C = [1, 0];
Q = [-1, 0, -1];
P = zeros(2, 3);
R = P;
E = [1, 0;
     0, 0];
J = [1, 0, 0;
     0, 0, 1;
     0, 1, 0];
S = [1, 0, 0;
     0, 1, 0;
     0, 0, 0];

A_bar = [A, P;
         zeros(3, 2), S];
B_bar = [B; zeros(3, 1)];
E_bar = [E, R;
         zeros(3, 2), J];
C_bar = [C, Q];

save counterExample1.mat A_bar B_bar E_bar C_bar