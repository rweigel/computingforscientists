
ForwardEulerExample

plot([tex(1) tex(21)],NaN*[yex(1) yex(1)],'r--','LineWidth',3)
plot([tex(21) tex(41)],NaN*[yex(21) yex(21)],'g--','LineWidth',3)

plot([-0.08 0.08],[1.1 1.1],'r--','LineWidth',2)

yexact = @(t) a*t^2/2 + 1.1;
plot([Dt-Dt/2,Dt+Dt/2],[yexact(Dt)-a*(Dt)*Dt/2,yexact(Dt)+a*(Dt)*Dt/2],'g--','LineWidth',2)
legend(' Forward Euler Soln.',...
        ' Exact Soln. $y = t^2/2 + 1.1$',...
        ' $dy/dt |_{t=0} = 0$',...
        ' $dy/dt |_{t=\Delta t} = 0.1$',...
        'Location','NorthWest');
legend boxoff
text(0,-0.005,'$y(0)$');
text(0.1,1.1+0.0005,'$y(0.1) = y(0) + \Delta t \frac{dy}{dt}|_{t=0}$');
text(0.15,1.1095,'$y(0.2) = y(0.1) + \Delta t \frac{dy}{dt}|_{t=0.2}$');
axis([-0.1 0.35 1.099 1.1105]);
    
saveplots('ForwardEulerExampleDiscussion')