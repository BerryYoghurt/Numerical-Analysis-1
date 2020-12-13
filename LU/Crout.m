function [L, U, e] = Crout(A)
%CROUT Decomposes A into L * U without pivoting.
%   L is a lower triangular matrix.
%   U is an upper triangular matrix with the elements of the main diagonal
%   = 1
%   If A cannot be decomposed without pivoting, e = true, and L and U are
%   undefined.
%   If A is not square, e = true and L and U are undefined.
%   
%   See also Doolittle, Cholesky

[n, m] = size(A);
isSymbolic = isa(A,'sym');
L = zeros(n,n);
U = eye(n,n);
if isSymbolic
    L = sym(L);
    U = sym(U);
end
e = false;

if n ~= m
    e = true;
    return
end

%U(1,2:end) = A(1,2:end)/L(1,1);

for i = 1 : n
    j = 1;
    while j <= i
        L(i,j) = A(i,j) - sum(L(i,1:j-1).*(U(1:j-1,j)'));
        j = j + 1;
    end
    
    if L(i,i) == 0 && i < n
        e = true;
        return
    end
    
    while j <= n
        U(i,j) = (A(i,j)-sum(L(i,1:i-1).*(U(1:i-1,j))'))/L(i,i);
        j = j + 1;
    end
end

end

%tested for numeric 3x3, numeric 6x6, symbolic 3x3
