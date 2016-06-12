clear;

outfile = '1.10.4.1.vtk';

% Create and open a file named outfile for writing ('w').
fid = fopen(outfile,'w');

fprintf(fid,'# vtk DataFile Version 3.0\n');
fprintf(fid,'Wind velocity at unstructured points\n');
fprintf(fid,'ASCII\n');
fprintf(fid,'\n');
fprintf(fid,'DATASET POLYDATA\n');
fprintf(fid,'POINTS 100 float\n');
for i = 1:10
	for j = 1:10
		fprintf(fid,'%.2f %.2f 0.00\n',i,j);
	end
end
fprintf(fid,'\n');
fprintf(fid,'POINT_DATA 100\n');
fprintf(fid,'VECTORS point_vectors float\n');
for i = 1:10
	for j = 1:10
		fprintf(fid,'%.2f %.2f 0.00\n',1,1+i*0.5);
	end
end
fclose(fid);
type(outfile);