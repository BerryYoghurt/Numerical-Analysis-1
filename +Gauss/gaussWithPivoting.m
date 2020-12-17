function [err, x] = gaussWithPivoting(A, tolerance, print)
    err = 0;
    n = size(A, 1);
    Gauss.output(A,print); %used for simulation to display A before any changes%
    
    for k = 1:n-1

	    %pivoting
        A(k:end, :) = pivot(A(k:end, :));
        
	    %check singularity
        if (abs(A(k,k)) < tolerance)
           err = 1;
           x = 0;
           return;
        end
        
        Gauss.output(A,print); % used for simulation%
        
        %forward elimination
        for i = k+1:n
            factor = A(i,k)/A(k,k);
            A(i,:) = A(i,:) - factor*A(k,:);
            Gauss.output(A,print); % used for simulation%
        end
    end
    
    %check singularity
    if (abs(A(k,k)) < tolerance)
           err = 1;
           x = 0;
           return;
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


function A = pivot(A)
    k = size(A,2) - size(A,1);
    s = max(abs(A),[],2 );
    %get index of max scaled element in column k
    [~,index] = max(abs(A(:,k) ./s));
    p = ind2sub(size(A),index);
    
    %swap in A
    if (p ~= 1)
        dummy = A(1,:);
        A(1,:) = A(p,:);
        A(p,:) = dummy;
    end
end