% dv/dt = 10v^2 - g
clear;

Dt = 0.01;
TMAX = 0.35;
ve(1) = 0;
te = [0:Dt:TMAX];
for i = 1:length(te)-1
    ve(i+1) = ve(i) + Dt*(10*ve(i)*ve(i) - 9.81);
end

dvdt = @(t,v) 10*v*v - 9.81;
[t23,v23] = ode23(dvdt,[0 TMAX],0);

figure(1);clf;grid on;hold on;
    plot(te,ve,'LineWidth',2);
    plot(t23,v23,'LineWidth',2);
    ylabel('v [m/s]');
    xlabel('t [seconds]');
    title('$dv/dt = 10v^2-g; v(0) = 0$','FontWeight','normal');
    legend('Forward Euler','ODE23');
    saveplots('Drag1DODE23');