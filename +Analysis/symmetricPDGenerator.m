function A = symmetricPDGenerator(n)
    A = rand(n,n); % generate a random n x n matrix
    A = 0.5*(A+A'); OR
    A = A*A'; % get symmetric matrix by multiplying A by its transpose
    A = A + n*eye(n); % ensure it is positive definite by adding nI
end