
fid = fopen('file1.txt','w');

fprintf(fid,'%02d\n',10);
fprintf(fid,'%f\n',10);
fprintf(fid,'%f,%f\n',10,10);
fprintf(fid,'%10.2f\n\n',10);
fprintf(fid,'%10.2f\n\n',9);
fprintf(fid,'%10.2f\n',8);

fclose(fid);

type file1.txt