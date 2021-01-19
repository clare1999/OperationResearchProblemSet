% testcase:
% a = notint([1,3,4]);
% b = notint([1.1,3,4]);
% c = notint([1,3.3,4.5]);
% d = notint([1,3,4.5]);


function index = notint(x)
% x is a vector containing descision values
% return if all elt in x are int
% 0 if all values are int, else return the index of 1st nonint
index = 0;
for i = 1:length(x)
    if x(i) ~= fix(x(i))
        index = i;
        break
    end
end
end