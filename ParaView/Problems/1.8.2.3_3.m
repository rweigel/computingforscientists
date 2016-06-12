clear;

% Each row is a (x,y,z) value for a point.
P = [0.0, 0.0, 1.0; 0.0, 0.0, 1.0; 0.0, 0.0, 1.0; 0.0, 0.0, 1.0; ...
 1.0, 0.0, 0.0; 1.0, 0.0, 0.0; 1.0, 0.0, 0.0; 1.0, 0.0, 0.0];
Npts = size(P,1);

outfile = '1.8.2.3_3.vtk';

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
fprintf(fid,'POINT_DATA %d\n',Npts);
fprintf(fid,'VECTORS point_vectors float\n');
fprintf(fid,'%f %f %f\n',P(1,1),P(1,2),P(1,3));
fprintf(fid,'%f %f %f\n',P(2,1),P(2,2),P(2,3));
fprintf(fid,'%f %f %f\n',P(3,1),P(3,2),P(3,3));
fprintf(fid,'%f %f %f\n',P(4,1),P(4,2),P(4,3));
fprintf(fid,'%f %f %f\n',P(5,1),P(5,2),P(5,3));
fprintf(fid,'%f %f %f\n',P(6,1),P(6,2),P(6,3));
fprintf(fid,'%f %f %f\n',P(7,1),P(7,2),P(7,3));
fprintf(fid,'%f %f %f\n',P(8,1),P(8,2),P(8,3));
fclose(fid);
type(outfile);