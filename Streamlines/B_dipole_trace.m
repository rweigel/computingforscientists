function X = B_dipole_trace(xo,yo,zo,ds)
% B_DIPOLE_TRACE Dipole field lines
%
%    X = B_dipole_trace(xo,yo,zo,ds) Returns a cell array. Each element
%    contains a Nx3 matrix with rows of the position of the field line.
%    
%    X{1} positions are generated using forward Euler integration
%    X{2} positions are generated using an analytic formula
%    X{3} positions are generated using an analytic formula
%
%    See also: B_DIPOLE_TRACE_DEMO, B_DIPOLE.
    
% Default initial conditions
if (nargin == 0)
    xo = 2;
    yo = 0;
    zo = 0;
    ds = 0.01; % Step size for Euler. Change to negative to go other direction.
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Numerical solution: Forward Euler integration method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N    = 100; % Number of steps
x(1) = xo;
y(1) = yo;
z(1) = zo;
for i = 1:N
  Bxyz   = B_dipole([x(i),y(i),z(i)]);
  B      = sqrt(Bxyz(1)^2 + Bxyz(2)^2 + Bxyz(3)^2);
  x(i+1) = x(i) + ds*Bxyz(1)/B;
  y(i+1) = y(i) + ds*Bxyz(2)/B;
  z(i+1) = z(i) + ds*Bxyz(3)/B;
end
X(1) = {[x',y',z']};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exact solution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ro    = sqrt(xo^2 + yo^2 + zo^2);
theta = (pi/180)*[90:150]';
r     = ro*(sin(theta)).^2;
x     = r.*sin(theta);
y     = 0.*theta;
z     = r.*cos(theta);
X(2) = {[x,y,z]};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Numerical solution: ODE23 integration method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[s,tmp] = ode23('B_dipole',[0,5],[xo;yo;zo]);
% Sum of ds values, S, should be close to sf = 0.4. 
% However, this seems to hold only for small sf.  Why?
dtmp = diff(tmp);
S    = sum(magrows(diff(tmp))); 
X(3) = {tmp};
