clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ds = 0.1;

legtxt    = {'Euler integration','Exact solution','ODE23 integration'};
linewidth = [4,3,1];
linecolor = ['g','r','k'];

tmp  = linspace(1,5,5);
po   = zeros(size(tmp,2),3);
po(:,1) = tmp';

figure(1);clf;
hold on;grid on;axis equal;
    
for j = 1:size(po,1)
    X = B_dipole_trace(po(j,1),po(j,2),po(j,3),ds);
    for i = 1:length(X)
	plot(X{i}(:,1),X{i}(:,3),linecolor(i),'LineWidth',linewidth(i));
    end
end

xlabel('x/R_E')
ylabel('z/R_E','Rotation',0);
legend(legtxt);

mx = abs(max(po(:,1)));
mz = abs(max(po(:,3)));
mc = max(mx,mz);
axis([-mc mc -mc mc])
plot([-mc mc],[0 0],'k');
plot([0 0],[-mc mc],'k');
rh = rectangle('Position',[-1,-1,2,2],'Curvature',[1,1]);% Draw Earth.
set(rh,'FaceColor',[0 0 1]);
