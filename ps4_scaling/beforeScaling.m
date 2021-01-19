% Get the optimal solution by using fminsearch
x_star = fminsearch(@xy,[-1 0]);
disp(x_star); %  3.0000 20.0000  
y_star = xy(x_star);
disp(y_star);  % -340.0000

% Initialize the function
syms x y z a
f1 = x^2 - 5*x*y + y^4 - 25*x - 8*y;  % object function
g1 = gradient(f1);   % gradient of obj function
h1 = hessian(f1);
e1 = eig(h1);
xk = [0; 0]; % the initial guess
count = 1; % counter for times tried
fprintf("The %d time try\n",count); % display


while (xy(xk)-y_star)>0.000001  % test if the trial is close to the optimal solution
    count = count + 1; 
    xk1 = xk - a*g1; % xk1 according to steepest descent method
    fxya = subs(f1,{x,y},{xk1(1),xk1(2)}); % subs the obj function with xk1
    fa = subs(fxya,{x,y},{xk(1),xk(2)}); % susb fxya with value in xk
    a_value = double(solve(diff(fa,a),'Real',true)); % calculate optimal a
    xk = double(subs(xk1,{x,y,a},{xk(1),xk(2),a_value})); % update xk
    fprintf("The %d time try\n",count);
    fprintf("Solution: \n");
    disp(xk);
    fprintf("Object value: %8.4f\n",double(xy(xk)));
    e1_value = double(subs(e1,{y},{xk(2)}));
    A1_value = max(e1_value);
    a1_value = min(e1_value);
    fprintf("Condition number: %8.4f\n\n",A1_value/a1_value);
end


function b = xy(v)
x = v(1);
y = v(2);
b = x^2 - 5*x*y + y^4 - 25*x - 8*y;
end
