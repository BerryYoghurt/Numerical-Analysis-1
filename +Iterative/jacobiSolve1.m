function [jacobiIterative1, sim]= jacobiSolve1(a,x,b,numberOfLoops)
    l=length(a);
    sum=0;
    n=1;
    xnew = zeros(length(x), 1);
    sim = '';
    numberOfLoops = str2double(numberOfLoops);
    while(n<=numberOfLoops)
      for i=1:l
        for j=1:l
            if (j ~= i)
                x(i);
                a(i, j);
                sum=sum+x(j)*a(i,j);
            end
        end
        xnew(i)=(b(i)-sum)/a(i,i);
        sum=0;
      end
        x=xnew;
        sim = sprintf('%s\n\nIteration %d = \n%s', sim, n, Gauss.output(x,true));
        n=n+1;
    end
    jacobiIterative1 = x;
end
