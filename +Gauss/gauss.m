function [err, x, sim] = gauss(A, tolerance, print, isSymbolic)
    
    sim = '';
    err = 0;
    n = size(A,1);
    sim = sprintf('A = %s \n%s', sim, Gauss.output(A,print)); %used for simulation to display A before any changes%
    
    %forward elimination
    for k = 1:n
        pivot = A(k,k);
        %return error if pivot is zero
        if ((~isSymbolic&&(abs(pivot) < tolerance)) || (isSymbolic && pivot == 0))
            x=0;
            err = 1;
           return;
        end
        
        %elimination
        for i = k+1:n
            factor = A(i,k)/pivot;
            A(i,:) = A(i,:) - factor*A(k,:);
            sim = sprintf('%s \n%s', sim, Gauss.output(A,print)); % used for simulation%
        end
    end
    
    
    %x = zeros(n,1);
    x = vpa(zeros(n,1));
    x(n,1) = A(n,n+1)/A(n,n);
    sim = sprintf('%s \n\nx = \n%s', sim, Gauss.output(x,print)); % used for simulation%

    %backward substitution
    for i = n-1:-1:1
       sum = A(i, i+1:n) * x(i+1:n, 1);
       x(i,1) = (A(i,n+1) - sum) / A(i,i);
       sim = sprintf('%s \n%s', sim, Gauss.output(x,print)); % used for simulation%
    end
    
end