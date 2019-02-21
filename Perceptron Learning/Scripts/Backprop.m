%%%%%%%%%% BACKPROP %%%%%%%%%%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc;
% clear all; %#ok<*CLALL>
%%%%%%%%%% INPUT %%%%%%%%%%
Separable_data;
epoch = 500;
alpha = 0.9;
eta = 0.01;
Nhidden = 4;
T = [ones(1,100), -ones(1,100)];
shuffle = randperm(200);
x = x(:,shuffle);
T = T(:,shuffle);
[xi, ~] = size(x);
[tj, n] = size(T);
X = [x; ones(1,n)];
% Initialize the wieghts
w = randn(Nhidden, xi+1);
v = randn(tj, Nhidden+1);
dw = 0; dv = 0; 
error = [];     
%%%%%%%%%% ALGORITHM %%%%%%%%%%
for i=1:epoch
    % Forward Pass
    hin = w*X;
    hout = [2./(1+exp(-hin))-1; ones(1,n)]; %Transfer Function
    oin = v*hout;
    out = 2./(1+exp(-oin))-1;
    % Backward Pass
    delta_o = (out-T).*((1+out).*(1-out))*0.5;
    delta_h = (v'*delta_o).*((1+hout).*(1-hout))*0.5;
    delta_h = delta_h(1:Nhidden,:);
    % Weight Update
    dw = (dw.*alpha)-(delta_h*X').*(1-alpha);
    dv = (dv.*alpha)-(delta_o*hout').*(1-alpha);
    w = w + dw.*eta;
    v = v + dv.*eta;
    % Cost Minimization Function
    error = [error; sum(sum(abs(sign(out) - T) ./ 2))];
end
%% Plot
Nepoch = 1:epoch;
plot(Nepoch,error);
title(['Error alpha = ',num2str(alpha),' eta = ', num2str(eta),' Hidden Layers ',num2str(Nhidden)]);
%drawnow;
