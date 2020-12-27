function analysisMemory()
%MEMORY Summary of this function goes here
%   Detailed explanation goes here
    x= 1:1:20 ;
    y = (x.*(x+1))+ x;
    z = 2*(x.*(x+1))+ x;
    s = x;
    j = 2*x;
    plot(x,y)
    hold on
    plot(x,z)
    hold on
    plot(x,j)
    hold on
    plot(x,s)
    text(19,y(19)+y(19)*0.1,'Naive & Jordan & Cholesky', 'FontSize',8);
    text(19,z(19)+z(19)*0.15,'With Pivoting & Doolittle & Crout', 'FontSize',8);
    text(21,j(19)+j(19)*1,'jacobi', 'FontSize',8);
    text(21,s(19)+s(19)*1,'Seidel', 'FontSize',8);
    xlim([0 30])
    ylim([0 z(19)*1.2])
    title('Used memory versus Matrix size');
    xlabel('Matrix size');
end

