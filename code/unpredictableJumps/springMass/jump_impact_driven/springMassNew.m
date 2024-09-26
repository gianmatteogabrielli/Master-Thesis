clc
clear
close all

n = 8;
mc = 2;
md = 1;
q = 2;

m1 = 1;   %1
m2 = 3;  %3
m3 = 1;     %5
m4 = 2;     %2

k1 = 12; %0.5 %2
k2 = 0.1;  %0.6
%k3 = 10;   % 1   %


c1 = 0.5;
c2 = 1;


alfa = (m3-m2)/(m2+m3);
beta = 2*m2/(m2 + m3);
gamma = 2*m3/(m2 + m3);
delta = -alfa;

a1 = k1/m1;
a2 = k1/m2;
a3 = k2/m3;
a4 = k2/m4;

a5 = c1/m1;
a6 = c1/m2;
a7 = c2/m3;
a8 = c2/m4;


eps = 0.01;
A = [0, 1, 0, 0, 0, 0, 0, 0;
    -a1, 0, a1, 0, 0, 0, 0, 0;
     0, 0, 0, 1, 0, 0, 0, 0;
     a2, 0, -a2, 0, 0, 0, 0, 0;
     0, 0, 0, 0, 0, 1, 0, 0;
     0, 0, 0, 0, -a3, 0, a3, 0;
     0, 0, 0, 0, 0, 0, 0, 1;
     0, 0, 0, 0, a4, 0, -a4, 0];



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
     0, 0, 0, alfa, 0, beta, 0, 0;
     0, 0, 0, 0, 1, 0, 0, 0;
     0, 0, 0, gamma, 0, delta, 0, 0;
     0, 0, 0, 0, 0, 0, 1, 0;
     0, 0, 0, 0, 0, 0, 0, 1];

F = zeros(n, md);




% extended state: A_bar B_bar C_bar E_bar F_bar



A_bar = [A, P; zeros(q, n), S];
B_bar = [B; zeros(q, mc)];
E_bar = [E, R; zeros(q, n), J];
F_bar = [F; zeros(q, md)];
C_bar = [C, Q];

cart2Width = 7; 
cart3Width = 1;

save spring_mass_new.mat








    

