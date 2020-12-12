function [L, U, e] = Doolittle(A)
%DOOLITTLE Decomposes A into L * U without pivoting
%   L is a lower triangular matrix and U is an upper triangular matrix.
%   The elements of the main diagonal of L are 1.
%   If A cannot be decomposed without pivoting, e = true, and L and U are
%   undefined.
%   If A is not square, e = true and L and U are undefined.
%   
%   See also Crout, Cholesky

e = false;

[n,m] = size(A);
L = eye(n,n);
U = 0;
if n ~= m
    e = true;
    return
end


for i = 1 : n-1
   if A(i,i) == 0
       e = true;
       return
   end
   for j = i+1 : n
       L(j,i) = A(j,i)/A(i,i);
       A(j,:) = A(j,:)- A(i,:)*L(j,i);
   end
end

U = A;

end

