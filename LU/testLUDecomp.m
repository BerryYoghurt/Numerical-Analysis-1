% test LU Decomposition Algorithms
syms a b c d e f g h k l o p q r s t

SymmNum3 = [6 15 55; 15 55 225; 55 225 979];
SymmNum6 = [SymmNum3 SymmNum3; SymmNum3 SymmNum3];
SymmSym3 = [a b c; b d e; c e f];
SymmSym6 = [SymmSym3 SymmSym3; SymmSym3 SymmSym3];

ANum3 = [];
ANum5 = [];
ASym3 = [];
ASym5 = [];

%% Test 1: Cholesky 3x3
[L,e] = Cholesky(SymmNum3);
assert(e == false);
assert(L*L' == SymmNum3);

[L,e] = Cholesky(SymmSym3);
assert(e == false);
assert(L*L' == SymmSym3);


%% Test 2: Cholesky 6x6
[L,e] = Cholesky(SymmNum6);
assert(e == false);
assert(L*L' == SymmNum6);

[L,e] = Cholesky(SymmSym6);
assert(e == false);
assert(L*L' == SymmSym6);
