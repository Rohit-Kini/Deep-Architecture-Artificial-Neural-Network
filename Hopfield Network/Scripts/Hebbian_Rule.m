%%
clc
clear all %#ok<*CLALL>
%% Input

%% Training Weights
w = train(patterns);
%% Converging Network
for x_i = patterns'
    [x_j, n]= update_rule(w,x_i);
    fprintf('Input Pattern: %s\n',num2str(x_i'));
    fprintf('Output Pattern: %s\n',num2str(x_j'));
    fprintf('Iterations Converged in : %d\n',n);
end


