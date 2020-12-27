function [GaussSeidelIterative2, iter, sim] = GaussSeidelSolve2(a,x,b,relativeError)
    l=length(a);
    sum=0;
    currentError = 100000000;
    iter = 0;
    sim = '';
    while(abs(currentError)>relativeError)
      for i=1:l
        xprev=x;
        for j=1:l
            if (j ~= i)
                sum=sum+x(j)*a(i,j);
            end
        end
        if(a(i,i)==0)
            GaussSeidelIterative2='can not solve';
            return;
        end
        x(i)=(b(i)-sum)/a(i,i);
        sum=0;
      end
         currentError = Iterative.findMaxRelativeError(xprev,x);
         nanNo=any(isnan(x(:)));
         infNo=any(isinf(x(:)));
         if(nanNo>0 || infNo>0)
             GaussSeidelIterative2='can not solve';
              return;
         end
         sim = sprintf('%s\n\nIteration %d = \n%s', sim, iter+1, Gauss.output(x,true));
         iter = iter +1;
    end
    GaussSeidelIterative2=x;
end

