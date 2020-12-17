function [err, x] = gauss(A, tolerance, print)

    err = 0;
    n = size(A,1);
    
    Gauss.output(A,print); %used for simulation to display A before any changes%
    
    %forward elimination
    for k = 1:n-1
        pivot = A(k,k);
        %return error if pivot is zero
        if (abs(pivot) < tolerance)
            err = 1;
            x = 0;
           return;
        end
        
        %elimination
        for i = k+1:n
            factor = A(i,k)/pivot;
            A(i,:) = A(i,:) - factor*A(k,:);
            Gauss.output(A,print); % used for simulation%
        end
    end
    
    
    x = zeros(n,1);
    x(n,1) = A(n,n+1)/A(n,n);
    Gauss.output(x,print); % used for simulation%

    %backward substitution
    for i = n-1:-1:1
       sum = A(i, i+1:n) * x(i+1:n, 1);
       x(i,1) = (A(i,n+1) - sum) / A(i,i);
       Gauss.output(x,print); % used for simulation%
    end
    
end