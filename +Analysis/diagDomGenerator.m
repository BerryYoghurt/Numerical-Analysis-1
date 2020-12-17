function [ A ] = diagDomGenerator(n)
    A = randi([10, 99], [n, n]);
    s = sum(A, 2);
    for i = 1:n
        A(i, i) = s(i) + 1;
    end
end