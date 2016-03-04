clear
diary('TrapezoidMethodI.log');
Ae = 4 + 4^3/(16*3);
x = [0:4];
y = 1 + x.^2/16;
w = 1.0;
a(1) = w*y(1) + 0.5*w*(y(2)-y(1)); % Area of first trapezoid
a(2) = w*y(2) + 0.5*w*(y(3)-y(2));
a(3) = w*y(3) + 0.5*w*(y(4)-y(3));
a(4) = w*y(4) + 0.5*w*(y(5)-y(4));
A4w = sum(a);

fprintf('Answer w/o a for loop  A = %0.3f (A-Ae = %g)\n',A4w,A4w-Ae);

for i = 1:4
  a(i) = w*y(i) + 0.5*w*(y(i+1)-y(i));
end
A4wo = sum(a);
fprintf('Answer with a for loop A = %0.3f (A-Ae = %g)\n',A4wo,A4wo-Ae);

fprintf('Exact area            Ae = %0.3f\n',Ae);

% To determine minimum number of trapezoids, generalize for loop
% code to work for arbitrary number of areas. First test with
% N = 4.

N = 4;
w = 4/N;
x = [0:w:4];
y = 1 + x.^2/16;
for i = 1:N
  a(i) = w*y(i) + 0.5*w*(y(i+1)-y(i));
end
A = sum(a);

fprintf('N = %2d, A = %0.3f (A-Ae = %g)\n',N,A,A-Ae);

for N = 5:20
    w = 4/N;
    x = [0:w:4];
    y = 1 + x.^2/16;
    for i = 1:N
      a(i) = w*y(i) + 0.5*w*(y(i+1)-y(i));
    end
    A = sum(a);
    fprintf('N = %2d, A = %0.3f (A-Ae = %g)\n',N,A,A-Ae);
    if (A-Ae) < 0.01
        break; % Stop executing for loop.
    end
end
if (N == 20) && (A-Ae) >= 0.01
    fprintf('Minimum number of trapezoids is greater than %d\n',N);
else
    fprintf('Minimum number of trapezoids: %d\n',N);
end

% Check answer: 
% A = w*(0.5*y(1) + y(2) + ... + 0.5*y(N+1))
N = 9;
w = 4/N;
x = [0:w:4];
y = 1 + x.^2/16;

Ac = w*(0.5*y(1) + y(2) + y(3) + y(4) + y(5) + y(6) + y(7) + y(8) + y(9) + 0.5*y(10));
fprintf('A9 - A9check = %g\n',A-Ac);
diary off;


