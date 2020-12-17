function [GaussSeidelIterative2, iter] = GaussSeidelSolve2(a,x,b,relativeError)
    l=length(a);
    sum=0;
    currentError = 100000000;
    iter = 0;
    while(abs(currentError)>relativeError)
      for i=1:l
        xprev=x;
        for j=1:l
            if (j ~= i)
                sum=sum+x(j)*a(i,j);
            end
        end
        x(i)=(b(i)-sum)/a(i,i);
        sum=0;
      end
         currentError = Iterative.findMaxRelativeError(xprev,x);
         iter = iter +1;
    end
    GaussSeidelIterative2=x;
end

