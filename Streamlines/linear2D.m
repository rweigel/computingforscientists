x = [ 1, 1, 2, 2];
y = [ 1, 2, 1, 2];
H = [10,20,30,40];

figure(1);clf;grid on;hold on;
    plot(x,y,'k.','MarkerSize',40)
    for i = 1:length(x)
	text(x(i)+0.1,y(i),...
	     sprintf('H = %d',H(i)),...
	     'FontSize',16);
    end
    xlabel('x')
    ylabel(gca, 'y','Rotation',0);
    set(gca,'XTick',[1,2])
    set(gca,'YTick',[1,2])
    axis square
    box on;
    set(gca,'FontSize',16);
    axis([0.5 2.5 0.5 2.5])
    saveplots('linear2D')