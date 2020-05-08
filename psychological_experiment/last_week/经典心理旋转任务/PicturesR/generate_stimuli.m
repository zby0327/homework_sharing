
for i = 1:12

    hFigure = figure(1);
    set(hFigure, 'position',[100 100 300 300], 'color','k');

    hAxes = axes('parent',hFigure);
    set(hAxes, 'units','pixels', 'position',[1 1 300 300]);
    axis([0 300 0 300]);

    text(150,150,'R', 'fontname','Microsoft YaHei', 'fontsize',96,'rotation',30*(i-2), 'HorizontalAlign','center', 'VerticalAlign','middle', 'color','w');
    axis off;

    hFrame = getframe(gcf);
    imgNumber = hFrame.cdata;
    imgNumber_Scale = imresize(imgNumber, [300 300]);
    
    jpgFileName = sprintf('%d.jpg',2*i-1);
    jpgPathName = sprintf('%s', jpgFileName);
    imwrite(imgNumber_Scale,jpgPathName,'jpg');
    close all;
    
end

for i = 1:12
    
    % create a figure
    hFigure = figure(1);
    set(hFigure, 'position',[100 100 300 300], 'color','k');
    % create an axes
    hAxes = axes('parent',hFigure);
    set(hAxes, 'units','pixels', 'position',[1 1 300 300]);
    axis([0 300 0 300]);
    
    text(150,150,'R', 'fontname','Microsoft YaHei', 'fontsize',96,'rotation',30*(i-2), 'HorizontalAlign','center', 'VerticalAlign','middle', 'color','w');
    
    axis off;
    hFrame = getframe(gcf);
    imgNumber = hFrame.cdata;
    imgNumber_Scale = imresize(imgNumber, [300 300]);
    imgNumber_Scale = flipud(imgNumber_Scale);
    imgNumber_Scale = rot90(imgNumber_Scale);
    imgNumber_Scale = rot90(imgNumber_Scale);
    jpgFileName = sprintf('%d.jpg',2*i);
    jpgPathName = sprintf('%s', jpgFileName);
    imwrite(imgNumber_Scale,jpgPathName,'jpg');
    close all;
    
end


