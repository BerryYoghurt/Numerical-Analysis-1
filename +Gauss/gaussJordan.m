function [err, x] = gaussJordan(A, tolerance, print)
    
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
    
    %backward elimination
    for k = n:-1:2
       for i = k-1:-1:1
          A(k,:) = A(k,:)/A(k,k);
          factor = -A(i,k);
          A(i,:) = A(k,:) * factor + A(i,:);
          Gauss.output(A,print); % used for simulation%
       end
    end
    x = A(:,n+1);
end