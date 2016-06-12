clear;

% Each row is a (x,y,z) value for a point.
P = [0.0, 0.0, 0.0; 1.0, 0.0, 0.0; 1.0, 1.0, 0.0];
Npts = size(P,1);

outfile = '1.8.2.2_3.vtk';

% Create and open a file named outfile for writing ('w').
fid = fopen(outfile,'w');

fprintf(fid,'# vtk DataFile Version 3.0\n');
fprintf(fid,'A dataset with two lines and no attributes\n');
fprintf(fid,'ASCII\n');
fprintf(fid,'\n');
fprintf(fid,'DATASET POLYDATA\n');
fprintf(fid,'POINTS %d float\n',Npts);
fprintf(fid,'%f %f %f\n',P(1,1),P(1,2),P(1,3));
fprintf(fid,'%f %f %f\n',P(2,1),P(2,2),P(2,3));
fprintf(fid,'%f %f %f\n',P(3,1),P(3,2),P(3,3));
fprintf(fid,'LINES %d %d\n',2,6);
fprintf(fid,'%d %d %d\n', 2, 0, 1);
fprintf(fid,'%d %d %d\n', 2, 1, 2);
fclose(fid);
type(outfile);