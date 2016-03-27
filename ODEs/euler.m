clear
a     = 1;
y(1) = 0;
Dt   = 0.1;

t    = [0:Dt:1];
for i = 1:length(t)-1
    y(i+1) = y(i) + Dt*a*t(i);
end
% or, compute the t array in the for loop
% Must choose Dt so 1/Dt is integer to ensure last value of y
% computed is for t = 1.0
t(1) = 0;
for i = 1:1/Dt-1
    y(i+1) = y(i) + Dt*a*t(i);
    t(i+1) = t(i) + Dt;    
end

% Exact solution
te = linspace(0,1,1000);
ye = te.^2/2;

figure(1);clf
    plot(t,y,'k.','MarkerSize',30);
    hold on;grid on;
    plot(te,ye,'b-');
    xlabel('t')
    ylabel('y','Rotation',0,'HorizontalAlignment','Right')
    title('dy/dt = t; y(t=0) = 0; dt = 0.1');
    legend('Euler Method Soln','Exact Soln','Location','NorthWest');

saveplots('euler.png')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
a    = 1;
y(1) = 0;  
Dta  = 0.1./10.^[0:5];
% or
%Dta = [0.1,0.01,0.001,0.0001];

for k = 1:length(Dta)
 Dt   = Dta(k);
 t    = [0:Dt:1];
 for i = 1:length(t)-1
    y(i+1) = y(i) + Dt*a*t(i);
 end
 ye = t.^2/2;
 E(k) = abs( (y(end)-ye(end))/ye(end) );
 fprintf('Dt = %.4g, Error = %.4g\n',Dt,E(k));
end

figure(2)
    loglog(Dta,E,'k.','MarkerSize',30);
    grid on;
    title('dy/dt = t; y(t=0) = 0;');    
    xlabel('$\Delta t$');
    legend('Error = $| \frac{y_{euler}(t=1.0)-y_{exact}(t=1.0)}{y_{exact}(t=1.0)} |$',...
        'Location','NorthWest')
    ylabel('Error');

saveplots('euler_error.png')