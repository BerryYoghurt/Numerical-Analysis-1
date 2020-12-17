function analysisIterativeMethodsTime()
    counter = 1;
    liGauss = zeros(100);
    liJacobi = zeros(100);
    for index = 1:100
        x = 0;
        y = 0;
        for secIndex = 1:10
            randomCoffMatrix = randi([0, 99], [index,index]);
            randomConsMatrix = randi([10, 99], [index, 1]);
            initial = ones(index, 1);
            f = @() Iterative.GaussSeidelSolve1(randomCoffMatrix,initial,randomConsMatrix,100);
            x = x + timeit(f);
            f = @() Iterative.jacobiSolve1(randomCoffMatrix,initial,randomConsMatrix,100);
            y = y + timeit(f);
        end
        liGauss(counter) = x/10;
        liJacobi(counter) = y/10;
        counter = counter + 1;
    end
    plot((1:100), liGauss);
    hold on
    plot((1:100), liJacobi);
    text(98,liGauss(100)+liGauss(100)*0.08,'Gauss Seidel', 'FontSize',8);
    text(98,liJacobi(100)+liJacobi(100)*0.08,'Jacobi', 'FontSize',8);
    xlim([0 120])
    ylim([0 liJacobi(100)*1.2])
    title('Time elapsed versus Matrix size');
    xlabel('Matrix size');
    ylabel('Mean time elapsed');
end