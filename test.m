
randomCoffMatrix = Analysis.diagDomGenerator(3);
randomCoffMatrix
randomConsMatrix = randi([0, 99], [3, 1]);
randomConsMatrix
initial = ones(3, 1);
initial
GaussSeidelSolve2(randomCoffMatrix,initial,randomConsMatrix,0.001);
%a=input('PROMPT')
%display(a)
%b=input('PROMPT')
%x=input('PROMPT')

%jacobiSolve1(a,x,b,6)
