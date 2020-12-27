function [GaussSeidelIterative, sim] = GaussSeidelSolve1(a,x,b,numberOfLoops)
    l=length(a);
    sum=0;
    sim = '';
    n=1;
    while(n<=numberOfLoops)
      for i=1:l
        for j=1:l
            if (j ~= i)
                sum=sum+x(j)*a(i,j);
            end
        end
        x(i)=(b(i)-sum)/a(i,i);
        sum=0;
      end
      sim = sprintf('%s\n\nIteration %d = \n%s', sim, n, Gauss.output(x,true));
      n=n+1;
    end
    GaussSeidelIterative=x;
end
