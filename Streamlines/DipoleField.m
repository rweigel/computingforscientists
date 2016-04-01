clear;

x = [-3:0.1:3];
z = [-3:0.1:3];

for k = 1:length(z)
    for i = 1:length(x)
	B = B_dipole([x(i),0,z(k)]);
	X(k,i)  = x(i);
	Z(k,i)  = z(k);
	Bx(k,i) = B(:,1);
	Bz(k,i) = B(:,3);
    end
end

save('DipoleField','Bx','Bz');
quiver(X,Z,Bx,Bz);

I = find(sqrt(X.^2 + Z.^2) >= 1);
quiver(X(I),Z(I),Bx(I),Bz(I));

