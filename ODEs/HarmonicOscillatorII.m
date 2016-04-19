clear;

% x'' + x = f(t)
% dx/dt = v
% dv/dt = -x + f(t)
%
% x(0) = 0
% dx/dt|_{t=0} = 1

% Solution to homogeneous equation (f(t) = 0) is
% sin(t), so period = 2*pi.

% Exact solution
te = linspace(0,2*pi*3,1000);
xe = (5/3)*sin(te)-(1/3)*sin(2*te);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Forward Euler solution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Choose Dt to be much smaller than period of 2*pi
S = 100;
Dt = 2*pi/S;
t = [0:Dt:3*2*pi];

v(1) = 1;
x(1) = 0;

for i = 1:length(t)-1
    x(i+1) = x(i)+Dt*v(i);
    v(i+1) = v(i)+Dt*(-x(i)+sin(2*t(i)));
end

figure(1);clf;grid on;hold on;
   plot(te,xe,'k','LineWidth',2);
   plot(NaN,NaN,'b.','MarkerSize',10); % So dot is larger in legend
   plot(t,x,'b.');
   xlabel('t');
   ylabel('x(t)');
   legend('Exact',sprintf('Euler; Dt = $2\\pi/$%d',S),...
       'Location','NorthWest');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ODE23 solution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dydt = @(t,y) [y(2);-y(1)+sin(2*t)];
options = odeset('MaxStep',2*pi/10);
[t23,y23] = ode45(dydt,[0,2*pi*3],[0,1],options);

figure(2);clf;grid on;hold on;
   plot(te,xe,'k','LineWidth',2);
   plot(NaN,NaN,'g.','MarkerSize',10); % So dot is larger in legend
   plot(t23,y23(:,1),'g.','MarkerSize',10);
   xlabel('t');
   ylabel('x(t)');
   legend('Exact','ODE23',...
       'Location','NorthWest');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The following are optional plot formatting commands.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:2
   figure(i)
   yh = get(gca,'YLabel');
   set(yh,'Rotation',0,'VerticalAlignment','middle');
   title('$d^2x/dt^2 + x = $sin$(2t); x(0)=0, dx/dt|_{t=0} = 1$',...
       'FontWeight','normal');
   box on;
   set(gca,'XTick',[0:pi:6*pi])
   xl = cellstr(get(gca,'XTickLabel'));
   for i = 2:length(xl)
        xl{i} = sprintf('%d\\pi',i-1);
   end
   axis tight;
   set(gca,'XTickLabel',xl);
   set(gca,'YLim',[-3,3])
end

figure(1)
    saveplots('HarmonicOscillatorII_Exact_vs_Euler')
figure(2)
    saveplots('HarmonicOscillatorII_Exact_vs_ODE23')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End optional formatting commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
