% Initialize variables
clear all;
close all;
tic;
g = 9.81;           % gravity
dt = 0.01;          % time step
maxSteps = 10000;   % number of time steps
l = 1.0;            % deflection angle

% Initial values
omega0 = 1.0;
phi0 = 0.0;

phiEuler = phi0;
omegaEuler = omega0;
t = 0.0;

% Vectors for plot
yEuler = zeros(maxSteps+1,1);
tA = zeros(maxSteps+1,1);

% Set initial values
yEuler(1) = phi0;

for m=1:maxSteps
    [phiEuler, omegaEuler] = MakeStepEuler(phiEuler, omegaEuler, dt, g, l);
    
    % advance t
    t = t + dt;
    
    yEuler(m+1) = phiEuler;
    tA(m+1) = t;
end

figure
plot(tA, yEuler);
toc;