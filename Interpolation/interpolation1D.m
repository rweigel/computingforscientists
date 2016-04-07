x = [1,2,3];
y = [2,4,5];
xo = 0.25;
yo = 0.75;
zstr = 'z';
%interp1(x,y,1.6)

figure(1);clf;grid on;
    plot(x,y,'k.','MarkerSize',30);
    axis equal
    axis([0 4 0 6]);
    xlabel('x');
    ylabel('y','Rotation',90);
    saveplots('interpolation1')

figure(2);clf;grid on;hold on;
    plot(x,y,'k.','MarkerSize',30);
    axis equal
    axis([0 4 0 6]);
    xlabel('x');
    ylabel('y','Rotation',90);
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
    saveplots('interpolation2')

x = [ 1, 1, 2, 2];
y = [ 1, 2, 1, 2];
H = [10,20,30,40];

x = [0 1 1 0];
y = [0 0 1 1];
z = [2 1 0.5 0.5];

figure(3);clf;hold on;
    plot3(x,y,z,'.','MarkerSize',30);
    grid on;
    xlabel('x');
    ylabel('y');
    ylabel(str,'Rotation',90);
    axis equal
    axis([0 2 0 2 0 3]);
    plot3([0 0],[0 0],[0 2],'b-.');
    plot3([1 1],[0 0],[0 1],'b-.');
    plot3([1 1],[1 1],[0.0 0.5],'b-.');
    plot3([0 0],[1 1],[0.0 0.5],'b-.');
    view(45+90,30)
    plot3(xo,yo,0,'kx');
    saveplots('interpolation3')

figure(4);clf;hold on;
    x = [0 1 1 0];
    y = [0 0 1 1];
    z = [2 1 0.5 0.5];
    plot3(x,y,z,'.','MarkerSize',30);
    grid on;
    xlabel('x');
    ylabel('y');
    ylabel(zstr,'Rotation',90);
    axis equal
    axis([0 2 0 2 0 3]);
    plot3([0 0],[0 0],[0 2],'b-.');
    plot3([1 1],[0 0],[0 1],'b-.');
    plot3([1 1],[1 1],[0.0 0.5],'b-.');
    plot3([0 0],[1 1],[0.0 0.5],'b-.');
    plot3([1 1],[0 1],[1 0.5],'k');
    plot3([0 0],[0 1],[2 0.5],'k');
    view(45+90,30)
    plot3([1 1],[0.75 0.75],[0 0.5+1/8],'g-');
    plot3([1],[0.75],[0.5+1/8],'g.','MarkerSize',30);
    plot3([0 0],[0.75 0.75],[0 0.875],'g-');
    plot3([0 1],[0.75 0.75],[0 0],'g-');
    plot3([0],[0.75],[0.875],'g.','MarkerSize',30);
    plot3(0.25,0.75,0,'kx');
    text(0,0.75,1.05,'z_A','Color','g');
    text(1,0.75,.75,'z_B','Color','g');
    saveplots('interpolation4')

figure(5);clf;hold on;
    x = [0 1 1 0];
    y = [0 0 1 1];
    z = [2 1 0.5 0.5];
    plot3(x,y,z,'.','MarkerSize',30);
    grid on;
    xlabel('x');
    ylabel('y');
    ylabel(zstr,'Rotation',90);
    axis equal
    axis([0 2 0 2 0 3]);
    plot3([0 0],[0 0],[0 2],'b-.');
    plot3([1 1],[0 0],[0 1],'b-.');
    plot3([1 1],[1 1],[0.0 0.5],'b-.');
    plot3([0 0],[1 1],[0.0 0.5],'b-.');
    plot3([1 1],[0 1],[1 0.5],'k');
    plot3([0 0],[0 1],[2 0.5],'k');
    view(65+90,20)
    plot3([1 1],[0.75 0.75],[0 0.5+1/8],'g-');
    plot3([1],[0.75],[0.5+1/8],'g.','MarkerSize',30);
    plot3([0 0],[0.75 0.75],[0 0.875],'g-');
    plot3([0],[0.75],[0.875],'g.','MarkerSize',30);
    plot3([1 0],[0.75 0.75],[0.5+1/8,0.875],'k-')
    plot3(0.25,0.75,0,'kx');
    plot3(0.25,0.75,0.6125+.1969,'r.','MarkerSize',30)
    plot3([0.25,0.25],[0.75,0.75],[0,0.6125+.1969],'r-');
    text(0.3,0.75,0.95,'z_o','Color','r');
    saveplots('interpolation5')
