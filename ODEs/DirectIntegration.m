clear;
% y(N) = y(1) + sum of f(t) from 1 to N-1

% Method 1 (inefficient)
y1(1) = 0;
Dt   = 0.1;
t = [0:Dt:1];
for i = 1:length(t)-1
    s = 0;
    for j = 1:i
        s = s + Dt*t(j)^2;
    end
    y1(i+1) = y1(1) + s;
end

% Method 2
y2(1) = 0;
Dt   = 0.1;
s = 0;
t = [0:Dt:1];
for i = 1:length(t)-1
    s = s + Dt*t(i)^2;
    y2(i+1) = y2(1) + s;
end

% Method 3
y3(1) = 0;
Dt   = 0.1;
s = y3(1);
t = [0:Dt:1];
for i = 1:length(t)-1
    s = s + Dt*t(i)^2;
    y3(i+1) = y3(1) + s;
end

% Method 4 (Forward Euler, for comparison)
y4(1) = 0;
Dt   = 0.1;
t = [0:Dt:1];
for i = 1:length(t)-1
    y4(i+1) = y4(i) + Dt*t(i)^2;
end

ye = t.^3/3;
E = (y3(end)-ye(end))/ye(end);

figure(1);clf;hold on;grid on;box on;
    plot(t,ye,'k.','MarkerSize',30);
    plot(t,y1,'b.','MarkerSize',20);
    plot(t,y2,'g.','MarkerSize',15);
    plot(t,y3,'r.','MarkerSize',10);
    plot(t,y4,'k.','MarkerSize',5);
    xlabel('t');
    axis([-0.05 1.1 -0.01 0.35])
    legend('Exact Solution $y_e$',...
	   'Numerical Integration Method 1',...
	   'Numerical Integration Method 2',...
	   'Numerical Integration Method 3',...
	   'Forward Euler',...
	   'Location','NorthWest');
    title('$dy/dt=t^2$')
    estr = sprintf('Error = $\\frac{y(t=1)-y_e(t=1)}{y_e(t=1)} = %.4g$',E);
    text(0.05,0.15,estr,'Interpreter','Latex')
    saveplots('DirectIntegration');

% Method 3
Dta = [0.1, 0.01, 0.001, 0.0001, 0.00001, 1e-6];
for k = 1:length(Dta)
    Dt = Dta(k);
    y3(1) = 0;
    s = y3(1);
    t = [0:Dt:1];
    for i = 1:length(t)-1
        s = s + Dt*t(i)^2;
        y3(i+1) = y3(1) + s;
    end
    E(k) = abs( (y3(end) - ye(end))/ye(end) );
    fprintf('Dt = %.2g E = %.2g\n',Dta(k),E(k));
end

figure(2);clf
    loglog(Dta,E,'k.','MarkerSize',30);
    grid on;hold on;
    xlabel('$\Delta t$ [s]');
    ylabel('Error');
    legend('Direct Integration','Location','NorthWest');
    saveplots('DirectIntegrationError');

