function [ phi, omega ] = MakeStepEuler( phi, omega, dt, g, l )
%MakeStepEuler Calculate one Euler step
%   Detailed explanation goes here
    
% The Equations are:
% 
% dw/dt = -g/l*sin(phi)
% => dw = [-g/l*sin(phi)].dt  (eq1)
%
% w = d(phi)/dt
% => d(phi) = w.dt      (eq2)

eq1 = inline('(-g/l)*sin(p)');
eq2 = inline('om');

om = omega + dt*eq1(g,l,phi);
p = phi + dt*eq2(omega);
omega=om;
phi=p;
end

