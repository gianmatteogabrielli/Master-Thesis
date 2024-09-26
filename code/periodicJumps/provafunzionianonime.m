clc
clear 
close all

load dataSystem.mat
load matrixComponents.mat

tau_m = 10;
integranda = @(tau) expm(A11*(tau_m - tau))* B11* B11' * expm(A11*(tau_m - tau))';
Sigma = 8;
gramian = integral(integranda, 0, tau_m, 'ArrayValued', true);
Gamma1v_fun = B11'*expm(A11 * (tau_m - Sigma))'*inv(gramian)*Gamma1_tilde*inv(expm(S*Sigma));
