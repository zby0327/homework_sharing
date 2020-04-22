a=[2 3
8 9
3 4
7 8
2 4
7 9
2 8
3 9
3 7
4 8
2 7
4 9];
for i=1:12

    tmpGo1 = num2str(a(i,2));
    tmpGo2= num2str(a(i,1));
    name=[tmpGo1,tmpGo2];
    name = ['a' name '.bmp'];
    hFigure = figure(1);
    set(hFigure,'position',[100 100 900 600]);
    hAxes = axes('parent',hFigure);
    set(hAxes,'units','pixels','position',[1 1 900 600]);
    imgMatrix = zeros(600,900,3);
    
    imshow(imgMatrix,'parent',hAxes);
    hold on; 
    hText_begin = uicontrol('style','text','String',tmpGo1,'HorizontalAlign','center','fontname','Microsoft YaHei', 'position',[200 150 200 200],'ForegroundColor','w','fontsize',72,'backgroundcolor','k');
    hText_begin = uicontrol('style','text','String',tmpGo2,'HorizontalAlign','center','fontname','Microsoft YaHei', 'position',[500 150 200 200],'ForegroundColor','w','fontsize',72,'backgroundcolor','k');
    saveas(gcf,name);
    hold off;
end
for i=1:12

    tmpGo1 = num2str(a(i,1));
    tmpGo2= num2str(a(i,2));
    name=[tmpGo1,tmpGo2];
    name = ['a' name '.bmp'];
    hFigure = figure(1);
    set(hFigure,'position',[100 100 900 600]);
    hAxes = axes('parent',hFigure);
    set(hAxes,'units','pixels','position',[1 1 900 600]);
    imgMatrix = zeros(600,900,3);
    
    imshow(imgMatrix,'parent',hAxes);
    hold on; 
    hText_begin = uicontrol('style','text','String',tmpGo1,'HorizontalAlign','center','fontname','Microsoft YaHei', 'position',[200 150 200 200],'ForegroundColor','w','fontsize',72,'backgroundcolor','k');
    hText_begin = uicontrol('style','text','String',tmpGo2,'HorizontalAlign','center','fontname','Microsoft YaHei', 'position',[500 150 200 200],'ForegroundColor','w','fontsize',72,'backgroundcolor','k');
    saveas(gcf,name);
    hold off;
end