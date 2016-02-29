clear;
n = 16;
C = [0,0,0;0.5,0.5,0.5;1,1,1];

% Same as code from previous problem for generating starting image
% except as noted.
for i = [1:n]
 for j = [1:n]
   if ( (i - n/2)^2 + (j - n/2)^2) <= (n/4)^2 + 1 % Added + 1;
     M(i,j) = 1; % Changed from 0 to 1
   else
     M(i,j) = 0; % Changed from 1 to 0
   end
   if (j == 8) % New code
     M(i,j) = 0; % New code
   end % New code
 end
end

figure(1);clf;
  imagesc(M);
  colormap(C);

saveplots('Antialias2DII_before',n)

% Code that follows is identical to Antialias2DI code for antialiasing.
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

saveplots('Antialias2DII_after',n)
