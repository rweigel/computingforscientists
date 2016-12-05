clear;

% Each row is a (x,y,z) value for a point.
D = [1.0 1.0 0.0; 1.0 2.0 0.0; 2.0 2.0 0.0; 2.0 2.0 0.0; ...
1.0 1.0 0.0; 1.0 2.0 0.0; 2.0 2.0 0.0; 2.0 2.0 0.0]

Npts = size(D,1);

outfile = '1.8.2.4_3.vtk';

% Create and open a file named outfile for writing ('w').
fid = fopen(outfile,'w');

fprintf(fid,'# vtk DataFile Version 3.0\n');
fprintf(fid,'Wind velocity at unstructured points\n');
fprintf(fid,'ASCII\n');
fprintf(fid,'\n');
fprintf(fid,'DATASET STRUCTURED_POINTS\n');
fprintf(fid,'DIMENSIONS %d %d %d\n',2,2,2);
fprintf(fid,'ORIGIN %f %f %f\n',0.0,0.0,0.0);
fprintf(fid,'SPACING %f %f %f\n',1.0,1.0,1.0);
fprintf(fid,'\n');
fprintf(fid,'POINT_DATA %d\n',Npts);
fprintf(fid,'VECTORS point_vectors float\n');
fprintf(fid,'%f %f %f\n',D(1,1),D(1,2),D(1,3));
fprintf(fid,'%f %f %f\n',D(2,1),D(2,2),D(2,3));
fprintf(fid,'%f %f %f\n',D(3,1),D(3,2),D(3,3));
fprintf(fid,'%f %f %f\n',D(4,1),D(4,2),D(4,3));
fprintf(fid,'%f %f %f\n',D(5,1),D(5,2),D(5,3));
fprintf(fid,'%f %f %f\n',D(6,1),D(6,2),D(6,3));
fprintf(fid,'%f %f %f\n',D(7,1),D(7,2),D(7,3));
fprintf(fid,'%f %f %f\n',D(8,1),D(8,2),D(8,3));
fclose(fid);
type(outfile);