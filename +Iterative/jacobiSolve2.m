function [jacobiIterative2, iter]= jacobiSolve2(a,x,b,relativeError)
    l=length(a);
    sum=0;
    iter = 0;
    xnew=[];
    currentError=10000000;
    while(abs(currentError)>relativeError)
      for i=1:l
        xprev=x;
        for j=1:l
            if (j ~= i)
                sum=sum+x(j)*a(i,j);
            end  
        end
        xnew(i)=(b(i)-sum)/a(i,i);
        sum=0;
      end
        x=xnew;
        currentError = Iterative.findMaxRelativeError(xprev,x);
        iter = iter + 1;
    end
    jacobiIterative2 = x;
end