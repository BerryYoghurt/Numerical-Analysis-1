function [flag] = isPositiveDefinite(A)
%ISPOSITIVEDEFINITE Checks if the matrix is symmetric and positive definite
%   returns true if symmetric and positive definite, false otherwise
%
%   SEE ALSO Cholesky
import LU.*
isSymbolic = isa(A, 'sym');

[n,m] = size(A);

if n ~= m
    flag = false; %not square
    return
end

if isSymbolic
    flag = true;
    for i = 1 : n
        for j = i+1 : n
            if A(i,j) ~= A(j,i)
                flag = false; %not symmetric
                return
            end
        end
    end
else

    flag = true;
    if ~issymmetric(A)
        flag = false; %not symmetric
        return
    end
    [~,U,e] = Doolittle(A);
    if e
        flag = false; %I don't know if this is possible but for the time being..
        return
    end
    for i = 1:n
        if U(i,i) <= 0
            flag = false; %not positive definite
            return
        end
    end
end
end

