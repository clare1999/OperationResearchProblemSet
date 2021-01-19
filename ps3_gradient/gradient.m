% Steepest Descent Method(Gradient Method)
% standard form
H = [10 -1; -1 10];
c = [-11;11];
A = [];
b = [];
Aeq = [];
beq = [];
lb = [];
[x_star,fval_star] = quadprog(H,c,A,b,Aeq,beq,lb);
objval_star = fval_star + 11;


% plotting
clear, clc, close all
x = -5:0.5:5; 
y = -5:0.5:5; 
[X,Y] = meshgrid(x,y);
Z = 5*X.*X+5*Y.*Y-X.*Y-11.*X+11.*Y+11; 
surf(X,Y,Z);

% question 1: first order necessary condition
syms x y 
f = 5*x^2+5*y^2-x*y-11*x+11*y+11;
g = gradient(f, [x, y]);
[x_star,y_star] = solve(g);
fval = subs(f,{x,y},[x_star,y_star]);

% question 2: prove convexity
H = [10 -1; -1 10];
det(H);

% question 3:condition number and covergence ratio
e = eig(H);
A = max(e);
a = min(e);
r = A/a; 
cov1 = ((r-1)/(r+1))^2; 
cov2 = ((A-a)/(A+a))^2; 

% question 4: steepest descent method
H = [10 -1; -1 10];
c = [-11;11];
xk = [0;0];
time = log(10^(-11)/11) / log(0.01)

gk = H*xk - c; 
ak = (gk'*gk)/(gk'*H*gk);
xk1 = xk - ak*gk;
count = 1;

while 0.5*xk1'*H*xk1-xk1'*c > 10^(-11)
    xk = xk1;
    gk = H*xk - c; 
    ak = (gk'*gk)/(gk'*H*gk);
    xk1 = xk - ak*gk;
    count = count+1;
end


Ex = 0.5*(xk-x_star)'*H*(xk-x_star);






