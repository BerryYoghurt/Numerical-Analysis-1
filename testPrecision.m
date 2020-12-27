import Gauss.*
import Iterative.*
import LU.*
digits(2);
A = vpa([1 1 2; -1 -2 3; 3 7 4]);
%A = vpa([4 1 1; 1 5 1; 1 1 7]); %diagonally dominant to test iterative
%A = vpa([0 2 3; 4 6 7; 2 1 6]); %test pivoting
%A = vpa([6 15 55; 15 55 225; 55 225 979]);
b = vpa([8;1;10]);
%b = vpa([8 -3 5]);
x = vpa([1 0 0]);
%[err, x, sim] = gauss([A b],0.001,true);
[jacobiIterative2, iter, sim]= jacobiSolve2(A,x,b,0.001);
%[jacobiIterative1, sim]= jacobiSolve1(A,x,b,'5');
%[GaussSeidelIterative2, iter, sim] = GaussSeidelSolve2(A,x,b,0.001);
%[GaussSeidelIterative, sim] = GaussSeidelSolve1(A,x,b,'5');
%[err, x, sim] = gaussWithPivoting([A b], 0.1, false);
%[L,U,err] = Doolittle(A);
%[L,U,err] = Crout(A);
[L, err, ~] = Cholesky(A);
[b, error, sim] = solveLU(L,L',b);