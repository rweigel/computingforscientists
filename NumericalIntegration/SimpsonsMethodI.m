clear;
x = [0:4];
h = 1;
y = 1 + x + x.^2/16;

a(1) = (h/3)*(y(1) + 4*y(2) + y(3));
a(2) = (h/3)*(y(3) + 4*y(4) + y(5));
A = sum(a);

Ae = 4 + 4^2/2 + 4^3/(16*3); 

fprintf('N = 2, A - Aexact = %g\n',Ae-A);
% N = 2, A - Aexact = 1.77636e-15

% Simpon's method gives exact answer for area when the
% curve is quadratic (y = a + bx + cx^2).
% N = 1 is minimal number of areas required.

x = [0:2:4];
h = 2;
y = 1 + x + x.^2/16;

A = (h/3)*(y(1) + 4*y(2) + y(3));
fprintf('N = 1, A - Aexact = %g\n',Ae-A);
% N = 1, A - Aexact = 1.77636e-15

% Any error is due to machine precision in method of calculation.
% Can use direct substitution of
% y(1) = 1 + 0 + 0^2/16
% y(2) = 1 + 2 + 2^2/16
% y(3) = 1 + 4 + 4^2/16
% into
% A = (h/3)*(y(1) + 4*y(2) + y(3));
% and some re-arrangement to show this is same as
% A = 4 + 4^2/2 + 4^3/(16*3).

% Or use MATLAB to do the algebra.
format rat
Ae = 4 + 4^2/2 + 4^3/(16*3)       % Gives 40/3
Ae = (h/3)*(y(1) + 4*y(2) + y(3)) % Gives 40/3

       