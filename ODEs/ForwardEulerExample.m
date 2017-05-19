% Forward Euler solution to dy/dt = at from t=0 through t = 0.3
% in steps of ?t = 0.1.
clear
a    = 0.9;
Dt   = 0.1; % ?t

% Forward Euler method.
% "fe" in variable names indicate that it is a Forward Euler solution
tfe(1) = 0;
yfe(1) = 1.1;
for i = 1:3 % Note that last value of y calculated is y(4)
    tfe(i+1) = tfe(i) + Dt;    
    yfe(i+1) = yfe(i) + Dt*a*tfe(i);
end

% Exact solution.
% "ex" in variable names indicate that it is an exact solution
a = 0.9;
tex = linspace(0,0.3,1000); % Create 1000 points between 0 and 0.3 inclusive.
yex = a*tex.^2/2 + 1.1;     % Compute exact solution at those points.

figure(1);clf
    % Show approximate (Forward Euler) solution as dots.
    % Increase dot size to 30 so more visible.
    plot(tfe,yfe,'k.','MarkerSize',30); 
    hold on;grid on;
    % Plot exact solution as connected lines so that it appears continuous.
    plot(tex,yex,'b-'); 
    xlabel('$t$');
    ylabel('$y$ ','Rotation',0,'HorizontalAlignment','Right');
    title('$dy/dt = 0.9t; y(t=0) = 1.1; \Delta t = 0.1$');
    legend('Euler Method Soln.','Exact Soln.','Location','NorthWest');

saveplots('ForwardEulerExample')