function rectangleplot(curvetype, n, method)

if (nargin < 3)
    method = 'left';
end

if (nargin == 0)
    C = {'linear','exponential'};
    for n = [2,4]
        for i = 1:length(C)
            rectangleplot(C{i}, n, 'left')
            rectangleplot(C{i}, n, 'middle')
            rectangleplot(C{i}, n, 'right')
        end
    end
    return
end

fname = sprintf('rectangleplot_%s_%d_%s.png',curvetype,n,method);

xg = linspace(0,4,n+1);
w  = xg(2)-xg(1);

if strcmp(method,'left')
    x = xg(1:end-1);
end
if strcmp(method,'middle')
    x = xg(1:end-1) + w/2;
end
if strcmp(method,'right')
    x = xg(1:end-1) + w;
end

if strcmp(curvetype,'exponential')
    eqn  = @(x) 2*exp(x)/exp(4);
    eqnl = '2\cdote^x_{ }/e^4_{ }'; % Label
    al   = [-0.1 4.1 -0.19 2.1];

    y = eqn(x);
    for i = 1:1:length(xg)-1
        Ae(i) = (2/exp(4))*(exp(xg(i+1)) - exp(xg(i)));
    end
end

if strcmp(curvetype,'linear')
    eqn  = @(x) 1+x/4;
    eqnl = '1 + x/4'; % Label
    al   = [-0.1 4.1 -0.19 2.1];

    y = eqn(x);
    for i = 1:1:length(xg)-1
        Ae(i) = xg(i+1)-xg(i) + (xg(i+1)^2 - xg(i)^2)/(4*2);
    end    
end

xs = linspace(0,4,10*(n+1));
ys = eqn(xs); 
yg = eqn(xg);

for i = 1:length(y)
    A(i) = w*y(i);
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
        text(xg(i)+w/2,al(3)/2,sprintf('    A = %.4f\n \\DeltaA = %.4f',...
            A(i),dA(i)), 'HorizontalAlignment','center');
    end
    axis(al)
    for i = 1:length(xg)-1
        p = patch([xg(i),xg(i+1),xg(i+1),xg(i)],[0,0,y(i),y(i)],'g');
        set(p,'FaceAlpha',0.5)
    end
    plot(xs,ys,'b','LineWidth',3);
    plot(x,y,'k.','MarkerSize',30);
    title(sprintf('Total Area = %.4f',sum(A)));
    th = title(sprintf('Sums: Area = %.4f; \\DeltaA = %.4f',sum(A),sum(dA)));
    set(th,'FontWeight','normal');

    saveplots(fname,[0:4]);