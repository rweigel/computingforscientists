% Heun's method solution of
% dv/dt = -g + v^2/L
% with
% v(1) = 0 m/2, g = 9.8 m/s^2, and L = 10 m.

% Exact solution for L -> Inf
% v(t) = -g*t

% http://people.uncw.edu/hermanr/mat361/ODEBook/ODE1.pdf

clear;
addpath([pwd(),filesep(),'..',filesep(),'m']);

g    = 9.8;
L    = 10.0;
v(1) = 0;
Dta  = 0.1./10.^[0:4];

for j = 1:length(Dta)
        
    Dt   = Dta(j);

    fprintf('Computing for Dt = %.0e\n',Dt);

    t    = [0:Dt:3];
    
    tic();
    for i = 1:length(t)-1
        % ve(i+1) is Forward Euler estimate of velocity
        veu(i+1) = v(i) - g*Dt + (Dt/L)*v(i)*v(i);
        v(i+1)   = v(i) - g*Dt + (Dt/L)*(veu(i+1)^2 + v(i)^2)/2.0;
    end
    ct(j) = toc();
    
    vlast(j) = v(end);

	f = @(t,v) (v(1)*v(1)/L-g);

    tic();
    [t45,v45] = ode45(f,t,0);
    ct45(j) = toc();
    
    v45last(j) = v45(end);
    
    if (j == 1)
        vex = -g*t;

        figure(1);clf;grid on;hold on;
            plot(t,vex,'k.','MarkerSize',25);
            plot(t,v,'b.','MarkerSize',25);
            plot(t45,v45,'k.','MarkerSize',10);
            plot([0,3],[-sqrt(98),-sqrt(98)],'-');
            xlabel('$t$ [s]');
            ylabel('$v$ [m/s]');
            title('$dv/dt = -g + v^2/L; v(0) = 0$ [m/s]; $\Delta t = 0.1$')
            legend('Exact Solution to $dv/dt = -g$',...
                   'Heun''s Method Solution',...
                   'ODE45 Solution',...
                   'Exact terminal velocity',...
                   'Location','SouthWest');
            saveplots('HeunI');
    end
end

E = abs( (vlast - vlast(end))/vlast(end) );
E45 = abs( (v45last - v45last(end))/v45last(end) );

figure(2);clf
    loglog(Dta,E,'k.','MarkerSize',30);
    grid on;hold on;
    loglog(Dta,E45,'b.','MarkerSize',30);
    xlabel('$\Delta t$ [s]');
    ylabel('Error');
    title('Error = $|y(end)-y(end;\Delta t = 10^{-4})|/|y(end;\Delta t = 10^{-4})|$');
    legend('Heun','ODE45','Location','NorthWest');
    saveplots('HeunIError');

figure(3);clf
    loglog(Dta,ct,'k.','MarkerSize',30);
    grid on;hold on;
    loglog(Dta,ct45,'b.','MarkerSize',30);
    xlabel('$\Delta t$ [s]');
    ylabel('Evaluation Time [s]');
    legend('Heun','ODE45','Location','NorthWest');
    saveplots('HeunITime');
    