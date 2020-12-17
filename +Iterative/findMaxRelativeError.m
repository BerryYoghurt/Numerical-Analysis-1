function findMaxRelativeE=findMaxRelativeError(xprev,x)
 len=length(x);
    result=[];
     for i=1:len
        result(i)=(abs(xprev(i)-x(i))/x(i))*100; 
     end
    findMaxRelativeE=max(result);     
end
