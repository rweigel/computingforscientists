clear;
E = 2*(exp(4) - exp(0))/exp(4);
n = [2^1, 2^2, 2^3, 2^4, 2^5, 2^6, 2^7, 2^8]; % Or n = 2.^[1:8];

fname = 'exponential_estimate.png';

diary('exponential_estimate.log');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rectangles ("left" rule)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% n = 2
w  = 2;
x  = [0:w:4];
y  = 2*exp(x)/exp(4);
A(1) = w*(y(1) + y(2));
fprintf('Rectangle method n = 2; long-hand:  A = %.4f\n',A(1));
% or
A(1) = w*sum(y(1:end-1));
fprintf('Rectangle method n = 2; vectorized: A = %.4f\n',A(1));

% n = 4
w  = 1;
x  = [0:w:4];
y  = 2*exp(x)/exp(4);
A(2) = w*(y(1) + y(2) + y(3) + y(4));
fprintf('Rectangle method n = 4; long-hand:  A = %.4f\n',A(2));
% or
A(2) = w*sum(y(1:end-1));
fprintf('Rectangle method n = 4; vectorized: A = %.4f\n',A(2));

% Etc.  Generalization is

for i = 1:length(n)
    w  = 4/n(i);
    x  = [0:w:4];
    y  = 2*exp(x)/exp(4);
    A(i) = w*sum(y(1:end-1));
    errR(i) = A(i)-E;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('\n');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Trapezoids
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% n = 2
clear A
w  = 2;
x  = [0:w:4];
y  = 2*exp(x)/exp(4);

yt = y;
yt(1)   = 0.5*y(1);
yt(end) = 0.5*y(end);
A(1) = w*sum(yt);
fprintf('Trapezoid method n = 2; vectorized: A = %.4f\n',A(1));
% or
A(1) = w*(0.5*y(1) + y(2) + 0.5*y(3));
fprintf('Trapezoid method n = 2; long-hand:  A = %.4f\n',A(1));

% n = 4
w  = 1;
x  = [0:w:4];
y  = 2*exp(x)/exp(4);

yt = y;
yt(1)   = 0.5*y(1);
yt(end) = 0.5*y(end);
A(2) = w*sum(yt);
fprintf('Trapezoid method n = 4; vectorized: A = %.4f\n',A(2));
% or
A(2) = w*(0.5*y(1) + y(2) + y(3) + y(4) + 0.5*y(5));
fprintf('Trapezoid method n = 4; long-hand:  A = %.4f\n',A(2));

% n = 8
w  = 1/2;
x  = [0:w:4];
y  = 2*exp(x)/exp(4);

yt = y;
yt(1)   = 0.5*y(1);
yt(end) = 0.5*y(end);
A(3) = w*sum(yt);
%fprintf('Trapezoid method n = 8; vectorized:  A = %.4f\n',A(3));
% or
A(3) = w*(0.5*y(1) + y(2) + y(3) + y(4) + y(5) ...
            + y(6) + y(7) + y(8) + 0.5*y(9));
%fprintf('Trapezoid method n = 8; long-hand:   A = %.4f\n',A(3));

% Etc. Generalization of vector method:

for i = 1:length(n)
    w  = 4/n(i);
    x  = [0:w:4];
    y  = 2*exp(x)/exp(4);
    yt = y;
    yt(1)   = 0.5*y(1);
    yt(end) = 0.5*y(end);
    A(i) = w*sum(yt);
    errT(i) = A(i)-E;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('\n');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simpson's
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% n = 2;
clear A;
w  = 2;
h  = w/2;
x  = [0:h:4];
y  = 2*exp(x)/exp(4);

% A(1) = (h/3)*(y(1) + 4*y(2) + y(3)   +   y(3) + 4*y(4) + y(5) ) 
% or, simplified as 
A(1) = (h/3)*(y(1) + 4*y(2) + 2*y(3) + 4*y(4) + y(5));
fprintf('Simpson''s method n = 2; long-hand:  A = %.4f\n',A(1));
% or as a for loop
s = 0;
for i = 2:length(y)-1
    if (mod(i,2) == 0)
        s = s + 4*y(i);
    else
        s = s + 2*y(i);
    end
end
A(1) = (h/3)*(y(1) + s + y(end));
fprintf('Simpson''s method n = 2; for loop:   A = %.4f\n',A(1));

% Or using vectorization:
f = ones(1,length(y) ); % Muliplication factor.
f([2:2:length(y)-1]) = 4;
f([3:2:length(y)-2]) = 2;
A(1) = (h/3)*sum(f.*y);
fprintf('Simpson''s method n = 2; vectorized: A = %.4f\n',A(1));
fprintf('Coefficient array:\n');
f

% n = 4;
w  = 1;
h  = w/2;
x  = [0:h:4];
y  = 2*exp(x)/exp(4);
% A(2) = (h/3)*(y(1) + 4*y(2) + y(3)   
%           +   y(3) + 4*y(4) + y(5) 
%           +   y(5) + 4*y(6) + y(7)
%           +   y(7) + 4*y(8) + y(9))
% or, simplified as 
A(2) = (h/3)*(y(1) + 4*y(2) + 2*y(3) + 4*y(4) + 2*y(5) + 4*y(6) + 2*y(7) + 4*y(8) + y(9));
fprintf('Simpson''s method n = 4; long-hand:  A = %.4f\n',A(2));

% or as a for loop
s = 0;
for i = 2:length(y)-1
    if (mod(i,2) == 0)
        s = s + 4*y(i);
    else
        s = s + 2*y(i);
    end
end
A(2) = (h/3)*(y(1) + s + y(end));
fprintf('Simpson''s method n = 4; for loop:   A = %.4f\n',A(2));

% Or using vectorization:
f = ones(1,length(y)); % Muliplication factor.
f([2:2:length(y)-1]) = 4;
f([3:2:length(y)-2]) = 2;
A(2) = (h/3)*sum(f.*y);
fprintf('Simpson''s method n = 4; vectorized: A = %.4f\n',A(2));
fprintf('Coefficient array:\n');
f

% Etc. Generalization of vector method:

for i = 1:length(n)
    w  = 4/n(i);
    h  = w/2;
    x  = [0:h:4];
    y  = 2*exp(x)/exp(4);
    f = ones(1,length(y));
    f([2:2:length(y)-1]) = 4;
    f([3:2:length(y)-2]) = 2;
    A(i) = (h/3)*sum(f.*y);
    errS(i) = A(i)-E;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Note that number of terms in sum is 
% N = n + 1 for Rectangle and Trapezoid
% N = 2n + 1 for Simpson's
% An alternantive plot is with N on x-axis or, better, average
% time to calculate on x-axis.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(1);clf
n2 = log2(n);
semilogy(n2,abs(errR)*100/E,'r.','MarkerSize',20);
hold on;
semilogy(n2,abs(errT)*100/E,'k.','MarkerSize',20);
semilogy(n2,abs(errS)*100/E,'b.','MarkerSize',20);
grid on;
xlabel(sprintf('\n\n# of areas')) % \n to push down
ylabel('Error');
title('Error = 100\cdotabs(A - A_o)/A_o, A_o = 2(e^4 - e^0)/e^4, y = 2e^x/e^4 for 0 \leq x \leq 4')
legend('Rectangle Method','Trapezoid Method','Simpson''s Method',...
        'Location','SouthWest');

% Overlay connecred lies to make slope easier to determine visually.
semilogy(n2,abs(errR)*100/E,'r-');
semilogy(n2,abs(errT)*100/E,'k-');
semilogy(n2,abs(errS)*100/E,'b-');

set(gca,'YTick',10.^[-9:3])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modify x axis labeling.
% Based on http://stackoverflow.com/a/3884669
set(gca, 'XTickLabel',[]); % suppress current x-labels
xt = get(gca, 'XTick');
yl = get(gca, 'YLim');
% space after ^ to center vertically
str = cellstr( num2str(xt(:),'2^{%d^ }') );  
hTxt = text(xt, yl(ones(size(xt))), str, ... 
    'Interpreter','tex', ...                 
    'VerticalAlignment','top', ...           
    'HorizontalAlignment','center');         
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

set(findall(gcf,'-property','FontSize'),'FontSize',14)

diary off

print('-dpng','-r300',fname);
fprintf('Wrote %s\n',fname);
print('-dpdf',strrep(fname,'.png','.pdf'));
fprintf('Wrote %s\n',strrep(fname,'.png','.pdf'));
