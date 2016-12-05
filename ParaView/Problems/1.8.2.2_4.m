clear;

% Each row is a (x,y,z) value for a point.
P = [0.0, 0.0, 0.0; 1.0, 0.0, 0.0; 1.0, 1.0, 0.0];
Npts = size(P,1);

outfile = '1.8.2.2_4.vtk';

% Create and open a file named outfile for writing ('w').
fid = fopen(outfile,'w');

fprintf(fid,'# vtk DataFile Version 3.0\n');
fprintf(fid,'A dataset with two lines and no attributes\n');
fprintf(fid,'ASCII\n');
fprintf(fid,'\n');
fprintf(fid,'DATASET POLYDATA\n');
fprintf(fid,'POINTS %d float\n',Npts);
for i = 1:Npts
  fprintf(fid,'%f %f %f\n',P(i,1),P(i,2),P(i,3));
end
fprintf(fid,'LINES %d %d\n',2,6);
fprintf(fid,'%d %d %d\n', 2, 0, 1);
fprintf(fid,'%d %d %d\n', 2, 1, 2);
fclose(fid);
type(outfile);