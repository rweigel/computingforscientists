clear;

% dy/dt = -y + 1

% Analytic solution
ta = linspace(0,2,1000);
ya = 1-exp(-ta);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Forward Euler solution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Dt = 0.1;
teu = [0:Dt:2];

yeu(1) = 0;

for i = 1:length(teu)-1
    yeu(i+1) = yeu(i) + Dt*(-yeu(i) + 1);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ODE23 solution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dydt = @(t,y) [-y(1)+1];
t_range = [teu(1),teu(end)];
[t23,y23] = ode23(dydt,t_range,[0]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Eeu = (yeu(end)-ya(end))/ya(end);
E23 = (y23(end)-ya(end))/ya(end);

fprintf('Euler Error = %g\n',Eeu);
fprintf('ODE23 Error = %g\n',E23);

figure(1);clf;grid on;hold on;

   plot(ta,ya,'k-');
   plot(teu,yeu,'b.','MarkerSize',20);
   plot(t23,y23,'g.','MarkerSize',15);
   xlabel('t');
   ylabel('y(t)');
   legend('Exact',...
       'Euler',...
       'ODE23',...    
       'Location','NorthWest');
   yh = get(gca,'YLabel');
   set(yh,'Rotation',0,...
       'VerticalAlignment','middle',...
       'HorizontalAlignment','right');
   title('$dy/dt + y = 1; y(0)=0$',...
       'FontWeight','normal');
   box on;
   %set(gca,'YLim',[-1.9,1.9])

   saveplots('ODE23_demo')