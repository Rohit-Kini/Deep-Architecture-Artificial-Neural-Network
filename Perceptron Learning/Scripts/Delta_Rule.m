% X = input pattern, T = output pattern, eta = learning rate, W = weight,
% deltaW = weight update

clc;
clear all; %#ok<*CLALL>

%%%%%%%%%% INPUT PARAMETERS %%%%%%%%%%
% Learning Rate
eta = 0.1;
% Number of epochs
epoch = 500;
% Type of Data Linearly Separable or Non Separable
Separable_data;
%Non_Separable_data;
% Shuffling Samples
T = [ones(1,100), -ones(1,100)];
shuffle = randperm(200);
x = x(:,shuffle);
T = T(:,shuffle);
[xi, ~] = size(x);
[tj, ndata] = size(T);
% Input pattern & Output Pattern
X = [x; ones(1,ndata)]; % Additional row for bias terms
% Initial weight choosen randomly from the normal distribution
W = randn(tj,xi+1);
%%%%%%%%%% ALGORITHM %%%%%%%%%%
for i=1:epoch
    % Delta Rule
    deltaW = -eta*(W*X-T)*X';
    W = W + deltaW;
    %Plot Parameters
    p = W(1, 1:2);
    k = -W(1, xi+1) / (p*p');
    l = sqrt(p*p');
    
    %plot (x(1,(T>0)),x(2,(T>0)), '*',x(1,(T<0)),x(2,(T<0)), '+',[p(1), p(1)]*k + [-p(2), p(2)]/l,[p(2), p(2)]*k + [p(1), -p(1)]/l, '-');
    A = [x(1,T>0),x(2,T>0)];
    B = [x(1,T<0),x(2,T<0)];
    error = [A+1, B-1]; 
    plot (x(1,T>0), ...
        x(2,T>0), '*', ...
        x(1,T<0), ...
        x(2,T<0), '+');
    hold on
    plot([p(1), p(1)]*k + [-p(2), p(2)]/l, ...
        [p(2), p(2)]*k + [p(1), -p(1)]/l, 'k-');
    hold off
    axis([-2, 2, -2, 2], 'square');
    drawnow
    
end
figure(2)
plot(epoch, error);