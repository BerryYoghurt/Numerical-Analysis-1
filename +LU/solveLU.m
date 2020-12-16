function [b, error] = solveLU(L,U,b)
%SOLVE solves a system of linear equations represented by LUx = b
%   Argument L is a lower triangular matrix, U is upper triangular, and b
%   is the column vector of outputs
%
%   returns x and e.
%   e is a flag with value 0 if all is ok, 1 if there is no solution for
%   the system, 2 if there is an infinite number of solutions.
%   if e == 0, x is the unique solution of the system

[n,~] = size(L);
error = 0;

% forward elimination for Ly = b %
for i = 1 : n
    if L(i,i) == 0
        if b(i) == 0
            error = 2;
        else
            error = 1;
        end
        return
    end
    factors = L(i+1:end,i)/L(i,i);
    L(i+1:end,i) = 0;
    b(i+1:end) = b(i+1:end) - b(i)*factors;
    b(i) = b(i)/L(i,i);
end

% backward substitution for Ux = y%
for i = n : -1: 1
    if U(i,i) == 0
        if b(i) == 0
            error = 2;
        else
            error = 1;
        end
        return
    end
    factors = U(1:i-1,i)/U(i,i);
    U(1:i-1,i) = 0;
    b(1:i-1) = b(1:i-1) - b(i)*factors;
    b(i) = b(i)/U(i,i);
end

end

%tested for 3x3 numeric and symbolic
