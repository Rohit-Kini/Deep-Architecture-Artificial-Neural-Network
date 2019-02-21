%%%%%%%%%% FUNCTION APPROXIMATION %%%%%%
%%% ndata = number of patterns, n = number of nodes in hidden layer, alpha =
%%% momentum, eta = learning rate, 
%%% 
%%
%%% Generate a Gaussian Function %%%
x_x=[-5:0.5:5]';
y_y=[-5:0.5:5]';
z=exp(-x_x.*x_x*0.1)*exp(-y_y.*y_y*0.1)'-0.5;
[zi,zj] = size(z);
ndata = zi*zj;
mesh(x_x,y_y,z);
%%% Convert into patterns as training data %%%
targets = reshape(z,1,ndata);
[xx, yy] = meshgrid(x_x,y_y);
patterns = [reshape(xx,1,ndata);reshape(yy,1,ndata)];
%%% Shuffling %%%
permute = randperm(ndata);
X = patterns(:,permute);
Y = targets(:,permute);
[ti, tj] = size(T);
%%% Input Parameters %%%
n = 1;
x = X(:,1:n);
y = Y(:,1:n);
[xi, xj] = size(x);
epoch = 5000;
alpha = 0.9;
eta = 0.15;
Nhidden = 5;
% Initialize the wieghts
w = randn(Nhidden, xi+1);
v = randn(ti, Nhidden+1);
dw = 0; dv = 0; error = [];
%% Algorithms
for i=1:epoch
    % Forward Pass
    hin = w*[x;ones(1,xj)];
    hout = [2./(1+exp(-hin))-1; ones(1,xj)]; %Transfer Function
    oin = v*hout;
    out = 2./(1+exp(-oin))-1;
    % Backward Pass
    delta_o = (out-y).*((1+out).*(1-out))*0.5;
    delta_h = (v'*delta_o).*((1+hout).*(1-hout))*0.5;
    delta_h = delta_h(1:Nhidden,:);
    % Weight Update
    dw = (dw.*alpha)-(delta_h*[x;ones(1,xj)]').*(1-alpha);
    dv = (dv.*alpha)-(delta_o*hout').*(1-alpha);
    w = w + dw.*eta;
    v = v + dv.*eta;
    % Cost Minimization Function
    error = [error; sum(sum(abs(sign(out) - y) ./ 2))];
end
%% Plot
A = 1:epoch;
plot(A,error);
hin = w*[patterns;ones(1,ndata)];
hout = [2./(1+exp(-hin))-1; ones(1,ndata)]; %Transfer Function
oin = v*hout;
out = 2./(1+exp(-oin))-1;
zz = reshape(out,zi,zj);
mesh(x_x,y_y,zz);
axis([-5 5 -5 5 -0.7 0.7]);
drawnow;