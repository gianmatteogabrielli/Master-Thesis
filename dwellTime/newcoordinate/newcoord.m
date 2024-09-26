% nuovo cambio di coordinate %
clc
clear
close all

load example6_2_2.mat

X = [eye(n), zeros(n, q)]';
W = [zeros(q, n), eye(q)]';

N_X_star = intersectionOperator(Z_star, X);

appoggio = X';
X_perp = null(appoggio, "rational");
N_W_star = [-1, 1
             0, 1;
             0, 0;
             1, 0;
             1, 0;
             0, 1];


appoggio = Z_star';
Z_star_perp = null(appoggio, "rational");
N_X_compl = intersectionOperator(Z_star_perp, X)

appoggio = Z_star';

total = subspaceImage([N_X_compl, N_X_star, N_W_star]);
N_W_compl = W;
R_nq = eye(n+q);


T_inverse = [N_X_star,  N_W_star, N_X_compl, N_W_compl];
T = inv(T_inverse);

A_tilde = T*A_bar*inverse_T;
B_tilde = T*B_bar;




