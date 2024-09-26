clc
clear 
close all


load dataSystem.mat



A11 = A(1, 1);
A12 = A(1, 2);
A13 = A(1, 3);
A21 = A(2, 1);
A22 = A(2, 2);
A23 = A(2, 3);
A31 = A(3, 1);
A32 = A(3, 2);
A33 = A(3, 3);

B11 = B(1, 1);
B12 = B(1, 2);
B21 = B(2, 1);
B22 = B(2, 2);
B31 = B(3, 1);
B32 = B(3, 2);

E11 = E(1, 1);
E12 = E(1, 2);
E13 = E(1, 3);
E21 = E(2, 1);
E22 = E(2, 2);
E23 = E(2, 3);
E31 = E(3, 1);
E32 = E(3, 2);
E33 = E(3, 3);





save matrixComponents.mat