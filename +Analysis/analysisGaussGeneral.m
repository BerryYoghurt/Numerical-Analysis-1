function analysisGaussGeneral()
    counter = 1;
    liNaive = zeros(100);
    liJordan = zeros(100);
    liPivoting = zeros(100);
    for index = 1:100
        x = 0;
        y = 0;
        z = 0;
        for secIndex = 1:100
            randomMatrix = randi([0, 99], [index,index+1]);
            f = @() Gauss.gauss(randomMatrix, power(10, -6));
            x = x + timeit(f);
            f = @() Gauss.gaussJordan(randomMatrix, power(10, -6));
            y = y + timeit(f);
            f = @() Gauss.gaussWithPivoting(randomMatrix, power(10, -6));
            z = z + timeit(f);
        end
        liNaive(counter) = x/100;
        liJordan(counter) = y/100;
        liPivoting(counter) = z/100;
        counter = counter + 1;
    end
    plot((1:100), liNaive);
    hold on
    plot((1:100), liJordan);
    hold on
    plot((1:100), liPivoting);
    text(98,liNaive(100)+liNaive(100)*0.08,'Naive', 'FontSize',8);
    text(98,liJordan(100)+liJordan(100)*0.08,'Jordan', 'FontSize',8);
    text(98,liPivoting(100)+liPivoting(100)*0.08,'With Pivoting', 'FontSize',8);
    xlim([0 120])
    ylim([0 liPivoting(100)*1.2])
    title('Gauss elapsed time comparison versus Matrix size');
    xlabel('Matrix size');
end