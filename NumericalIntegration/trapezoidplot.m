function trapezoidplot(curvetype, n, showlines)

if (nargin == 3)
    showlines = 1;
else
    showlines = 0;
end

if (nargin == 0)
    trapezoidplot('quadratic', 2)
    trapezoidplot('quadratic', 4)
    trapezoidplot('exponential', 2)
    trapezoidplot('exponential', 4)
    trapezoidplot('linear', 2)
    trapezoidplot('linear', 2, 1)
    trapezoidplot('linear', 4)
    return;
end

if (showlines)
    fname = sprintf('trapezoidplot_wlines_%s_%d.png',curvetype,n);
else
    fname = sprintf('trapezoidplot_%s_%d.png',curvetype,n);    
end

x  = linspace(0,4,n+1);
w  = x(2)-x(1);

if strcmp(curvetype,'exponential')
    eqn  = @(x) 2*exp(x)/exp(4);
    eqnl = '2\cdote^x_{ }/e^4_{ }';
    al   = [-0.1 4.1 -0.19 2.1];

    y = eqn(x);
    for i = 1:1:length(x)-1
        Ae(i) = (2/exp(4))*(exp(x(i+1)) - exp(x(i)));
    end
end

if strcmp(curvetype,'linear')
    eqn  = @(x) 1 + x/4;
    eqnl = '1 + x/4';
    al   = [-0.1 4.1 -0.19 2.1];

    y = eqn(x);
    for i = 1:1:length(x)-1
        Ae(i) = x(i+1)-x(i) + (x(i+1)^2 - x(i)^2)/(4*2);
    end    
end

if strcmp(curvetype,'quadratic')
    eqn  = @(x) 1 + x/8 + x.^2/32;
    eqnl = '1 + x/8 + x^2_{ }/32';
    al   = [-0.1 4.1 -0.19 2.1];

    y = eqn(x);
    for i = 1:1:length(x)-1
        Ae(i) = x(i+1)-x(i) + (x(i+1)^2 - x(i)^2)/(4*2);
    end    
end

xs = linspace(0,4,10*(n+1));
ys = eqn(xs); 

for i = 1:length(y)-1
    A(i) = w*y(i) + 0.5*w*(y(i+1)-y(i));
    dA(i) = A(i) - Ae(i);
end

figure(1);clf
    plot(xs,ys*NaN,'b','LineWidth',3);
    hold on;
    plot(x,y*NaN,'k.','MarkerSize',20);
    lh = legend(sprintf(' %s',eqnl),'Location','NorthWest');
    set(lh,'Box','Off');
    xlabel('x')
    hold on;
    grid on;
    for i = 1:length(A)
        text(x(i)+w/2,al(3)/2,sprintf('    A = %.4f\n \\DeltaA = %.4f',...
            A(i),dA(i)), 'HorizontalAlignment','center');
    end
    axis(al)
    for i = 1:length(x)-1
        p = patch([x(i),x(i+1),x(i+1),x(i)],[0,0,y(i+1),y(i)],'g');
        set(p,'FaceAlpha',0.5)
        if (showlines)
            plot([x(i),x(i+1)],[y(i),y(i)],'k-');
        end
    end
    plot(xs,ys,'b-','LineWidth',3);
    plot(x,y,'k.','MarkerSize',25);
    title(sprintf('Total Area = %.4f',sum(A)));
    th = title(sprintf('Sums: Area = %.4f; \\DeltaA = %.4f',sum(A),sum(dA)));
    set(th,'FontWeight','normal');

    saveplots(fname,x);