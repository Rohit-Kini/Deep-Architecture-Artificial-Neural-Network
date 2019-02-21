%%Sign Function
function y = sgn(x)
y = zeros(size(x));
for i = 1:numel(x)
    if x(i) >= 0
        y(i) = 1;
    else
        y(i) = -1;
    end
end
end
