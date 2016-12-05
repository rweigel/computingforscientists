clear;

% Each row is a (x,y,z) value for a point.
P = [0.0 0.0 0.0; 1.0 0.0 0.0; 1.0 1.0 0.0; 0.0 1.0 0.0; ...
0.0 0.0 1.0; 1.0 0.0 1.0; 1.0 1.0 1.0; 0.0 1.0 1.0];
D = [1.0 1.0 0.0; 1.0 2.0 0.0; 2.0 2.0 0.0; 2.0 2.0 0.0; ...
1.0 1.0 0.0; 1.0 2.0 0.0; 2.0 2.0 0.0; 2.0 2.0 0.0]

Npts = size(P,1);

outfile = '1.8.2.4_4.vtk';

% Create and open a file named outfile for writing ('w').
fid = fopen(outfile,'w');

fprintf(fid,'# vtk DataFile Version 3.0\n');
fprintf(fid,'Wind velocity at unstructured points\n');
fprintf(fid,'ASCII\n');
fprintf(fid,'\n');
fprintf(fid,'DATASET POLYDATA\n');
fprintf(fid,'POINTS %d float\n',Npts);
for i = 1:Npts
	fprintf(fid,'%f %f %f\n',P(i,1),P(i,2),P(i,3));
end
fprintf(fid,'\n');
fprintf(fid,'POINT_DATA %d\n',Npts);
fprintf(fid,'VECTORS point_vectors float\n');
for i = 1:Npts
	fprintf(fid,'%f %f %f\n',D(i,1),D(i,2),D(i,3));
end
fclose(fid);
type(outfile);