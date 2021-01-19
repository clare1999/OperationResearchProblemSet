% Get the optimal solution by using fminsearch
x_star = fminsearch(@xz,[-1 0]);
disp(x_star);
y_star = xz(x_star);
disp(y_star);


% Initialize the function
syms x y z a
% f1 = x^2 - 5*x*y + y^4 - 25*x - 8*y;
% f2 = subs(f,{y},{z/7})
f2 = x^2 - (5*x*z)/7 - 25*x + z^4/2401 - (8*z)/7;  % object function
g2 = gradient(f2);   % gradient of obj function
h2 = hessian(f2);
e2 = eig(h2);
xk = [0; 0]; % the initial guess
count = 1; % counter for times tried
fprintf("The %d time try\n",count); % display


while (xz(xk)-y_star)>0.000001  % test if the trial is close to the optimal solution
    count = count + 1; 
    xk1 = xk - a*g2; % xk1 according to steepest descent method
    fxya = subs(f2,{x,z},{xk1(1),xk1(2)}); % subs the obj function with xk1
    fa = subs(fxya,{x,z},{xk(1),xk(2)}); 
    a_value = double(solve(diff(fa,a),'Real',true));
    xk = double(subs(xk1,{x,z,a},{xk(1),xk(2),a_value})); 
    fprintf("The %d time try\n",count);
    fprintf("Solution: \n")
    disp(xk);
    fprintf("Object value: %8.4f\n",double(xz(xk)));
    e2_value = double(subs(e2,{z},{xk(2)}));
    A2_value = max(e2_value);
    a2_value = min(e2_value);
    fprintf("Condition number: %8.4f\n\n",A2_value/a2_value);
end



function b = xz(v)
x = v(1);
z = v(2);
b = x^2 - (5*x*z)/7 - 25*x + z^4/2401 - (8*z)/7;
end