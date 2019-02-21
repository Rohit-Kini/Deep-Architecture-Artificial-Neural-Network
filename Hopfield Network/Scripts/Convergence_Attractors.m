%%
clc
clear all %#ok<*CLALL>
%% Input 
N = 8;
x1 = [-1 -1 1 -1 1 -1 -1 1];
x2 = [-1 -1 -1 -1 -1 1 -1 -1];
x3 = [-1 1 1 -1 -1 1 -1 1];
patterns = [x1; x2; x3];
% Distorted patterns
x1d = [1 -1 1 -1 1 -1 -1 1]; %1-bit error
x2d = [1 1 -1 -1 -1 1 -1 -1]; %2-bit error 
x3d = [1 1 1 -1 1 1 -1 1]; %3-bit eror
distorted_patterns = [x1d; x2d; x3d];
%% Training Weights
w = train(patterns);
%% Converging Network
for x_1 = distorted_patterns'
    [x_2, n]= update_rule(w,x_1);
    fprintf('Input Pattern: %s\n',num2str(x_1'));
    fprintf('Output Pattern: %s\n',num2str(x_2'));
    [~,i] = ismember(x_2',patterns,'rows');
    if i>0
        fprintf('pattern matched with #%d\n', i);
    else
        fprintf('Cannot find the match\n');
    end
end
%% Attractors
% Creating all possible patterns
attractors = patterns;
all_patterns = de2bi()
for i = 0:2^N-1
    x_i = bipolar((de2bi(i, N)))';
    x_j = update_rule(w, x_i);
    if not(ismember(x_j',attractors,'rows'))
        attractors = [attractors; x_j'];
    end
end
fprintf('Attractors in the network are: %d',size(attractors,1));
