%% Step 0: initialization
clear; 
clc;
global solution upperBound;
upperBound = inf;
solution = [];

%% Step 2: LP relaxation
% test case 1
%c = [-8;-5];
%A = [1 1; 9 5];
%b = [6; 45];

% test case 2
c = [-1;-1];
A = [-4 2; 4 1; 0 -2];
b = [-1; 11; -1;];
Aeq = [];
beq = [];
lb = [0; 0];
up = [Inf; Inf];
mainNode = {c,A,b,Aeq,beq,lb,up};
[x,fval1,exitflag] = linprog(mainNode{1},mainNode{2},mainNode{3},...
    mainNode{4},mainNode{5},mainNode{6},mainNode{7});


%% Step 3 check LP relaxation solution and apply branch-and-bound method
if exitflag ~= 1  % LP relaxation has no feasible solution, hence IP either
    fprintf("No optimal Solution");
elseif x(1) == fix(x(1)) && x(2) == fix(x(2)) % LP relaxation yield integer solution
    fprintf("Optimal Solution Found: ");
    disp(x)
elseif x(1) ~= fix(x(1)) % x1 is not integer 
    fprintf("LP relaxtion doesnt give the integer solution.\n");
    fprintf("We apply the brand-and-bound method here.\n");
    tree = branchbound({c,A,b,Aeq,beq,lb,up});
    showResult();
else  % x1 is integer but x2 is not
    fprintf("LP relaxtion doesnt give the integer solution.\n");
    fprintf("We apply the brand-and-bound method here.\n");
    tree = branchbound({c,A,b,Aeq,beq,lb,up});
    showResult();
end



