x = [1,2,3];
y = [2,4,5];
xo = 0.25;
yo = 0.75;
zstr = 'z';
%interp1(x,y,1.6)

figure(1);clf;grid on;hold on;
    plot(x,y,'k.','MarkerSize',30);
    axis equal
    axis([0.5 3.5 0.5 5.5]);
    set(gca,'XTick',[1:3])
    set(gca,'YTick',[1:5])
    xlabel('x');
    box on;
    ylabel('y','Rotation',0,'HorizontalAlignment','Right');
    saveplots('interpolation1D_part1')

figure(2);clf;grid on;hold on;
    plot(x,y,'k.','MarkerSize',30);
    axis equal
    axis([0.5 3.5 0.5 5.5]);
    set(gca,'XTick',[1:3])
    set(gca,'YTick',[1:5])
    xlabel('x');
    box on;
    ylabel('y','Rotation',0,'HorizontalAlignment','Right');
    plot([1 2],[2 2],'b','LineWidth',3);
    plot([2 2],[2 4],'b','LineWidth',3);
    plot([1 2],[2 4],'b','LineWidth',3);
    text(1.4,1.5,'1.0','Color','b','FontWeight','bold');
    text(2.2,3.0,'2.0','Color','b','FontWeight','bold');
    plot([1 1.6],[2 2],'g','LineWidth',1);
    plot([1.6 1.6],[2 3.2],'g','LineWidth',1);
    plot([1 1.6],[2 3.2],'g','LineWidth',1);
    text(1.2,1.8,'0.6','Color','g','FontWeight','bold');
    text(1.7,2.5,'?','Color','g','FontWeight','bold');
    saveplots('interpolation1D_part2')