E = exp(4) - exp(0);
n = [2^1, 2^2, 2^3, 2^4, 2^5, 2^6, 2^7, 2^8]; % Or n = 2.^[1:8];

% n = 2
w  = 2;
x  = [0:w:4];
y  = exp(x);

yt = y;
yt(1)   = 0.5*y(1);
yt(end) = 0.5*y(end);
A(1) = w*sum(yt);
% or
A(1) = w*(0.5*y(1) + y(2) + 0.5*y(3));

% n = 4
w  = 1;
x  = [0:w:4];
y  = exp(x);

yt = y;
yt(1)   = 0.5*y(1);
yt(end) = 0.5*y(end);
A(1) = w*sum(yt);
% or
A(2) = w*(0.5*y(1) + y(2) + y(3) + y(4) + 0.5*y(5));

% n = 8
w  = 1/2;
x  = [0:w:4];
y  = exp(x);

yt = y;
yt(1)   = 0.5*y(1);
yt(end) = 0.5*y(end);
A(3) = w*sum(yt);
% or
A(3) = w*(0.5*y(1) + y(2) + y(3) + y(4) + y(5) + y(6) + y(7) + y(8) + 0.5*y(9));

% Etc.

for i = 1:length(n)
    w  = 4/n(i);
    x  = [0:w:4];
    y  = exp(x);
    yt = y;
    yt(1)   = 0.5*y(1);
    yt(end) = 0.5*y(end);
    A(i) = w*sum(yt);
    errT(i) = A(i)-E;
end

figure(1);clf
loglog(n,errT*100/E,'k.',n,errT*100/E,'k-','MarkerSize',20,'LineWidth',2);
grid on;
xlabel('# of areas')
legend('Trapezoid Method % Error');
hold on;

break
% http://stackoverflow.com/a/3884669
plot(log2(x), y)                               %# plot on log2 x-scale
set(gca, 'XTickLabel',[])                      %# suppress current x-labels

xt = get(gca, 'XTick');
yl = get(gca, 'YLim');
str = cellstr( num2str(xt(:),'2^{%d}') );      %# format x-ticks as 2^{xx}
hTxt = text(xt, yl(ones(size(xt))), str, ...   %# create text at same locations
    'Interpreter','tex', ...                   %# specify tex interpreter
    'VerticalAlignment','top', ...             %# v-align to be underneath
    'HorizontalAlignment','center');           %# h-aligh to be centered