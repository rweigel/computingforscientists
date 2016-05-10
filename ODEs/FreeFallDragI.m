clear
R_E = 6371e3; % meters
g   = 9.8;    % meters/second
Dt = 10;     % seconds
L = 1e6;
y(1) = 2*R_E;
v(1) = 0;
i = 1;
while (y(i)-R_E >= 0)
   y(i+1) = y(i) + Dt*v(i);
   v(i+1) = v(i) + Dt*(-g);
   i = i+1;
end
tcg = i*Dt;
ycg = y;
vcg = v;

% Expected answer
te = sqrt(2*R_E/g);
fprintf('Time to reach 1 R_E with constant grav. exact: %.2e [s]\n',te)
fprintf('Time to reach 1 R_E with constant grav.: %.2e [s]\n',tcg)

clear v y
R_E = 6371e3; % meters
g   = 9.8;    % meters/second
Dt = 10;   % seconds
y(1) = 2*R_E;
v(1) = 0;
i = 1;
while (y(i)-R_E >= 0)
   y(i+1) = y(i) + Dt*v(i);
   v(i+1) = v(i) + Dt*(-g*R_E^2/(y(i)+R_E)^2);
   i = i+1;
end
tvg = i*Dt;
yvg = y;
vvg = v;

fprintf('Time to reach 1 R_E with variable grav.: %.2e [s]\n',tvg)

figure(1);clf;hold on;grid on;box on;
plot([0:length(ycg)-1]*Dt/60,ycg/R_E,'LineWidth',2);
plot([0:length(yvg)-1]*Dt/60,yvg/R_E,'LineWidth',2);
ylabel('y/R_E','Rotation',0,'HorizontalAlignment','Right')
xlabel('time [minutes]')
set(gca,'YLim',[1 2])
legend('Constant gravitational force','Variable gravitational force')