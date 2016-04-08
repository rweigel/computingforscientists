clear;

x = [0 1 1 0];
y = [0 0 1 1];
z = [2 1 0.5 0.5];
AZ = 135;
EL = 30;
xo   = 0.25;
yo   = 0.75;
zstr = 'z';

if (1)
    x = [ 1, 1, 2, 2];
    y = [ 1, 2, 1, 2];
    H = [10,20,30,40];
    AZ = 130;
    EL = 30;
    xo   = 1.1;
    yo   = 1.1;
    zstr = 'H';
end

figure(1);clf;hold on;
    plot3(x,y,z,'.','MarkerSize',30);
    grid on;
    xlabel('$x$');
    ylabel('$y$');
    zlabel(['$',zstr,'$'],'Rotation',0);
    axis([0,max(x)+1,0,max(y)+1,0,max(z)+1]);
    plot3([x(1) x(1)],[y(1) y(1)],[0 z(1)],'b-.');
    plot3([x(2) x(2)],[y(2) y(2)],[0 z(2)],'b-.');
    plot3([x(3) x(3)],[y(3) y(3)],[0 z(3)],'b-.');
    plot3([x(4) x(4)],[y(4) y(4)],[0 z(3)],'b-.');
    plot3([xo-0.05,xo+0.05],[yo,yo],[0,0],'k-')
    plot3([xo,xo],[yo-0.05,yo+0.05],[0,0],'k-')
    view(AZ,EL)

    saveplots(['interpolation2D_part1_',zstr])

    plot3([1 1],[0.75 0.75],[0 0.5+1/8],'g-');
    plot3([1],[0.75],[0.5+1/8],'g.','MarkerSize',30);
    plot3([0 0],[0.75 0.75],[0 0.875],'g-');
    plot3([0 1],[0.75 0.75],[0 0],'g-');
    plot3([0],[0.75],[0.875],'g.','MarkerSize',30);
    plot3([0.2 0.3],[0.75,0.75],[0,0],'k-')
    plot3([0.25 0.25],[0.7,0.8],[0,0],'k-')
    text(0,0.75,1.1,'$z_A$','Color','g');
    text(1,0.75,.75,'$z_B$','Color','g');

    saveplots(['interpolation2D_part2_',zstr])

break

figure(3);clf;hold on;
    plot3(x,y,z,'.','MarkerSize',30);
    grid on;
    xlabel('$x$');
    ylabel('$y$');
    zlabel(['$',zstr,'$'],'Rotation',0);
    axis([0 2 0 2 0 3]);
    plot3([0 0],[0 0],[0 2],'b-.');
    plot3([1 1],[0 0],[0 1],'b-.');
    plot3([1 1],[1 1],[0.0 0.5],'b-.');
    plot3([0 0],[1 1],[0.0 0.5],'b-.');
    plot3([1 1],[0 1],[1 0.5],'k');
    plot3([0 0],[0 1],[2 0.5],'k');
    view(AZ,EL)
    plot3([1 1],[0.75 0.75],[0 0.5+1/8],'g-');
    plot3([1],[0.75],[0.5+1/8],'g.','MarkerSize',30);
    plot3([0 0],[0.75 0.75],[0 0.875],'g-');
    plot3([0],[0.75],[0.875],'g.','MarkerSize',30);
    plot3([1 0],[0.75 0.75],[0.5+1/8,0.875],'k-')
    plot3([0.2 0.3],[0.75,0.75],[0,0],'k-')
    plot3([0.25 0.25],[0.7,0.8],[0,0],'k-')
    plot3(0.25,0.75,0.6125+.1969,'r.','MarkerSize',30)
    plot3([0.25,0.25],[0.75,0.75],[0,0.6125+.1969],'r-');
    text(0.3,0.75,1.0,'$z_o$','Color','r');
    saveplots(['interpolation2D_part3_',zstr])

