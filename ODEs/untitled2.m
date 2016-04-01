v=0;
dt=.1;
L=10;
t=[0:dt:3];
for i=1:length(t)-1
    %f=(-9.8 + v(i)^2/L);
    %feu = v(i) + dt*f;
    yeu(i) = v(i) + dt * (-9.8 + v(i)^2 / L );
    k1= -9.8 + v(i)^2 / L;
    k2= -9.8 + yeu(i)^2 / L;
    v(i+1)=v(i) + dt/2 * (k1 + k2);
end
figure(3)
plot(t,v,'.','MarkerSize',30)