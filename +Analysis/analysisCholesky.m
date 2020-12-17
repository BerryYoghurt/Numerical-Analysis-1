function analysisCholesky()
    counter = 1;
    liCholesky = zeros(99);
    for index = 2:100
        x = 0;
        for secIndex = 1:100
            randomCoffMatrix = randi([0, 99], [index,index]);
            randomConsMatrix = randi([0, 99], [index, 1]);
            f = @() solveCholesky(randomCoffMatrix, randomConsMatrix);
            x = x + timeit(f);
        end
        liCholesky(counter) = x/100;
        counter = counter + 1;
    end
    plot((2:100), liCholesky);
    text(98,liCholesky(99)+liCholesky(99)*0.08,'Cholesky', 'FontSize',8);
    xlim([0 120])
    ylim([0 liCholesky(99)*1.2])
    title('Time elapsed versus Matrix size');
    xlabel('Matrix size');
    ylabel('Mean time elapsed');
end

function solveCholesky(A, B)
    [L, e] = LU.Cholesky(A);
    if (~e)
        LU.solveLU(L, L', B);
    end
end