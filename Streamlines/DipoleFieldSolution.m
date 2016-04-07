px(1) = 1.0*sin(pi/4);
pz(1) = 1.0*cos(pi/4);
% Here we use the function interp2 to determine an estimate
% of the x velocity at point px(1), py(1).  Because px(1) is exactly on
% a grid point, the estimated velocity should exactly match the velocity
% given in U.
bx(1) = interp2(X,Z,Bx,px(1),pz(1));
% Same as above, except for y velocity
bz(1) = interp2(X,Z,Bz,px(1),pz(1));

t = 1;
% Display some information
fprintf('px(%d) = %.2f  py(%d) = %.2f  bx(%d) = %.2f  bz(%d) = %.2f\n',...
        t,px(t),t,pz(t),t,bx(t),t,bz(t));

h = 0.05;
Nsteps = 1200;
while sqrt(px(t)^2 + pz(t)^2) >= 1
	t = t+1;
    % Take a step in x.  New position is px(t).  Last position is px(t-1).  Last velocity is vx(t-1).
    px(t) = px(t-1) + h*bx(t-1);

    % Take a step in y.  New position is py(t).  Last position is py(t-1).  Last velocity is vy(t-1).
    pz(t) = pz(t-1) + h*bz(t-1);
    
    % Find velocity at new position.
    bx(t) = interp2(X,Z,Bx,px(t),pz(t));
    bz(t) = interp2(X,Z,Bz,px(t),pz(t));

    % Display some information
    fprintf('px(%d) = %.2f  py(%d) = %.2f  bx(%d) = %.2f  bz(%d) = %.2f\n',...
            t,px(t),t,pz(t),t,bx(t),t,bz(t));
   
end

figure(1);clf;hold on;grid on;
	quiver(X(I),Z(I),Bx(I),Bz(I));
	plot(px,pz,'.','MarkerSize',10);
	box on;
	axis square
	xlabel('x');
	ylabel('z','Rotation',0)
	axis([-3.1 3.1 -3.1 3.1])
	print('-dpng','figures/DipoleFieldSolution.png')