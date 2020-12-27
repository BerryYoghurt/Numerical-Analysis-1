function [err, x, sim] = gaussJordan(A, tolerance, print)
    
    err = 0;
    n = size(A,1);
    sim = '';
    
    sim = sprintf('A = %s \n%s', sim, Gauss.output(A,print)); %used for simulation to display A before any changes%
    
    %forward elimination
    for k = 1:n
        pivot = A(k,k);
        %return error if pivot is zero
        if (abs(pivot) < tolerance)
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
    
    %backward elimination
    for k = n:-1:1
        A(k,:) = A(k,:)/A(k,k);
       for i = k-1:-1:1
          factor = -A(i,k);
          A(i,:) = A(k,:) * factor + A(i,:);
       end
       sim = sprintf('%s \n%s', sim, Gauss.output(A,print)); % used for simulation%
    end
    x = A(:,n+1);
end