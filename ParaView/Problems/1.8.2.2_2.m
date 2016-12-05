clear;
outfile = '1.8.2.2_2.vtk';

% Create and open a file named outfile for writing ('w').
fid = fopen(outfile,'w');

fprintf(fid,'# vtk DataFile Version 3.0\n');
fprintf(fid,'A dataset with two lines and no attributes\n');
fprintf(fid,'ASCII\n');
fprintf(fid,'\n');
fprintf(fid,'DATASET POLYDATA\n');
fprintf(fid,'POINTS %d float\n',3);
fprintf(fid,'%f %f %f\n',0.0, 0.0, 0.0);
fprintf(fid,'%f %f %f\n',1.0, 0.0, 0.0);
fprintf(fid,'%f %f %f\n',1.0, 1.0, 0.0');
fprintf(fid,'LINES %d %d\n',2,6);
fprintf(fid,'%d %d %d\n',2, 0, 1);
fprintf(fid,'%d %d %d',2, 1, 2);
fclose(fid);
type(outfile);