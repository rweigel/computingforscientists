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
for i = 1:Npts
	fprintf(fid,'%f %f %f\n',P(i,1),P(i,2),P(i,3));
end
fclose(fid);
type(outfile);