
%% SPRING MASS UNPREDICTABLE JUMP CASE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear all
close all

load spring_mass.mat

n = size(A, 2);
mc = size(B, 2);
md = size(F, 2);
q = size(Q, 2);

N_star = [];
Z_star = [];


% typeOfSub : tipo di sottospazio che si vuole creare:
% 0: N_star 
% 1: Z_star 
% 2: V_star

typeOfSub = 1;
switch typeOfSub

    case 0
        N_star = invariantSubspaceAlgorithm(A_bar, B_bar, E_bar, F_bar, C_bar, n, q, typeOfSub)
        
        % Creare una matrice 10x10 piena di zeri
        e1 = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0]';
        e2 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 1]';
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

        % V_star coincide con Z_star
        V_star = invariantSubspaceAlgorithm(A_bar, B_bar, E_bar, F_bar, C_bar, n, q, typeOfSub)
        
        V_minus_Z = [];
        
        e1 = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0]';
        e2 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 1]';
        inverse_T = [Z_star, V_minus_Z,e1, e2];
        T = inv(inverse_T);
        
        A_tilde = T*A_bar*inverse_T;
        B_tilde = T*B_bar;
        E_tilde = T*E_bar*inverse_T;
        F_tilde = T*F_bar;

        save invariantSubspace Z_star V_star A_tilde B_tilde E_tilde F_tilde T inverse_T
        
end











