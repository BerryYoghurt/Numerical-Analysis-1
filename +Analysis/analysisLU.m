function analysisLU()
    counter = 1;
    liDoolittle = zeros(99);
    liCrout = zeros(99);
    for index = 2:100
        x = 0;
        y = 0;
        for secIndex = 1:100
            randomCoffMatrix = randi([0, 99], [index,index]);
            randomConsMatrix = randi([0, 99], [index, 1]);
            f = @() solveDoolittle(randomCoffMatrix, randomConsMatrix);
            x = x + timeit(f);
            f = @() solveCrout(randomCoffMatrix, randomConsMatrix);
            y = y + timeit(f);
        end
        liDoolittle(counter) = x/100;
        liCrout(counter) = y/100;
        counter = counter + 1;
    end
    plot((2:100), liDoolittle);
    hold on
    plot((2:100), liCrout);
    text(98,liDoolittle(99)+liDoolittle(99)*0.08,'Doolittle', 'FontSize',8);
    text(98,liCrout(99)+liCrout(99)*0.08,'Crout', 'FontSize',8);
    xlim([0 120])
    ylim([0 liCrout(99)*1.2])
    title('Time elapsed versus Matrix size');
    xlabel('Matrix size');
    ylabel('Mean time elapsed');
end

function solveDoolittle(A, B)
    [L, U, e] = LU.Doolittle(A);
    if (~e)
        LU.solveLU(L, U, B);
    end
end

function solveCrout(A, B)
    [L, U, e] = LU.Crout(A);
    if (~e)
        LU.solveLU(L, U, B);
    end
end