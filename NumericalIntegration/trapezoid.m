
x = [0:4];
y = 1+x/4;
figure(1);clf
plot(x,y*NaN,'k','LineWidth',3);
legend(' y = 1+ x/4','Location','NorthWest')
hold on;
axis equal
grid on;
axis([-0.1 4.1 -0.1 2.1])
for i = 1:length(x)-1
    p = patch([x(i),x(i+1),x(i+1)],[y(i),y(i),y(i+1)],'r');
    set(p,'FaceAlpha',0.5)
    p = patch([x(i),x(i+1),x(i+1),x(i)],[0,0,y(i),y(i)],'g');
    set(p,'FaceAlpha',0.5)
end
plot(x,y,'k','LineWidth',3);
 
print -dpng -r300 trapezoid.png



