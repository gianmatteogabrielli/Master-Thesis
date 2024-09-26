
clc
clear 
close all

A = [-1, 1;
      0  -1];
B = [1;0];
C = [1, 0];
Q = 0;
S = 0;
E = [0.5, 0; 
      0, 0];
J = -1;
P = [0;1];
R = [0;1];

A_bar = [A, P;
         zeros(1, 2), S];
B_bar = [B;0];
C_bar = [C, Q];
E_bar = [E, R;
        zeros(1, 2), J];
F_bar = zeros(3, 1);


save counterExample3.mat A_bar B_bar E_bar C_bar