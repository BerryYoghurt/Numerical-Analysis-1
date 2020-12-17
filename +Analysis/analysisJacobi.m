function analysisJacobi()
    counter = 1;
    li = zeros(100);
    for index = 1:100
        x = 0;
        for secIndex = 1:10
            randomCoffMatrix = randi([0, 99], [index,index]);
            randomConsMatrix = randi([0, 99], [index, 1]);
            initial = ones(index, 1);
            f = @() Iterative.jacobiSolve1(randomCoffMatrix,initial,randomConsMatrix,100);
            x = x + timeit(f);
        end
        li(counter) = x/10;
        counter = counter + 1;
    end
    plot((1:100), li);
    text(98,li(100)+li(100)*0.08,'Jacobi', 'FontSize',8);
    xlim([0 120])
    ylim([0 li(100)*1.2])
    title('Time elapsed versus Matrix size');
    xlabel('Matrix size');
    ylabel('Mean time elapsed');
end