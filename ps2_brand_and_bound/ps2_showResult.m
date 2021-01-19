function showResult()
% pick best integer solution from candidnate solutions
global solution;
if isempty(solution)
    fprintf("Oops, no optimal solution found");
else
    [fval,row] = min(solution(:,end));
    fprintf("===============================================\n\n");
    fprintf("The optimal integer solution is:");
    disp(solution(row,1:(end-1)));
    fprintf("The obj value is:");
    disp(solution(row,end));
    fprintf("===============================================\n");
end
end