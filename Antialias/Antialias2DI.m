clear;
n = 16;
C = [0,0,0;0.5,0.5,0.5;1,1,1];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create circle with pixels.
for i = [1:n]
    for j = [1:n]
        if ( (i - n/2)^2 + (j - n/2)^2) <= (n/4)^2
            M(i,j) = 0;
        else
            M(i,j) = 1;
        end
    end
end

figure(1);clf;
  imagesc(M);
  colormap(C);

saveplots('Antialias2DI_before.png',n)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modify matrix.

% The above code operates only on row 8.  To operate on all rows
% loop over all rows instead of using i = 8.
for i = [1:n]
    for j = [1:n-1]
        if (M(i,j) == 0)
            % Value to right is 1
            if (M(i,j+1) == 1)
                M(i,j) = 0.5;
            end
        end
    end
end
for i = [1:n]
    for j = [2:n] % Start at 2 and end at n
        if (M(i,j) == 0)
            % Value to left is 1
            if (M(i,j-1) == 1)
                M(i,j) = 0.5;
            end
        end
    end
end

figure(2);clf;
  imagesc(M);
  colormap(C);

saveplots('Antialias2DI_after.png',n)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
