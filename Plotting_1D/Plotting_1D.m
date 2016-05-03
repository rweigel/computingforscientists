% Create an array to plot
A = [1.0,4.0,16.0,32.0];
clf; % Clear the plot window
plot(A)
print('-dpng','-r600','figures/Plotting_1D_I.m.png')

A = [1.0,4.0,16.0,32.0];
x = [1,2,3,4];
clf;
plot(x,A);
print('-dpng','-r600','figures/Plotting_1D_II.m.png')

A = [1.0,4.0,16.0,32.0];
x = [10,20,30,40];
clf;
plot(x,A);
print('-dpng','-r600','figures/Plotting_1D_III.m.png')

A = [1.0,4.0,16.0,32.0];
x = [1,2,3,4];
clf;
plot(x,A);
grid on;
xlabel('Time [seconds]');
ylabel('Height [meters]');
title('Experiment 1 results');
print('-dpng','-r600','figures/Plotting_1D_IV.m.png')

A = [1.0,4.0,16.0,32.0];
x = [1,2,3,4];
style = 'r'; % Can be one of r,g,b,c,m,y,k,w
clf;
plot(x,A,style);
print('-dpng','-r600','figures/Plotting_1D_V.m.png')

A = [1.0,4.0,16.0,32.0];
x = [1,2,3,4];
clf; 
plot(x,A,'Color',[0.5,0.5,0.5]);
print('-dpng','-r600','figures/Plotting_1D_VI.m.png')

A = [1.0,4.0,16.0,64.0];
x = [1,2,3,4];
style = '*'; % Can be one of .,o,x,+,*,s,d,v,^,<,>,p,h
clf; 
plot(x,A,style);
print('-dpng','-r600','figures/Plotting_1D_VII.m.png')

A = [1.0,4.0,16.0,64.0];
x = [1,2,3,4];
style = '*'; % Can be one of .,o,x,+,*,s,d,v,^,<,>,p,h
clf;
plot(x,A,style,'Color',[0.5,0.5,0.5]);
print('-dpng','-r600','figures/Plotting_1D_VIII.m.png')

A = [1.0,4.0,16.0,64.0];
x = [1,2,3,4];
style = '*'; % Can be one of .,o,x,+,*,s,d,v,^,<,>,p,h
clf
plot(x,A,style,'MarkerSize',20);
print('-dpng','-r600','figures/Plotting_1D_IX.m.png')

A = [1.0,4.0,16.0,64.0];
x = [1,2,3,4];
style = '-'; % Can be one of -,:,-.,--
clf; 
plot(x,A,style)
print('-dpng','-r600','figures/Plotting_1D_X.m.png')

A = [1.0,4.0,16.0,64.0];
x = [1,2,3,4];
style = '-'; % Can be one of -,:,-.,--
clf;
plot(x,A,style,'LineWidth',5)
print('-dpng','-r600','figures/Plotting_1D_XI.m.png')

A = [1.0,4.0,16.0,32.0];
x = [1,2,3,4];
style = 'r-';
clf; 
plot(x,A,style);
print('-dpng','-r600','figures/Plotting_1D_XII.m.png')

A = [1.0,4.0,16.0,32.0];
x = [1,2,3,4];
style = 'r*-'; 
clf;
plot(x,A,style);
print('-dpng','-r600','figures/Plotting_1D_XIII.m.png')

A = [1.0,4.0,16.0,32.0];
x = [1,2,3,4];
style = 'r*-'; 
clf;
plot(x,A,style,'LineWidth',3,'MarkerSize',10);
print('-dpng','-r600','figures/Plotting_1D_XIV.m.png')

A = [1.0,4.0,16.0,32.0];
B = [1.1,4.4,16.9,32.9];
clf;
plot(A,'r');
hold on;
plot(B,'b');
legend('Array A','Array B');
print('-dpng','-r600','figures/Plotting_1D_XV.m.png')

M = [1.0,1.1;4.0,4.4;16.0,16.9;32.0,32.9]
clf;
plot(M)
legend('Column 1','Column 2');
print('-dpng','-r600','figures/Plotting_1D_XVI.m.png')

A = [1.0,4.0,16.0,32.0];
x = [1,2,3,4];
clf;
plot(x,A);
set(gca,'XTick',[1:4]); % Label x-position labels at 1, 2, 3, and 4.
grid on;
xlabel('Time [seconds]');
ylabel('Height [meters]');
title('Experiment 1 results');
print('-dpng','-r600','figures/Plotting_1D_XVII.m.png')

