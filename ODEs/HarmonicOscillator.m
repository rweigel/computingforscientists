clear;

% x'' + x = f(t)
% dv/dt = -x + f(t)
% dx/dt = v
%
% x(0) = 0
% dx/dt|_{t=0} = 1

% Solution to homogeneous equation (f(t) = 0) is
% sin(t), so period = 2*pi.

% Plot exact solution
t = linspace(0,2*pi*3,1000);
xe = sin(t);

figure(1);clf;grid on;hold on;
   plot(t,xe,'k','LineWidth',2);
   xlabel('t');
   ylabel('x(t)','Rotation',0,'VerticalAlignment','middle');
   title('$d^2x/dt^2 + x = 0; x(0)=0, dx/dt|_{t=0} = 1$',...
       'FontWeight','normal');
   box on;
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   % The following are optional plot formatting commands.
   set(gca,'XTick',[0:pi:6*pi])
   xl = cellstr(get(gca,'XTickLabel'));
   for i = 2:length(xl)
        xl{i} = sprintf('%d\\pi',i-1);
   end
   axis tight;
   set(gca,'XTickLabel',xl);
   % End optional formatting commands
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Compute Forward Euler solution

% Choose Dt to be much smaller than period of 2*pi
S = 100;
Dt = 2*pi/S;
t = [0:Dt:3*2*pi];

v(1) = 1;
x(1) = 0;

for i = 1:length(t)-1
    v(i+1) = v(i)-Dt*x(i);
    x(i+1) = x(i)+Dt*v(i);
end

plot(t,x,'b','LineWidth',2);
legend('Exact',...
    sprintf('Euler; Dt = $2\\pi/$%d',S),...
    'Location','NorthWest');
set(gca,'YLim',[-1.9,1.9])
saveplots('HarmonicOscillator_Exact')

