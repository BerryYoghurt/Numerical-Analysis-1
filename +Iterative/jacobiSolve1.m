function jacobiIterative1= jacobiSolve1(a,x,b,numberOfLoops)
    l=length(a);
    sum=0;
    n=1;
    xnew = [];
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
        n=n+1;
    end
    jacobiIterative1 = x;
end
