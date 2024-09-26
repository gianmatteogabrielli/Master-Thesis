clc
clear
close all

% !!!!!!!!!!!!!!!!!!!!  SE SI CAMBIANO I DATI, DEVONO ESSERE CAMBIATE LE
% MATRICI K DEL CONTROLLO !!!!!!!!!!!!!!!!!!!!!!!!!!!
n = 8;
mc = 2;
md = 1;
q = 2;

m1 = 1;
m2 = 3;
m3 = 5;
m4 = 2;


k1 = 0.5;
k2 = 0.6;
k3 = 1;

A = [0, 1, 0, 0, 0, 0, 0, 0;
    -(k1 + k3)/m1, 0, k1/m1, 0, k3/m1, 0, 0, 0;
     0, 0, 0, 1, 0, 0, 0, 0;
     k1/m2, 0, -k1/m2, 0, 0, 0, 0, 0;
     0, 0, 0, 0, 0, 1, 0, 0;
     k3/m3, 0, 0, 0, -(k2+k3)/m3, 0, k2/m3, 0;
     0, 0, 0, 0, 0, 0, 0, 1;
     0, 0, 0, 0, k2/m4, 0, -k2/m4, 0];



% DUMPERS VERSION

% A = [0, 1, 0, 0, 0, 0, 0, 0;
%     -a1, -a5, a1, a5, 0, 0, 0, 0;
%     0, 0, 0, 1, 0, 0, 0, 0;
%     a2, a6, -a2, -a6, 0, 0, 0, 0;
%     0, 0, 0, 0, 0, 1, 0, 0;
%     0, 0, 0, 0, -a3, -a7, a3, a7;
%     0, 0, 0, 0, 0, 0, 0, 1;
%     0, 0, 0, 0, a4, a8, -a4, -a8];




B = [0, 0;
     1/m1, 0;
     0, 0;
     0, 0; 
     0, 0;
     0, 0;
     0, 0;
     0, 1/m4];


C = [1, 0, 0, 0, 0, 0, 0, 0];
P = zeros(n, q);
R = zeros(n, q);
Q = [-1, 0];


% exosystem

omega = 1;

S = [0, omega;
     -omega, 0];

J = eye(2);



% jump dynamics

E = [1, 0, 0, 0, 0, 0, 0, 0;
     0, 1, 0, 0, 0, 0, 0, 0;
     0, 0, 1, 0, 0, 0, 0, 0;
     0, 0, 0, (m2 - m3)/(m2+m3), 0, 2*m3/(m2+m3), 0, 0;
     0, 0, 0, 0, 1, 0, 0, 0;
     0, 0, 0, 2*m2/(m2+m3), 0, (m3-m2)/(m2+m3), 0, 0;
     0, 0, 0, 0, 0, 0, 1, 0;
     0, 0, 0, 0, 0, 0, 0, 1];

F = zeros(n, md);




% extended state: A_bar B_bar C_bar E_bar F_bar



A_bar = [A, P; zeros(q, n), S];
B_bar = [B; zeros(q, mc)];
E_bar = [E, R; zeros(q, n), J];
F_bar = [F; zeros(q, md)];
C_bar = [C, Q];

cart2Width = 3; 
cart3Width = 1;

save spring_mass_3s.mat








    

