clear;
outfile = '1.8.2.3_2.vtk';

% Create and open a file named outfile for writing ('w').
fid = fopen(outfile,'w');

fprintf(fid,'# vtk DataFile Version 3.0\n');
fprintf(fid,'Structured Points Example B\n');
fprintf(fid,'ASCII\n');
fprintf(fid,'\n');
fprintf(fid,'DATASET STRUCTURED_POINTS\n');
fprintf(fid,'DIMENSIONS %d %d %d\n',2,2,2);
fprintf(fid,'ORIGIN %f %f %f\n',0.0,0.0,0.0);
fprintf(fid,'SPACING %f %f %f\n',1.0,1.0,1.0);
fprintf(fid,'\n');
fprintf(fid,'POINT_DATA 8\n');
fprintf(fid,'VECTORS point_vectors float\n');
fprintf(fid,'%f %f %f\n',0.0, 0.0, 1.0);
fprintf(fid,'%f %f %f\n',0.0, 0.0, 1.0);
fprintf(fid,'%f %f %f\n',0.0, 0.0, 1.0);
fprintf(fid,'%f %f %f\n',0.0, 0.0, 1.0);
fprintf(fid,'%f %f %f\n',1.0, 0.0, 0.0);
fprintf(fid,'%f %f %f\n',1.0, 0.0, 0.0);
fprintf(fid,'%f %f %f\n',1.0, 0.0, 0.0);
fprintf(fid,'%f %f %f\n',1.0, 0.0, 0.0);
fclose(fid);
type(outfile);