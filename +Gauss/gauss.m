function [err, x] = gauss(A, tolerance)

    err = 0;
    n = size(A,1);
    
    %disp(A); %used for simulation to display A before any changes%
    
    %forward elimination
    for k = 1:n-1
        pivot = A(k,k);
        %return error if pivot is zero
        if (abs(pivot) < tolerance)
            err = 1;
           return;
        end
        
        %elimination
        for i = k+1:n
            factor = A(i,k)/pivot;
            A(i,:) = A(i,:) - factor*A(k,:);
            %disp(A); % used for simulation%
        end
    end
    
    
    x = zeros(n,1);
    x(n,1) = A(n,n+1)/A(n,n);
    %disp(x); % used for simulation%

    %backward substitution
    for i = n-1:-1:1
       sum = A(i, i+1:n) * x(i+1:n, 1);
       x(i,1) = (A(i,n+1) - sum) / A(i,i);
       %disp(x); % used for simulation%
    end
    
end