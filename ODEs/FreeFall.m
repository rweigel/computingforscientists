clear
R_E  = 6371e3; % meters
g    = 9.8;    % meters/second
Dt   = 10;     % seconds

% Expected answer
tcga = sqrt(2*R_E/g);
fprintf('Time to reach surface with constant grav. force (analytic): %.2e [s]\n',tcga)

% Forward Euler constant gravity
tcg(1) = 0;
ycg(1) = 2*R_E;
vcg(1) = 0;
i    = 1;
t(1) = 0;
while (ycg(i) >= 0)
   tcg(i+1) = tcg(i) + Dt;
   ycg(i+1) = ycg(i) + Dt*vcg(i);
   vcg(i+1) = vcg(i) + Dt*(-g);
   i = i+1;
end
% Check y array to verify second-to-last element is >=0.
% yvg(end-1)
% yvg(end)
tcgx = tcg(end-1);

% Forward Euler variable gravity
tvg(1) = 0;
yvg(1) = 2*R_E;
vvg(1) = 0;
i      = 1;
while (yvg(i) >= 0)
    tvg(i+1) = tvg(i) + Dt;
    yvg(i+1) = yvg(i) + Dt*vvg(i);
    vvg(i+1) = vvg(i) + Dt*(-g*R_E^2)/(yvg(i)+R_E)^2;
    i = i+1;
end
tvgx = tvg(end-1);
% Check y array to verify second-to-last element is >=0.
%yvg(end-1)
%yvg(end)

fprintf('Time to reach surface with constant grav. force (euler)   : %.2e [s]\n',tcgx)
fprintf('Time to reach surface with variable grav. force (euler)   : %.2e [s]\n',tvgx)

figure(1);clf;
    hold on;grid on;box on;
    plot(tcg/60,ycg/R_E,'LineWidth',2);
    plot(tvg/60,yvg/R_E,'LineWidth',2);
    ylabel('$y/R_E$','Rotation',0,'HorizontalAlignment','Right')
    xlabel('time [minutes]')
    set(gca,'YLim',[0 2]);
    title('Forward Euler Method');
    legend('Constant gravitational force',...
            'Variable gravitational force')
    saveplots('FreeFall');
