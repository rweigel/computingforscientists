diary('Antialias1D_test.log');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Test cases. Ae is correct answer that is expected.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A  = [0,0,0,0,0,0];
Ae = [0,0,0,0,0,0];
fprintf('Test 1\n')
Antialias1D(A,Ae);

A  = [1,1, 0  ,0 ,1,1];
Ae = [1,1,0.5,0.5,1,1];
fprintf('Test 2\n')
Antialias1D(A,Ae);

A  = [ 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0];
Ae = [0.5,1,0.5,1,0.5,0,0.5,1,0.5,1,0.5];
fprintf('Test 3\n')
Antialias1D(A,Ae);

A  = [0, 0,  1, 1, 0, 0];
Ae = [0,0.5, 1, 1,0.5,0];
fprintf('Test 3\n')
Antialias1D(A,Ae);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
diary off