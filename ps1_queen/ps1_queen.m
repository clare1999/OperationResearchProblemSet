clc;
clear;
global condense_board solution n;
n = 8; 
solution = 1;
condense_board = zeros(1,n);
search_at_depth(1);


function search_at_depth(y1)
% y1: row to be check
global condense_board solution n;
if y1>= 1 && y1 <= 8
    for x1 = 1:n
        condense_board(y1) = x1;
        flag = true;
        for y2 = 1:(y1-1)
            x2 = condense_board(y2);
            if  (x1 == x2) || ((y1+x1) == (y2+x2)) || ((y1-x1) == (y2-x2))
                flag = false;
                break
            end           
        end
        if flag
            search_at_depth(y1+1);
        end
    end
elseif y1 >8
    fprintf("The %dth solution\n",solution);
    board = zeros(8);
    for y = 1:n
        x = condense_board(y);
        board(y,x) = 1;
    end
    disp(board)
    solution = solution + 1;
else
    fprintf("Out of board. Depth: %d\n",depth);
end
end
