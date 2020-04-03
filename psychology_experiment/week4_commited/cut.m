function yy=cut3(~)

%figure
figurewidth=600;
figureheight=400;
hfigure=figure(1);
set(hfigure,'position',[100 100 figurewidth figureheight]);

%白色背景
axesback=axes('parent',hfigure);
set(axesback,'units','pixels','position',[1 1 figurewidth figureheight]);
imgmat=ones(figureheight,figurewidth,3);
imshow(imgmat,'parent',axesback);

%待切割的图片
picname='animalss.jpg';
imgmatrix=imread(picname);
axespic=axes('parent',hfigure);
set(axespic,'units','pixels','position',[31 51 size(imgmatrix,2) size(imgmatrix,1)]);
imshow(imgmatrix,'parent',axespic);

%红绿蓝
R=10;
alpha=0:pi/60:2*pi;
x=R*cos(alpha);
y=R*sin(alpha);

axesred=axes('parent',hfigure);
set(axesred,'units','pixels','position',[101 361 20 20]);
axis([-10 10 -10 10]);
fill(axesred,x,y,'-r','edgecolor','w', 'linewidth',2);
axis off;

axesgreen=axes('parent',hfigure);
set(axesgreen,'units','pixels','position',[151 361 20 20]);
axis([-10 10 -10 10]);
fill(axesgreen,x,y,'-g','edgecolor','w', 'linewidth',2);
axis off;

axesblue=axes('parent',hfigure);
set(axesblue,'units','pixels','position',[201 361 20 20]);
axis([-10 10 -10 10]);
fill(axesblue,x,y,'-b','edgecolor','w', 'linewidth',2);
axis off;

%输入参数
uicontrol('Style','text', 'String','Width', 'fontsize',12, 'position',[451 301 60 30], 'HorizontalAlign','left', 'backgroundcolor','w');
uicontrol('Style','text', 'String','Height', 'fontsize',12, 'position',[521 301 60 30], 'HorizontalAlign','left', 'backgroundcolor','w');
spicwidth=uicontrol('Style','edit', 'String','60', 'fontsize',12, 'position',[455 281 40 20]);
spicheight=uicontrol('Style','edit', 'String','90', 'fontsize',12, 'position',[525 281 40 20]);

uicontrol('Style','text', 'String','row', 'fontsize',12, 'position',[461 221 60 30], 'HorizontalAlign','left', 'backgroundcolor','w');
uicontrol('Style','text', 'String','column', 'fontsize',12, 'position',[521 211 60 40], 'HorizontalAlign','left', 'backgroundcolor','w');
spicrow=uicontrol('Style','edit', 'String','3', 'fontsize',12, 'position',[455 201 40 20]);
spiccolumn=uicontrol('Style','edit', 'String','4', 'fontsize',12, 'position',[525 201 40 20]);

hbutton=uicontrol('Style','pushbutton', 'String','切割', 'fontsize',15, 'position',[471 121 80 30],'backgroundcolor','w');

% --- Binding Mechanism ---
set(hfigure, 'WindowButtonDownFcn',@down);
set(hfigure, 'WindowButtonUpFcn',@up);
set(hfigure, 'WindowButtonMotionFcn',@motion);
set(hbutton, 'Callback',@slice);

%鼠标
mouse = 0;
inred = 0;
ingreen = 0;
inblue = 0;

%判断鼠标是否点中三个圆
    function down(~,~,~)
        mouse=1;
        
        ptmouse=get(axesback,'CurrentPoint');
        ptmouse_x=ptmouse(1);
        ptmouse_y=figureheight-ptmouse(3);
        
        posred=get(axesred,'position');
        judgeinred=ptmouse_x>posred(1)&ptmouse_x<(posred(1)+20)&ptmouse_y>posred(2)&ptmouse_y<(posred(2)+20);
        if judgeinred
            inred=1;
        end
        posgreen=get(axesgreen,'position');
        judgeingreen=ptmouse_x>posgreen(1)&ptmouse_x<(posgreen(1)+20)&ptmouse_y>posgreen(2)&ptmouse_y<(posgreen(2)+20);
        if judgeingreen
            ingreen=1;
        end
        posblue=get(axesblue,'position');
        judgeinblue=ptmouse_x>posblue(1)&ptmouse_x<(posblue(1)+20)&ptmouse_y>posblue(2)&ptmouse_y<(posblue(2)+20);
        if judgeinblue
            inblue=1;
        end
    end

%鼠标抬起
    function up(~,~,~)
        mouse = 0;
        inred = 0;
        ingreen = 0;
        inblue = 0;
    end

%鼠标跟随圆点动
    function motion(~,~,~)
        if mouse&&inred
            ptmouse=get(axesback,'CurrentPoint');
            ptmouse_x=ptmouse(1);
            ptmouse_y=figureheight-ptmouse(3);
            posred=[ptmouse_x-10 ptmouse_y-10 20 20];
            set(axesred,'position',posred);
        end
        
        if mouse&&ingreen
            ptmouse=get(axesback,'CurrentPoint');
            ptmouse_x=ptmouse(1);
            ptmouse_y=figureheight-ptmouse(3);
            posgreen=[ptmouse_x-10 ptmouse_y-10 20 20];
            set(axesgreen,'position',posgreen);
        end
        
        if mouse&&inblue
            ptmouse=get(axesback,'CurrentPoint');
            ptmouse_x=ptmouse(1);
            ptmouse_y=figureheight-ptmouse(3);
            posblue=[ptmouse_x-10 ptmouse_y-10 20 20];
            set(axesblue,'position',posblue);
        end
    end


%切割计算
    function slice(~,~,~)
        %红点水平和垂直边距
        rectred=get(axesred,'position');
        rectpic=get(axespic,'position');
        edge_x=rectred(1)-rectpic(1);
        edge_y=rectpic(4)+rectpic(2)-1-rectred(2);
        
        %水平垂直间隔
        rectgreen=get(axesgreen,'position');
        interval_x=rectgreen(1)-rectred(1);
        rectblue=get(axesblue,'position');
        interval_y=rectred(2)-rectblue(2);
        
        %获取width、height、row、column
        picwidth=str2num(get(spicwidth,'string'));
        picheight=str2num(get(spicheight,'string'));
        picrow=str2num(get(spicrow,'string'));
        piccolumn=str2num(get(spiccolumn,'string'));
        
        %切割
        foldername='imagesR';
        if ~exist(foldername)
            mkdir(foldername);
        end
        names = {'Rat', 'Ox', 'Tiger', 'Pig'; 'Dragon', 'Snake', 'Horse', 'Goat'; 'Monkey', 'Roaster', 'Dog', 'Rabbit'};
        for ii=1:picrow
            for jj=1:piccolumn
                tmpmatrix=imgmatrix(round(edge_y+(ii-1)*interval_y-picheight/2):round(edge_y+(ii-1)*interval_y+picheight/2),...
                    round(edge_x+(jj-1)*interval_x-picwidth/2):round(edge_x+(jj-1)*interval_x+picwidth/2),:);
                tmpname=names{ii,jj};
                tmppicname=sprintf('%s.jpg',tmpname);
                tmppathname=sprintf('%s/%s',foldername,tmppicname);
                imwrite(tmpmatrix,tmppathname,'jpg');
            end
        end
    end

y=hfigure;
end
