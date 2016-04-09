clear;
DipoleField; % Executes the script in DipoleFile.m

figure(1);clf;hold on;grid on;

% For alternative solution, use

for a = 1:7
    quit = 0;
    clear px pz
    px(1) = sin(a*pi/8);
    pz(1) = cos(a*pi/8);
    % Here we use the function interp2 to determine an estimate
    % of the x velocity at point px(1), py(1).  Because px(1) is exactly on
    % a grid point, the estimated velocity should exactly match the velocity
    % given in U.
    bx(1) = interp2(X,Z,Bx,px(1),pz(1));
    % Same as above, except for y velocity
    bz(1) = interp2(X,Z,Bz,px(1),pz(1));

    t = 1;
    % Display some information
    fprintf('a = %2d px(%d) = %.2f  py(%d) = %.2f  bx(%d) = %.2f  bz(%d) = %.2f\n',...
            a,t,px(t),t,pz(t),t,bx(t),t,bz(t));

    h = 0.01;
    while (quit == 0)
        t = t+1;
        % Take a step in x.  New position is px(t).  Last position is px(t-1).  Last velocity is vx(t-1).
        px(t) = px(t-1) + h*bx(t-1);

        % Take a step in y.  New position is py(t).  Last position is py(t-1).  Last velocity is vy(t-1).
        pz(t) = pz(t-1) + h*bz(t-1);

        % Find velocity at new position.
        bx(t) = interp2(X,Z,Bx,px(t),pz(t));
        bz(t) = interp2(X,Z,Bz,px(t),pz(t));

        % Display some information
        fprintf('a = %2d px(%d) = %.2f  py(%d) = %.2f  bx(%d) = %.2f  bz(%d) = %.2f\n',...
                a,t,px(t),t,pz(t),t,bx(t),t,bz(t));

        if isnan(px(t)) || isnan(pz(t))
            fprintf('Stepped out-of-bounds. Stopping\n');
            quit = 1;
        end
        if (sqrt(px(t)^2 + pz(t)^2) < 0.5)
            fprintf('Stepped too closely to center. Stopping\n');
            quit = 1;
        end

    end % of while loop.

    plot(px,pz,'b.','MarkerSize',10);

end % of angle loop


% Find indices of X and Y outside of r = 1 so that relative
% size of vectors can be seen without zoom.
I = find(sqrt(X.^2 + Z.^2) >= 0.4);

%quiver(X(I),Z(I),Bx(I),Bz(I));

box on;
axis square
xlabel('x');
ylabel('z','Rotation',0,'HorizontalAlignment','Right')
axis([-3.1 3.1 -3.1 3.1])
set(findall(gcf,'-property','FontSize'),'FontSize',16)
saveplots('DipoleFieldSolutionAlt')
