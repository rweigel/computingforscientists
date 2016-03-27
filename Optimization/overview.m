clear;
addpath([pwd(),filesep(),'..',filesep(),'m']);

Dx = 0.1;        % Increment size of x values
x  = [-1:Dx:1];  % x values to check
y  = (x-0.1).^2; % Function to find minimum of

ymin = Inf;
xmin = NaN;

for i = 1:length(x)
    if y(i) < ymin
        ymin = y(i);
        xmin = x(i);
    end
end

% Vectorized version of for loop.
[ymin,imin] = min(y);
xmin = x(imin);

fprintf('Minimum value of y = %.2g at x = %.4f\n',...
        ymin,xmin);
    
figure(1);clf;hold on;grid on;
    plot(x,y,'k.','MarkerSize',30);
    plot(xmin,ymin,'g.','MarkerSize',22);
    legend('$y(x) = x^2$','Minimum location',...
           'Location','North');
    axis([-1.1 1.1 -0.1 1.1]);
    set(gca,'Box','on');
    saveplots('overview');