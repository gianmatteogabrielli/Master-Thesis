clc
clear 
close all

% Definisci la matrice identità 2x2
I = eye(2);

% Definisci la matrice A
S0 = [0, 1; -1, 0];

% Calcola il prodotto tensoriale
result = kron(I, S0);

% Visualizza il risultato
disp(result);
