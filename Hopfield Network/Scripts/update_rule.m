%% Update Rule, Function to recall original pattern
function [x_i, n] = update_rule(weight, x_j,need)
converged = false;
n = 0;
if nargin<3
    need = false;
end
if need
    while not(converged)
        x_i = sgn((weight*x_j));
        converged = isequal(x_i,x_j);
        n = n+1;
    end
else
    for i=1:5
        x_i = sgn((weight*x_j));
        n=n+1;
    end
end
end

    