import LU.*;
A = [1 2 3; 0 0 4; 1 0 0];
B = [1 2 1 2; 2 1 2 1; 1 2 1 2; 2 1 2 1];
C = [1 2 3; 2 3 1; 3 1 2];
D = [6 15 55; 15 55 225; 55 225 979];
E = [1 2; 2 1];
F = [2 -1 0; -1 2 -1;0 -1 2];
%[L,U,e] = Doolittle(A);
%isPositiveDefinite(B)
%isPositiveDefinite(C)
%isPositiveDefinite(D)
%isPositiveDefinite(E)
%isPositiveDefinite(F)
Cholesky(F)