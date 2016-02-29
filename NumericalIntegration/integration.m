function integration(method, curvetype, n)

if (nargin == 0)
    integration('exponential', 2)
    integration('exponential', 4)
    integration('exponential', 2)
    integration('exponential', 4)
    integration('linear', 2)
    integration('linear', 4)
    integration('linear', 2)
    integration('linear', 4)
    return;
end

fname = sprintf('integration_%s_%s_%d.png',method, curvetype, n);    

if strcmp(method,'simpson')
    x  = linspace(0,4,2*n+1);
    h  = (x(2)-x(1));
end
if strcmp(method,'rectangle')
    x  =  linspace(0,4,n+1);
    h  = (x(2)-x(1));
end

if strcmp(curvetype,'exponential')
    eqn   = '2*exp(x)/exp(4)';
    eqns  = '2*exp(xs)/exp(4)';
    eqnl  = '2\cdote^x_{ }/e^4_{ }';
    al    = [-0.1 4.1 -0.24 2.1];

    y = eval(eqn);
    k = 1;
    for i = 1:2:length(x)-2
        Ae(k) = (2/exp(4))*(exp(x(i+2)) - exp(x(i)));
        k = k+1;
    end
end

if strcmp(curvetype,'linear')
    eqn  = '1 + x/4';
    eqns = strrep(eqn,'x','xs');
    eqnl = eqn;
    al   = [-0.1 4.1 -0.24 2.1];

    y = eval(eqn);
    k = 1;
    for i = 1:2:length(x)-2
        Ae(k) = x(i+2)-x(i) + (x(i+2)^2 - x(i)^2)/(4*2);
        k = k+1;
    end
end

% Must be multiple of 3x as many points.
xs = linspace(0,4,9*(2*n+1)); 
ys = eval(eqns); 

if strcmp(method,'simpson')
    k = 1;
    for i = 1:2:length(x)-2
        A(k)  = (h/3)*(y(i) + 4*y(i+1) + y(i+2));
        dA(k) = A(k) - Ae(k);
        k = k+1;
    end
end

if strcmp(method,'simpson')
    for i = 1:length(y)-1
        A(i) = w*y(i);
        dA(i) = A(i) - Ae(i);
    end
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
        text(x(2*i),al(3)/2,sprintf('    A = %.4f\n \\DeltaA = %.4f',...
            A(i),dA(i)), 'HorizontalAlignment','center');
    end
    axis(al)
    for i = 1:2:length(x)-2
        xq = [x(i):0.1:x(i+2)];
        a = y(i);
        b = (y(i+1)-y(i))/(x(i+1)-x(i));
        c = (1/(x(i+2)-x(i+1)))*...
            ((y(i+2)-y(i))/(x(i+2)-x(i)) - (y(i+1)-y(i))/(x(i+1)-x(i)));
        yq = a + b*(xq - x(i)) + c*(xq - x(i)).*(xq - x(i+1));
        p = patch([x(i),x(i+2),fliplr(xq)],[0,0,fliplr(yq)],'g');
        set(p,'FaceAlpha',0.5)
    end
    
    plot(xs,ys,'b','LineWidth',3);
    plot(x,y,'k.','MarkerSize',25);
    th = title(sprintf('Sums: Area = %.4f; \\DeltaA = %.4f',sum(A),sum(dA)));
    set(th,'FontWeight','normal');

    saveplots(fname);
