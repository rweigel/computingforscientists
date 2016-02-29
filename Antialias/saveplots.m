function saveplots(fname,n)

box on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Draw grid lines.
for i = 1:n+1
    % Horizontal grid
    plot([0.5,n+0.5],[i-0.5,i-0.5],'k:');
    % Vertical grid
    plot([i-0.5,i-0.5],[0.5,n+0.5],'k:');
end
set(gca,'XTick',[1:n]);
set(gca,'YTick',[1:n]);
set(gca,'XLim',[0.5 n+0.51])
set(gca,'YLim',[0.5 n+0.51])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

set(findall(gcf,'-property','FontSize'),'FontSize',16)
set(findall(gcf,'-property','FontName'),'FontName','Times New Roman')
set(0,'defaultAxesFontName', 'Times New Roman')
set(0,'defaultTextFontName', 'Times New Roman')
print('-dpng','-r300',fname);
fprintf('Wrote %s\n',fname);
print('-dpdf',strrep(fname,'.png','.pdf'));
fprintf('Wrote %s\n',strrep(fname,'.png','.pdf'));
