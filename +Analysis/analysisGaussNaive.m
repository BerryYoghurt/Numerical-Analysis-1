function analysisGaussNaive()
    counter = 1;
    liGauss = zeros(100);
    for index = 1:100
        x = 0;
        for secIndex = 1:100
            randomMatrix = randi([0, 99], [index,index+1]);
            f = @() Gauss.gauss(randomMatrix, power(10, -6));
            x = x + timeit(f);
        end
        liGauss(counter) = x/100;
        counter = counter + 1;
    end
    plot((1:100), liGauss);
    text(98,liGauss(100)+liGauss(100)*0.08,'Gauss Naive', 'FontSize',8);
    xlim([0 120])
    ylim([0 liGauss(100)*1.2])
    title('Time elapsed versus Matrix size');
    xlabel('Matrix size');
    ylabel('Mean time elapsed');
end