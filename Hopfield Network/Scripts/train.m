%% Function for Training Weights
function [w] = train(patterns,bias)
[~,N] = size(patterns);
if nargin>1 && bias
    % In case of bias term
    w = patterns'*patterns;
else
    % Without bias
    w = (patterns'*patterns)./N;
end
end
