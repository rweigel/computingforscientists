clear;
t = [0:0.2:0.4];
dt = t(2)-t(1);
y(1) = 0;
for i = 1:length(t)-1
    y(i+1) = y(i) + dt*t(i);
end

te = [0:0.01:t(end)];
ye = te.^2/2;

figure(1);clf;
    plot(t,y,'k.','MarkerSize',30);
    hold on;grid on;
    plot(te,ye,'b','LineWidth',2);
    xlabel('t');
    ylabel('y(t) ','Rotation',0,'HorizontalAlignment','Right');
    r = (t(2)-t(1))/(te(2)-te(1));

       
    plot([te(1) te(21)],NaN*[ye(1) ye(1)],'r--','LineWidth',3)
    plot([te(21) te(41)],NaN*[ye(21) ye(21)],'g--','LineWidth',3)

    plot([-0.08 0.08],[0 0],'r--','LineWidth',2)

    %dy/dt = t
    % delta = dy/dt*dt
    delta = (te(31)-te(11))*(te(31)-te(21));
    plot([te(11) te(31)],[ye(21)-delta ye(21)+delta],'g--','LineWidth',2)
    legend('\mbox{ }Approximate soln. with $\Delta t = 0.2$',...
            '\mbox{ }Exact soln. to $dy/dt = t; y(0) = 0$',...
            '\mbox{ }$dy/dt |_{t=0} = 0$',...
            '\mbox{ }$dy/dt |_{t=\Delta t} = 0.04$',...
            'Location','NorthWest');
    legend boxoff
    text(0,-0.005,'$y(0)$');
    text(0.15,-0.005,'$y_a(\Delta t) = y(0) + \Delta t \frac{dy}{dt}|_{t=0}$');
    text(0.30,0.034,'$y_a(2\Delta t) = y_a(\Delta t) + \Delta t \frac{dy}{dt}|_{t=\Delta t}$');
    text(0.4,0.085,'$y = t^2/2$','Color','Blue');
    axis([-0.1 0.65 -0.01 0.1]);
    
 saveplots('overview.png')