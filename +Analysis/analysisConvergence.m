function analysisConvergence()
    counter = 1;
    liGauss = zeros(20);
    liJacobi = zeros(20);
    for index = 1:20
        x = 0;
        y = 0;
        for secIndex = 1:100
            randomCoffMatrix = Analysis.diagDomGenerator(index);
            randomConsMatrix = randi([10, 99], [index, 1]);
            initial = ones(index, 1);
            [~, g, ~] = Iterative.GaussSeidelSolve2(randomCoffMatrix,initial,randomConsMatrix,0.001);
            x = x + g;
            [~, j, ~] = Iterative.jacobiSolve2(randomCoffMatrix,initial,randomConsMatrix,0.001);
            y = y + j;
        end
        liGauss(counter) = x/100;
        liJacobi(counter) = y/100;
        counter = counter + 1;
    end
    plot((1:20), liGauss);
    hold on
    plot((1:20), liJacobi);
    text(19,liGauss(20)+liGauss(20)*3,'Gauss Seidel', 'FontSize',8);
    text(19,liJacobi(20)+liJacobi(20)*0.08,'Jacobi', 'FontSize',8);
    xlim([0 30])
    ylim([0 liJacobi(20)*1.2])
    title('Iterations to converge versus Matrix size');
    xlabel('Matrix size');
    ylabel('Mean number of iterations to converge');
end