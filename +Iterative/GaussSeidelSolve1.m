function GaussSeidelIterative = GaussSeidelSolve1(a,x,b,numberOfLoops)
    l=length(a);
    sum=0;
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
        n=n+1;
    end
    GaussSeidelIterative=x;
end
