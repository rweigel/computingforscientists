clear;

% dv/dt = -2*k*(x-x10)/m
% dx/dt = v
%
% x(0) = xo
% dx/dt|_{t=0} = vo

m  = 10^6;  % kg
vo = 1;     % m/s
xo = 5000;  % m
k  = 1;     % N/m
E  = (0.5*m*vo^2);
A  = sqrt(E/k);

% Exact solution (not requested in problem statement)
w  = sqrt(2*k/m);
T  = 2*pi/w;
te = linspace(0,3*T,1000);
xe = xo + A*sin(w*te);
ve = vo*cos(w*te);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Forward Euler solution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Choose Dt to be much smaller than period T
Dt = T/100;
t = [0:Dt:3*T];

v(1) = vo;
x(1) = xo;

for i = 1:length(t)-1
    x(i+1) = x(i) + Dt*v(i);
    v(i+1) = v(i) - Dt*(2*k/m)*(x(i)-xo);
end

KE = 0.5*m*v.^2;
PE = 0.5*(2*k)*(x-xo).^2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1);clf;grid on;hold on;
   plot(te,xe,'k','LineWidth',2);
   plot(NaN,NaN,'b.','MarkerSize',10); % So dot is larger in legend
   plot(t,x,'b.');
   xlabel('t [s]');
   ylabel('x(t) [m]');
   legend('Exact',sprintf('Euler; \\Delta t = %g s',T),...
       'Location','NorthWest');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2);clf;grid on;hold on;
   plot(te,ve,'k','LineWidth',2);
   plot(NaN,NaN,'b.','MarkerSize',10); % So dot is larger in legend
   plot(t,v,'b.');
   xlabel('t [s]');
   ylabel('v(t) [m]');
   legend('Exact',sprintf('Euler; \\Delta t = %g s',T),...
       'Location','NorthWest');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3);clf;grid on;hold on;
   plot(t,KE,'k','LineWidth',2);
   plot(t,PE,'b','LineWidth',2);
   plot(t,KE+PE,'g','LineWidth',2);
   plot(t,E*ones(size(t)),'m','LineWidth',2);
   xlabel('t [s]');
   legend('KE [J] (Euler)','PE [J] (Euler)',...
       'KE + PE [J] (Euler)','KE + PE [J] (Analytic)',...
       'Location','NorthWest');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
