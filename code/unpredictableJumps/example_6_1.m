clc
clear all
close all


A = [-1, 0, 0;
      0,-2, 0;
      0, 0,-0.5];

B = [1, 0;
     0, 1;
     0, 1];

P = [1, 0;
     0, 0;
     1, 0];

C = [0, 0, 1];

Q = [-1, 0];

E = [0, 0, 1;
     -1, 0, 0;
     1, -1,-1];

F = [1;
     0;
     0];

R = zeros(3, 2);

S = [0, 1;
     -1, 0];

J = [0, 1;
     -1, 0];




n = size(A, 2);
mc = size(B, 2);
md = size(F, 2);
q = size(Q, 2);
A_bar = [A, P; zeros(q, n), S];
B_bar = [B; zeros(q, mc)];
E_bar = [E, R; zeros(q, n), J];
F_bar = [F; zeros(q, md)];
C_bar = [C, Q];


save example_6_1.mat 




