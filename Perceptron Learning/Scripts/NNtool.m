a        = 0.2;     % value for a in eq (1)
b        = 0.1;     % value for b in eq (1)
tau      = 25;		% delay constant in eq (1)
x0       = 1.5;		% initial condition: x(t=0)=x0
deltat   = 1;	    % time step size (which coincides with the integration step)
sample_n = 1505;	% total no. of samples, excluding the given initial condition
interval = 1;	    % output is printed at every 'interval' time steps
time = 0;
index = 1;
history_length = floor(tau/deltat);
x_history = zeros(history_length, 1); % here we assume x(t)=0 for -tau <= t < 0
x_t = x0;

X = zeros(sample_n+1, 1); % vector of all generated x samples
T = zeros(sample_n+1, 1); % vector of time samples

for i = 1:sample_n+1,
    X(i) = x_t;
    if (mod(i-1, interval) == 0),
         disp(sprintf('%4d %f', (i-1)/interval, x_t));
    end
    if tau == 0,
        x_t_minus_tau = 0.0;
    else
        x_t_minus_tau = x_history(index);
    end

    x_t_plus_deltat = mackeyglass_rk4(x_t, x_t_minus_tau, deltat, a, b);

    if (tau ~= 0),
        x_history(index) = x_t_plus_deltat;
        index = mod(index, history_length)+1;
    end
    time = time + deltat;
    T(i) = time;
    x_t = x_t_plus_deltat;
end
%%
final_input = [];
final_output = [];
for t =301:1:1500
    input = [X(t-20); X(t-15); X(t-10); X(t-5); X(t)];
    output = [X(t+5)];
    final_input = [final_output; input];
    final_output = [final_output; output];    
end
%% 
target = [];
for i=301:1:1504
    tr = X(i);
    target = [target; tr];
end
