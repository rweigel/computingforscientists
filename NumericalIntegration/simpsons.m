clear;
xs  = [0:0.1:4];
ys = 1 + xs.^2/16;

x  = [0:4];
y  = 1 + x.^2/16;

w = 1;
a(1) = (w/3)*(y(1) + 4*y(2) + y(3));
a(2) = (w/3)*(y(3) + 4*y(4) + y(5));
A = sum(a)
4 + 4^3/(16*3)

break
figure(1);clf;hold on;
plot(xs,ys,'k','LineWidth',3);
plot(x,y,'b.','MarkerSize',30);
legend(' y = 1 + x^2/16',' y = 1 + x^2/16; x = [0:4]','Location','NorthWest')
hold on;
axis equal
grid on;
axis([-0.1 4.1 -0.1 2.1])
for i = 1:2:length(x)-2
    a = find(xs == x(i));
    b = find(xs == x(i+2))
    p = patch([xs(a:b),x(i+2),x(i)],[ys(a:b),0,0],'g');
    set(p,'FaceAlpha',0.5)
end
print -dpng -r300 simpsons.png

