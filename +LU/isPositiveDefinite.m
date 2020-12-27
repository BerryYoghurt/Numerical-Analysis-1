function [flag] = isPositiveDefinite(A, isSymbolic)
%ISPOSITIVEDEFINITE Checks if the matrix is symmetric and positive definite
%   parameter isSymbolic denotes whether A has letter entries
%   returns true if symmetric and positive definite, false otherwise
%
%   SEE ALSO Cholesky
import LU.*

[n,m] = size(A);

if n ~= m
    flag = false; %not square
    return
end

flag = true;
for i = 1 : n
    for j = i+1 : n
        if A(i,j) ~= A(j,i)
            flag = false; %not symmetric
            return
        end
    end
end

if(flag && ~isSymbolic)

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

