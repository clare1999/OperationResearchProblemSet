%% Linear Programming
c = [-1;-1];
A = [-4 2; 4 1; 0 -2];
b = [-1; 11; -1;];
lb = [0; 0];
up = [Inf; Inf];
[x1,fval1] = linprog(c,A,b,[],[],lb,up);


%% Integer Programming
% test case 2
c = [-1;-1];
A = [-4 2; 4 1; 0 -2];
b = [-1; 11; -1;];
lb = [0; 0];
up = [Inf; Inf];
intcon = [1;2];
[x2,fval2] = intlinprog(c,intcon,A,b,[],[],lb,up);



%% Integer Programming
% test case 1
c = [-8;-5];
A = [1 1; 9 5];
b = [6; 45];
lb = [0; 0];
up = [Inf; Inf];
intcon = [1;2];
[x3,fval3] = intlinprog(c,intcon,A,b,[],[],lb,up);