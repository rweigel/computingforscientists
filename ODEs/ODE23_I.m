clear;
% dy/dt = -y + t*y

yo = 2;

te = [0:0.1:2];
ye = yo*exp(te.*te/2 - te);

dydt = @(t,y) -y + t*y;
[t,y] = ode23(dydt,[0,2],yo);

figure(1);clf;hold on;grid on;box on;
plot(te,ye,'k','LineWidth',2);
plot(t,y,'b.','MarkerSize',30);
legend('Exact','ODE23','Location','North');
xlabel('t');
ylabel('y','Rotation',0,'HorizontalAlignment','Right');
