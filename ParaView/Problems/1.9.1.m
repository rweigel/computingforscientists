clear;

% Each row is a (x,y,z) value for a point.
P = rand(1000,3);
N = size(P,1);

fid = fopen('HW8_1.vtk','w');

fprintf(fid,'# vtk DataFile Version 3.0\n');
fprintf(fid,'HW 8_1\n');
fprintf(fid,'ASCII\n\n');
fprintf(fid,'DATASET POLYDATA\n');
fprintf(fid,'POINTS %d float\n',N);
%Avoid for loop using this technique
%PT = P';
%fprintf(fid,'%f %f %f\n',PT(:));
for i = 1:N
  fprintf(fid,'%f %f %f\n',P(i,1),P(i,2),P(i,3));
end
fprintf(fid,'\nPOINT_DATA %d\n',N);
fprintf(fid,'SCALARS point_scalars float\n');
fprintf(fid,'LOOKUP_TABLE default\n');
% Row in S is sum of squares of row in P.  Will result in points
% with colors that depend on distance from origin.
S = sum(P.^2,2);
%fprintf(fid,'%f\n',S);
for i = 1:N
  fprintf(fid,'%f\n',S(i));
end
fclose(fid);