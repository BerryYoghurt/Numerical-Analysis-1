function [L, U, error, sim] = Doolittle(A)
%DOOLITTLE Decomposes A into L * U without pivoting
%   L is a lower triangular matrix and U is an upper triangular matrix.
%   The elements of the main diagonal of L are 1.
%   If A cannot be decomposed without pivoting, e = true, and L and U are
%   undefined.
%   If A is not square, e = true and L and U are undefined.
%   
%   See also Crout, Cholesky

error = false;
%isSymbolic = isa(A, 'sym');
sim = '';

[n,m] = size(A);
L = vpa(eye(n,n));
U = 0;
if n ~= m
    error = true;
    return
end

%if isSymbolic
%    L = sym(L);
%end

sim = sprintf('U = \n%s\n\n L = \n%s', Gauss.output(A,true), Gauss.output(L,true));
for i = 1 : n-1
   if A(i,i) == 0
       if A(i+1:n,i) ~= zeros(n-i,1)
            error = true;
            return
       end
       continue %no need to eliminate anything with this row
   end
   for j = i+1 : n
       L(j,i) = A(j,i)/A(i,i);
       A(j,:) = A(j,:)- A(i,:)*L(j,i);
   end
   sim = sprintf('%s\n\nU = \n%s\n\n L = \n%s', sim, Gauss.output(A,true), Gauss.output(L,true));
end

U = A;

end

%tested for numeric 3x3, symbolic 3x3
