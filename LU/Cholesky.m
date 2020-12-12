function [L, e] = Cholesky(A)
%CHOLESKY Decomposes A into L*transpose(L)
%
%   If A is not square or not symmetric or not positive definite, e = true
%   and L is undefined. 

isSymbolic = isa(A,'sym');
[n,m] = size(A);
L = zeros(n,n);
if isSymbolic
    L = sym(L);
end
e = false;

if n ~= m
    e = true;
    return
end

if isSymbolic
    for i = 1 : n
        for j = i+1 : n
            if A(i,j) ~= A(j,i)
                e = false;
                return
            end
        end
    end
else 
    if ~issymmetric(A) %doesn't work if symbolic
        e = true;
        return
    end
end

for i = 1 : n
    j = 1;
    while j < i
        
        if L(j,j) == 0
            e = true;
            return
        end
        
        L(i,j) = (A(i,j) - sum(L(i,1:j-1).*L(j,1:j-1)))/L(j,j);
        j = j + 1;
    end
    
    L(i,j) = sqrt(A(i,j) - sum(L(i,1:i-1).^2));
end

end

