function tree = branchbound(mainNode)
global solution upperBound;

if isempty(mainNode)
    %fprintf("Empty Input");
    return;
else
    %fprintf("Get input");
    tree{1} = mainNode;
    tree{2} = [];
    tree{3} = [];
    [x,fval,exitflag] = linprog(mainNode{1},mainNode{2},mainNode{3},...
    mainNode{4},mainNode{5},mainNode{6},mainNode{7}); 
end

if exitflag ~= 1  % check if LP yield a solution
    %fprintf("LP yield a solution");
    return;
elseif fval > upperBound % check if branching this node is worth cosidering
    return;
elseif ~notint(x) % check if all desicions are integers
    upperBound = min(upperBound,fval);
    solution = [solution;[x',fval]];
else  % branching
    pos = notint(x);
    lbleft = mainNode{6};  
    upright = mainNode{7};
    lbleft(pos) = ceil(x(pos)); % strict constraint on left lower bound
    upright(pos) = floor(x(pos));  % strict constraint on right upper bound
    tree{2} = branchbound({mainNode{1},mainNode{2},mainNode{3},...
    mainNode{4},mainNode{5},lbleft,mainNode{7}});
    tree{3} = branchbound({mainNode{1},mainNode{2},mainNode{3},...
    mainNode{4},mainNode{5},mainNode{6},upright});
end
end