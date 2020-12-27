function [jacobiIterative2, iter, sim]= jacobiSolve2(a,x,b,relativeError)
    l=length(a);
    sum=0;
    iter = 0;
    sim = '';
    currentError=10000000;
    xnew = zeros(length(x), 1);
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
        currentError =Iterative.findMaxRelativeError(xprev,x);
         nanNo=any(isnan(x(:)));
         infNo=any(isinf(x(:)));
         if(nanNo>0 || infNo>0)
        jacobiIterative2="can't solve";
          return;
     end
        sim = sprintf('%s\n\nIteration %d = \n%s', sim, iter+1, Gauss.output(x,true));
        iter = iter + 1;
    end
    jacobiIterative2 = x;
end