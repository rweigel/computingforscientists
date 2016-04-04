clear;

% Positions at which to compute magnetic field vector.
x = [-3:0.1:3];
z = [-3:0.1:3];

for k = 1:length(z)
	for i = 1:length(x)
		Bxyz = B_dipole([x(i),0,z(k)]);
		X(i,k)  = x(i);
		Z(i,k)  = z(k);
		Bx(i,k) = Bxyz(1);
		Bz(i,k) = Bxyz(3);
	end
end
% B has rows of Bx,By,Bz at a given location.

% Transpose all matrices used for interpolation so that
% they have format required by interp2 (x increases from 
% left to right, y increases from top to bottom)
X = X';
Z = Z';
Bx = Bx';
Bz = Bz';

% Plot all data using quiver.
figure(1);clf
	quiver(X,Z,Bx,Bz);
	xlabel('x');
	ylabel('z','Rotation',90);
	% Units on horizontal axis are same, so make
	% aspect ratio of plot 1.0.
	axis square; 

% Find indices of X and Y outside of r = 1 so that relative
% size of vectors can be seen without zoom.
I = find(sqrt(X.^2 + Z.^2) >= 1);

figure(2);clf;hold on;
	% Plot only vectors outside of r = 1.
	quiver(X(I),Z(I),Bx(I),Bz(I));
	xlabel('x');
	ylabel('z','Rotation',0);
	axis square
