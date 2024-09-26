clc
clear 
close all



% capacità condensatori
 C1 = 1;   % Farad
 C2 = 1;
 C3 = 1;

 % resistenze resistori

 R1 = 1;
 R2 = 0.5;
 R3 = 2; % ohm

 % matrici

 a = (1/(R1*C1));
 b = (1/(R2*C2));
 c = (1/(R3*C3));

 A = [-a, 0, 0;
       0, -b, 0; 
       0, 0, -c];


 
 
 
 B = [a, 0;
      0, b;
      0, c];




 C = [0, 0, C3];
 Q = [-1, 0];



 E = (1/(C1+C2+C3))*[C1, C2, C3;
                     C1, C2, C3;
                     C1, C2, C3];




 S = [0, 1; -1, 0];


 J = S;

 R = 0;
 F = 0;
 P = 0;




 save dataSystem.mat A B S J R F P E C Q