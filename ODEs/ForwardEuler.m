clear
y(1) = 0;
Dt   = 0.1;

t    = [0:Dt:1];
for i = 1:length(t)-1
    y(i+1) = y(i) + Dt*t(i)*t(i);
end

ye = t.^3/3;
E = (y(end)-ye(end))/ye(end);

figure(1);clf;hold on;grid on;box on;
    plot(t,ye,'k.','MarkerSize',30);
    plot(t,y,'g.','MarkerSize',20);
    %ylabel('y','Rotation',0);
    xlabel('t');
    axis([-0.05 1.1 -0.01 0.35])
    legend('Exact Solution $y_e$',...
	   'Forward Euler Solution $y$',...
	   'Location','NorthWest');
    title('$dy/dt=t^2$')
    estr = sprintf('Error = $\\frac{y(t=1)-y_e(t=1)}{y_e(t=1)} = %.4g$',E);
    text(0.05,0.21,estr,'Interpreter','Latex')
    saveplots('ForwardEuler');

