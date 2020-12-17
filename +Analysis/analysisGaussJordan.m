function analysisGaussJordan()
    counter = 1;
    li = zeros(100);
    for index = 1:100
        x = 0;
        for secIndex = 1:100
            randomMatrix = randi([0, 99], [index,index+1]);
            f = @() Gauss.gaussJordan(randomMatrix, power(10, -6));
            x = x + timeit(f);
        end
        li(counter) = x/100;
        counter = counter + 1;
    end
    plot((1:100), li);
    text(95,li(100)+li(100)*0.05,'Gauss Jordan', 'FontSize',8);
    xlim([0 120])
    ylim([0 li(100)*1.5])
    title('Gauss Jordan elapsed time versus Matrix size');
    xlabel('Matrix size');
end