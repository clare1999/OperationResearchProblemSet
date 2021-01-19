k = 1;
Fk = fib(k);
while Fk<10^8
    k = k+1;
    Fk = fib(k);
    disp(k);
    disp(Fk);
end


function f = fib(n)
%  to calculate fibonacci series
%  n: the nth element of fibonacci series
if n>2
    f = fib(n-1)+fib(n-2);
else
    f = 1;
end
end
