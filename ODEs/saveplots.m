function saveplots(fname)

fname = sprintf('figures/%s',fname);

if (0)
    set(gca,'XTick',x);
    set(gca,'YTick',[0:0.25:2]);
    xl = get(gca,'YTickLabel');
    for i = 1:length(xl)
        xl{i} = sprintf('%.2f',str2num(xl{i}));
    end
   set(gca,'YTickLabel',xl);    
end

set(gca,'TitleFontWeight','normal');
set(findall(gcf,'-property','FontSize'),'FontSize',16)
set(findall(gcf,'-property','FontName'),'FontName','Times New Roman')
set(findall(gcf,'-property','Interpreter'),'Interpreter','Latex')
set(0,'defaultAxesFontName', 'Times New Roman')
set(0,'defaultTextFontName', 'Times New Roman')
print('-dpng','-r300',fname);
fprintf('Wrote %s\n',fname);
print('-dpdf',strrep(fname,'.png','.pdf'));
fprintf('Wrote %s\n',strrep(fname,'.png','.pdf'));
