fname = './figures/RectangleMethodII';

A = 0;
for i = [1:5]
  A = A + (i)^2/4;
end

% Areas are 1^2/4, 2^2/4, ..., 5^2/4.
% If there are five areas, width must be 1.0, so height is same
% in magnitude as area.

x = [1:5];
xs = [0:0.1:5];
y = (1/4)*x.^2;
ys = (1/4)*xs.^2; % Smooth curve.

figure(1);clf;hold on;
plot(x,NaN*y,'b.','MarkerSize',30);
legend('y = x^2_{ }/4; x = 1,2,3,4,5_{ }','Location','NorthWest')
for i = 1:5
    p = patch([i-1,i,i,i-1],[0,0,y(i),y(i)],'g');
    set(p,'FaceAlpha',0.5);
end
plot(x,y,'b.','MarkerSize',30);
plot(xs,ys,'k.');
th = title('A = 0;for i = [1:5],A = A + i^2/4;end','FontWeight','Normal');
grid on;
set(gca,'XTick',[0:0.5:5]);
set(gca,'YTick',[0:7]);

set(findall(gcf,'-property','FontSize'),'FontSize',16)
set(findall(gcf,'-property','FontName'),'FontName','Times New Roman')
set(0,'defaultAxesFontName', 'Times New Roman')
set(0,'defaultTextFontName', 'Times New Roman')
set(th,'FontName','Monospaced')
print('-dpng','-r300',fname);
fprintf('Wrote %s.png\n',fname);
print('-dpdf',strrep(fname,'.png','.pdf'));
fprintf('Wrote %s.pdf\n',strrep(fname,'.png','.pdf'));
