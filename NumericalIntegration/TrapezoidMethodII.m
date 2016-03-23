clear;
delete('TrapezoidMethodII.log');
diary('TrapezoidMethodII.log');
% Exact area
Ae = 4 + 4^2/2 + 4^3/(16*3);

% Two areas
x = linspace(0,4,3);
y = 1 + x + x.^2/16;
w = x(2) - x(1);
A = w*(0.5*y(1) + y(2) + 0.5*y(3));
fprintf('N = %3d, A exact = %.3f, A estimate = %.3f, dA = %.4f\n',2,Ae,A,A-Ae);

% Three areas
x = linspace(0,4,4);
y = 1 + x + x.^2/16;
w = x(2) - x(1);
A = w*(0.5*y(1) + y(2) + y(3) + 0.5*y(4));
% or
clear a
a(1) = w*0.5*y(1);
for i = 2:3
    a(i) = w*y(i);
end
a(4) = w*0.5*y(4);
A = sum(a);
fprintf('N = %3d, A exact = %.3f, A estimate = %.3f, dA = %.4f\n',3,Ae,A,A-Ae);

% Four areas
x = linspace(0,4,5);
y = 1 + x + x.^2/16;
w = x(2) - x(1);
A = w*(0.5*y(1) + y(2) + y(3) + y(4) + 0.5*y(5));
% or
clear a
a(1) = w*0.5*y(1);
for i = 2:4
    a(i) = w*y(i);
end
a(5) = w*0.5*y(5);
A = sum(a);
fprintf('N = %3d, A exact = %.3f, A estimate = %.3f, dA = %.4f\n',4,Ae,A,A-Ae);

% N areas
N = 100;
x = linspace(0,4,N+1);
w = x(2)-x(1);
y = 1 + x + x.^2/16;
% A = w*(0.5*y(1) + y(2) + ... + 0.5*y(N+1))

clear a
a(1) = w*0.5*y(1);
for i = 2:N
    a(i) = w*y(i);
end
a(N+1) = w*0.5*y(N+1);
A = sum(a);

fprintf('N = %3d, A exact = %.3f, A estimate = %.3f, dA = %.4f\n',N,Ae,A,A-Ae);
diary off
