a=['zinner  '; 'dinner  ';
'noster  '; 'roster  ';
'vumly   ';'glumly  ';
'bistful ' ;'fistful ';
'quepping';'stepping';
'croggy  ' ;'foggy   ';
'glundle '; 'bundle  ';
'traddle '; 'saddle  ';
'fletter '; 'better  ';
'wanning '; 'spanning';
'kizely  '; 'wisely  ';
'cleeper ';'sleeper '];
for i=1:24

    tmpGo = a(i:24:end);
    name=strtrim(tmpGo);
    name = [name '.bmp'];
    hFigure = figure(1);
    set(hFigure,'position',[100 100 900 600]);
    hAxes = axes('parent',hFigure);
    set(hAxes,'units','pixels','position',[1 1 900 600]);
    imgMatrix = zeros(600,900,3);
    
    imshow(imgMatrix,'parent',hAxes);

    hText_begin = uicontrol('style','text','String',tmpGo,'HorizontalAlign','center','fontname','Microsoft YaHei', 'position',[250 250 400 100],'ForegroundColor','w','fontsize',48,'backgroundcolor','k');
    saveas(gcf,name);
end