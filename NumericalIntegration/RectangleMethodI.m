% Equation of line y = x
% For four rectangles, w = 1;

clear;
w = 1;
a(1) = w*0;
a(2) = w*1;
a(3) = w*2;
a(4) = w*3;
sum(a)

clear;
w = 1.0;
for i = 1:4
  a(i) = w*(i-1);
end
sum(a)

% For eight rectangles, w = 0.5;
clear;
w = 0.5;
a(1) = w*0;
a(2) = w*0.5;
a(3) = w*1.0;
a(4) = w*1.5;
a(5) = w*2.0;
a(6) = w*2.5;
a(7) = w*3.0;
a(8) = w*3.5;
sum(a)

% In above, area number (i) is related to height according to
% h = (i-1)/2.0.  So we can write an equivalent for loop:

clear;
w = 0.5;
for i = 1:8
  a(i) = w*(i-1)/2.0;
end
sum(a)

% Now, compare the two for loops

clear;
w = 1.0;
for i = 1:4
  a(i) = w*(i-1);
end
sum(a)

clear;
w = 0.5;
for i = 1:8
  a(i) = w*(i-1)/2.0;
end
sum(a)

% It appears that w is halved, the number of iterations doubles and the
% denominator in the area equation is halved.  We can generalize this to

clear;
n = 100; % or n = 1;
w = 1/n;
for i = 1:4*n
  a(i) = w*(i-1)/(n);
end
format long
sum(a)

% And verify that when n = 1 and n = 2, we get the same result as the two
% for loops for w = 1.0 and w = 0.5.

% The manual way of determining the number of iterations required is to
% guess value of n until the estimated is greater than or equal to 7.99
% (the exact area is 8.0 and this method always underestimates the exact

% answer for this particular curve).  Doing so gives

n = 199, w = 1/199, sum(a) = 7.98994975
n = 200, w = 1/200, sum(a) = 7.99000000
n = 201, w = 1/201, sum(a) = 7.99004975

% so the required width is w = 1/200

% The automated way of doing this is to use a for loop:

clear
for n = 1:1000 % Guess the maximum value
  w = 1/n;
  for i = 1:4*n
    a(i) = w*(i-1)/n;
  end
  fprintf('n = %4d, Estimated area = %.8f\n',n,sum(a));
  if abs(sum(a) - 8) <= 0.01
    break; % Stop execution of outer for loop (loop over n)
  end
end