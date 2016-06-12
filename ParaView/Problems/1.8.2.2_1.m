clear;
outfile = '1.8.2.2_1.vtk';

% Create and open a file named outfile for writing ('w').
fid = fopen(outfile,'w');

fprintf(fid,'# vtk DataFile Version 3.0\n');
fprintf(fid,'A dataset with two lines and no attributes\n');
fprintf(fid,'ASCII\n');
fprintf(fid,'\n');
fprintf(fid,'DATASET POLYDATA\n');
fprintf(fid,'POINTS 3 float\n');
fprintf(fid,'0.0 0.0 0.0\n');
fprintf(fid,'1.0 0.0 0.0\n');
fprintf(fid,'1.0 1.0 0.0\n');
fprintf(fid,'LINES 2 6\n');
fprintf(fid,'2 0 1\n');
fprintf(fid,'2 1 2\n');

% Close the file
fclose(fid);

% Display the contents of outfile to screen
type(outfile);