clear;
addpath([pwd(),filesep(),'..',filesep(),'m']);

tol = 0.01;
a   = -1;
b   = 1;
y  = @(x) (x-0.1).^2;

xe = [-1:0.01:1];
ye = y(xe);

r  = (b-a)/3;

xl = a+r;
xr = b-r;
yr = y(xr);
yl = y(xl);

fprintf('Left Point: Value of y = %.4g at x = %.4g\n',...
        xl,yl);
fprintf('Right Point: Value of y = %.4g at x = %.4g\n',...
        xr,yr);

step = 0;
while (1)
    step = step + 1; % Step counter
    if xr - xl < tol
        fprintf('Minimum is between %0.4f and %0.4f\n',xl,xr);
        break;
    end
    figure(1);clf;hold on;grid on;

    plot(xe,ye,'-','LineWidth',2);
    plot(xl,y(xl),'r.','MarkerSize',30);
    plot(xr,y(xr),'g.','MarkerSize',30);
    title(sprintf('Step %02d; $x_{min}$ = %0.3f, $x_{max}$ = %0.3f',...
          step,xl,xr));
    xlabel('$x$');
    ylabel('$y$','Rotation',0);
    set(gca,'Box','on')
    axis([-1.1 1.1 -0.2 1.1])


    p = patch([a a a a],[-0.1 -0.1 -0.2 -0.2],...
              [0.1 0.1 0.1],'FaceAlpha',1,'EdgeAlpha',0);
    p = patch([a a a a],[-0.1 -0.1 -0.2 -0.2],...
              [0.9 0.9 0.9],'FaceAlpha',1,'EdgeAlpha',0);

    % Black circle for legend label.
    plot(xl,-0.15,'ko','MarkerSize',10);

    p = patch([a b b a],[-0.1 -0.1 -0.2 -0.2],...
        [0.1 0.1 0.1],'FaceAlpha',1,'EdgeAlpha',0);

    plot(xl,-0.15,'ro','MarkerSize',10);
    plot(xr,-0.15,'go','MarkerSize',10);

    if (yr < yl)
        a = xl;
        r  = (b-a)/3;
        xl = a+r;
        xr = b-r;
        yr = y(xr);
        yl = y(xl);
    else % yl <= yr
        b = xr;
        r  = (b-a)/3;
        xl = a+r;
        xr = b-r;
        yr = y(xr);
        yl = y(xl);
    end    

    p = patch([a b b a],[-0.02 -0.02 -0.1 -0.1],...
              [0.9 0.9 0.9],'FaceAlpha',1,'EdgeAlpha',0);

    plot(xl,-0.05,'ro','MarkerSize',10);
    plot(xr,-0.05,'go','MarkerSize',10);
    legend('$\mbox{ }y(x) = (x-0.1)^2$',...
           ' Left check point y',...
           ' Right check point y',...
           ' Region bisected in current step',...
           ' Region to bisect in next step',...
           ' Region check points',...
           'Location','North')
    saveplots(sprintf('bisection%02d',step));
end
    
