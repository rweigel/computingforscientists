function Antialias1D(A,Ae)

% A 0 with a 1 to the left or right is replaced with a 0.5.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First attempt. Use two for loops.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Aa = A;
for i = 1:length(A)-1
    % If a 0 has a 1 to the right.
    if (A(i) == 0 && A(i+1) == 1)
        Aa(i) = 0.5;
    end
end
for i = 2:length(A)
    % If a 0 has a 1 to the left.
    if (A(i) == 0 && A(i-1) == 1)
        Aa(i) = 0.5;
    end
end
% Instead of displaying using
% A
% As
% use fprintf to make easier to read.
fprintf('Using two for loops\n');
fprintf('Original: ');
fprintf('%.1f ',A');
fprintf('\n')
fprintf('Modified: ');
fprintf('%.1f ',Aa');

if all(Aa == Ae)
    fprintf('\nPASS\n');
else
    fprintf('\nFAIL\n');
    error('Test failed')
end

fprintf('\n')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Second attempt.  Use one for loop.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Aa = A;
for i = 1:length(A)
    % If a 0 has a 1 to the right.
    if i < length(A) && (A(i) == 0 && A(i+1) == 1)
        Aa(i) = 0.5;
    end
    % If a 0 has a 1 to the left.
    if i > 1 && (A(i) == 0 && A(i-1) == 1)
        Aa(i) = 0.5;
    end    
end
fprintf('Using one for loop\n');
fprintf('Original: ');
fprintf('%.1f ',A');
fprintf('\n')
fprintf('Modified: ');
fprintf('%.1f ',Aa');

if all(Aa == Ae)
    fprintf('\nPASS\n');
else
    fprintf('\nFAIL\n');
    error('Test failed')
end

fprintf('\n')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Third attempt.  Use one for loop and alt. algorithm
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Aa = A;
for i = 1:length(A)-1
    % If a 0 has a 1 to the right.
    if (A(i) == 0 && A(i+1) == 1)
        Aa(i) = 0.5;
    end
    % If a 1 has a 0 to the right.
    if (A(i) == 1 && A(i+1) == 0)
        Aa(i+1) = 0.5;
    end    
end
fprintf('Using one for loop\n');
fprintf('Original: ');
fprintf('%.1f ',A');
fprintf('\n')
fprintf('Modified: ');
fprintf('%.1f ',Aa');

if all(Aa == Ae)
    fprintf('\nPASS\n');
else
    fprintf('\nFAIL\n');
    error('Test failed')
end

fprintf('\n')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Third attempt: Use vectorization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Aa = A;
dA = diff(A);
I = find(dA == -1);
Aa(I+1) = 0.5;
I = find(dA == 1);
Aa(I) = 0.5;

fprintf('Using vectorization\n');
fprintf('Original: ');
fprintf('%.1f ',A');
fprintf('\n')
fprintf('Modified: ');
fprintf('%.1f ',Aa');

if all(Aa == Ae)
    fprintf('\nPASS\n');
else
    fprintf('\nFAIL\n');
    error('Test failed')
end

fprintf('\n')