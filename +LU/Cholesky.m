function [L, error] = Cholesky(A)
%CHOLESKY Decomposes A into L*transpose(L)
%
%   NOTE: isPositiveDefinite check has to be called on the matrix and evaluate to
%   true in order for this function to output meaningful results
%
%   If A is not square or not symmetric, e = true
%   and L is undefined. 
%   For the time being, the function returns an answer when A is not
%   positive definite, but the answer is wrong.

isSymbolic = isa(A,'sym');
[n,m] = size(A);
L = zeros(n,n);
if isSymbolic
    L = sym(L);
end
error = false;




for i = 1 : n
    j = 1;
    while j < i
        
        if L(j,j) == 0
            error = true;
            return
        end
        
        L(i,j) = (A(i,j) - sum(L(i,1:j-1).*L(j,1:j-1)))/L(j,j);
        j = j + 1;
    end
    
    L(i,j) = sqrt(A(i,j) - sum(L(i,1:i-1).^2));
end

end

%tested for symmetric: numeric 3x3, numeric 6x6, symbolic 3x3
