clear;
% Expected compression
% (k/2)*y^2 = (10-y)*g*m;
% (k/2)*y^2 + m*g*y - 10*g*m = 0;
% roots([k/2,m*g,-10*m])



k = 10;  % N/m
h = 10;  % m
g = 9.8; % m/s^2
m = 1;   % kg
Tx = sqrt(2*h/g); % Time to take to hit spring

% Numerical
t = 0;
i = 1;
y(1) = 10;
v(1) = 0;
dt = 0.0001;
while t(i) < 5.5
    if (y(i) > 0)
        v(i+1) = v(i) - g*dt;
        y(i+1) = y(i) + v(i)*dt;
    else
        v(i+1) = v(i) - (g/m)*dt - (k/m)*y(i)*dt;
        y(i+1) = y(i) + v(i)*dt;
    end
    t(i+1) = t(i) + dt;
    i = i+1;
end

% Analytic, while on spring
w = sqrt(k/m); % Natural frequency
T = 2*pi/w;
vo = g*Tx; % Speed when it hits/leaves spring
ya(1) = h;

% Numerically compute time on spring and add it to time in free fall.
% Note that this time can be computed analytically.
f = @(t) -(vo/w)*sin(w*t) + (m*g/k)*cos(w*t) - m*g/k;
x = fzero(f,[0.1,1.5]);
Tx2 = Tx + x;

for i = 1:length(t)
    if t(i) < Tx
        ya(i) = h-0.5*g*t(i)*t(i);
        va(i) = -g*t(i);
    elseif t(i) > Tx2
        ya(i) = vo*(t(i)-Tx2)-0.5*g*(t(i)-Tx2)^2;
        va(i) = vo-g*(t(i)-Tx2);
    else
        ya(i) = -(vo/w)*sin(w*(t(i)-Tx))+(m*g/k)*cos(w*(t(i)-Tx)) - m*g/k;
        va(i) = -vo*cos(w*(t(i)-Tx))-(m*g/k)*sin(w*(t(i)-Tx));    
    end
end


clf;
plot(t,ya,'b');
hold on;grid on;
plot(t,y,'r');
%plot(t,y-ya,'g')
sum(y(end)-ya(end))
xlabel('t [s]');
ylabel('y [m]');



