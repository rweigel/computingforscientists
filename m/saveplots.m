function saveplots(fname)

fname = sprintf('figures/%s',fname);
set(gca,'TitleFontWeight','normal');

%set(findall(gcf,'-property','Interpreter'),'Interpreter','Latex')
%set(findall(gcf,'-property','FontSize'),'FontSize',16)
%set(findall(gcf,'-property','FontName'),'FontName','Times New Roman')
set(0,'defaultAxesFontName', 'Times New Roman')
set(0,'defaultTextFontName', 'Times New Roman')
print('-dpng','-r300',[fname,'.png']);
fprintf('Wrote %s.png\n',fname);
%print('-dpng','-r300',[fname,'_300dpi.png']);
%print('-dpng','-r600',[fname,'_600dpi.png']);
%print('-dsvg',[fname,'.svg']);
%print('-dpdf',[fname,'.pdf']);
%fprintf('Wrote %s{_300dpi.png,_600dpi.png,.pdf,.svg}\n',fname);
