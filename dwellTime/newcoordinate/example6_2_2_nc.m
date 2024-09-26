clc
clear 
close all

n = 4;
q = 2;
mc = 2;
md = 2;

A = -eye(n);
A(1, 2) = 1;
B =[0, 0;
    1, 0;
    0, 1;
    0, 1];

P = [-1, 0;
      0, 0;
      0, 0;
      0, 0];

C = [0, 0, 0, 1];
Q = [-1, 0];
E = [0, 0, 0, 1;
     1, 0, 0, 0;
     0, 1, 0, 0;
     1, 0, -1, 1];
    
F = [1, 0;
     0, 1;
     0, 0;
     0, 0];


%componente (4, 2) di F doveva essre 0
    

R = zeros(n, q);
S = [0, 1;
     -1, 0];
J = S;


A_bar = [A, P; zeros(q, n), S];
B_bar = [B; zeros(q)];
E_bar = [E, F; zeros(q, n), J];
F_bar = [F; zeros(q)];
C_bar = [C, Q];



typeOfSub = 1;
Z_star = invariantSubspaceAlgorithm(A_bar, B_bar, E_bar, F_bar, C_bar, n, q, typeOfSub)
typeOfSub = 2;

% flow invariant subspace
V_star = invariantSubspaceAlgorithm(A_bar, B_bar, E_bar, F_bar, C_bar, n, q, typeOfSub);
V_perp = null(V_star', 'rational');
Z_perp = null(Z_star', 'rational');
noInter = subspaceImage([V_perp, Z_perp]);
V_minus_Z = intersectionOperator(noInter, V_star);
T = [Z_star, V_minus_Z, [0, 0, 0, 0, 1, 1]'];
inverse_T = inv(T);

A_tilde = T*A_bar*inverse_T;
B_tilde = T*B_bar;
E_tilde = T*E_bar*inverse_T;
F_tilde = T*F_bar;


K_tilde = [0     0     0     0     0     0;
           0     0     0     2    -2     0];


    
        %A_tilde_1 = A_tilde + B_tilde*K_tilde;
    
        % questa azzera la compoenente A21
    
K2i = [   -1/6     -5/12      1/6   ;
       
         0, 0, 0];

K2_tilde = [K2i,zeros(2, 3)];

K1 = K_tilde*T;
K2 = K2_tilde*T;
A_tilde_fin = A_tilde + B_tilde*(K_tilde + K2_tilde);






save('example6_2_2.mat')