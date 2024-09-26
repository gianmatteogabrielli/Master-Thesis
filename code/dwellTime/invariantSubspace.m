
%% EXAMPLE 6.1.1 UNPREDICTABLE JUMP CASE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear all
close all

load example6_2_2.mat

n = size(A, 2);
mc = size(B, 2);
md = size(F, 2);
q = size(Q, 2);
A_bar = [A, P; zeros(q, n), S];
B_bar = [B; zeros(q, mc)];
E_bar = [E, R; zeros(q, n), J];
F_bar = [F; zeros(q, md)];
C_bar = [C, Q];
N_star = [];
Z_star = [];


% typeOfSub : tipo di sottospazio che si vuole creare:
% 0: N_star 
% 1: Z_star 
% 2: V_star

typeOfSub = 0;
switch typeOfSub

    case 0
        N_star = invariantSubspaceAlgorithm(A_bar, B_bar, E_bar, F_bar, C_bar, n, q, typeOfSub)
        e1 = [0, 0, 0, 0, 1]';
        e2 = [0, 0, 1, 0, 0]';
        
        inverse_T = [N_star, e1, e2];
        T = inv(inverse_T);
        
        A_tilde = T*A_bar*inverse_T;
        B_tilde = T*B_bar;
        E_tilde = T*E_bar*inverse_T;
        F_tilde = T*F_bar;
        save invariantSubspace N_star A_tilde B_tilde E_tilde F_tilde T inverse_T

    case 1
        Z_star = invariantSubspaceAlgorithm(A_bar, B_bar, E_bar, F_bar, C_bar, n, q, typeOfSub)
        typeOfSub = 2;

        % V_star coincide con S
        V_star = invariantSubspaceAlgorithm(A_bar, B_bar, E_bar, F_bar, C_bar, n, q, typeOfSub)
        V_minus_Z = [0, 0, 0, 0, 1]';
        c = [0, 1, 1, 0, 0]';
        inverse_T = [Z_star, V_minus_Z, c];
        T = inv(inverse_T);
        
        A_tilde = T*A_bar*inverse_T;
        B_tilde = T*B_bar;
        E_tilde = T*E_bar*inverse_T;
        F_tilde = T*F_bar;

        save invariantSubspace Z_star V_star A_tilde B_tilde E_tilde F_tilde T inverse_T
        
end











