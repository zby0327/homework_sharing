function y = shotABird(~)

% prepare
pngFileName_Gunsight = 'Gunsight.png';
pngFileName_ABird = 'angrybird50x50.png';
pngFileName_ABird_Hurt = 'angrybird50x50_Hurt.png';

% create a figure
hFigure = figure(1);
set(hFigure, 'position',[100 40 600 600]);
set(gcf, 'Pointer', 'custom', 'PointerShapeCData', NaN(16,16));

% create an axes for BKGround
hAxes_BKGround = axes('parent',hFigure);
set(hAxes_BKGround, 'units','pixels', 'position',[1 1 600 600], 'xtick',[], 'ytick',[]);

% create another axes for angryBird
hAxes_ABird = axes('parent',hFigure);
set(hAxes_ABird, 'units','pixels', 'position',[100 100 50 50]);

% imread angrybird png
[imgMatrix_ABird mColorMap_ABird mAlphaData_ABird] = imread(pngFileName_ABird);
hImage_ABird = imshow(imgMatrix_ABird,'parent',hAxes_ABird);
set(hImage_ABird,'AlphaData',mAlphaData_ABird);

[imgMatrix_ABird_Hurt mColorMap_ABird_Hurt mAlphaData_ABird_Hurt] = imread(pngFileName_ABird_Hurt);
% hImage_ABird_Hurt = imshow(imgMatrix_ABird_Hurt,'parent',hAxes_ABird);
% set(hImage_ABird_Hurt,'AlphaData',mAlphaData_ABird_Hurt);

% create an axes for gunsight
hAxes_Gunsight = axes('parent',hFigure);
set(hAxes_Gunsight, 'units','pixels', 'position',[300 300 50 50]);

% imread gunsight png
[imgMatrix_Gunsight mColorMap_Gunsight mAlphaData_Gunsight]= imread(pngFileName_Gunsight);
hImage_Gunsight = imshow(imgMatrix_Gunsight,'parent',hAxes_Gunsight);
set(hImage_Gunsight,'AlphaData',mAlphaData_Gunsight);


% prepare a global variable mRect_hAxes_Gunsight
mRect_hAxes_Gunsight = get(hAxes_Gunsight,'position');

% prepare a global variable v_ABird
v_ABird = 100; % 100 pixels for each s

% timer
timePeriod = 0.01;
t = timer('TimerFcn', @timerCallback, 'ExecutionMode','fixedDelay', 'Period',timePeriod);
start(t);

% Binding Mechanism
set(hFigure,'WindowButtonMotionFcn',@hFigure_WindowButtonMotionFcn);
set(hFigure,'WindowButtonDownFcn',@hFigure_WindowButtonDownFcn);
set(hFigure,'DeleteFcn',@hFigure_DeleteFcn);

% function --> hFigure_WindowButtonMotionFcn
    function hFigure_WindowButtonMotionFcn(hObject, hEvent, hs)
        pt = get(hAxes_BKGround,'CurrentPoint');
        pt_x = round(pt(1) * 600);
        pt_y = round(pt(3) * 600);
        
        tmpRect = [pt_x-25 pt_y-25 50 50];      % 设定微调x y距离差25的愤怒的小鸟的坐标轴的位置信息，让鼠标处于愤怒的小鸟中间的位置
        set(hAxes_Gunsight, 'position',tmpRect);   % 让坐标轴紧跟鼠标
    end

% function --> hFigure_WindowButtonDownFcn
    function hFigure_WindowButtonDownFcn(hObject, hEvent, hs)
        pt = get(hAxes_BKGround,'CurrentPoint');
        pt_x = round(pt(1) * 600);
        pt_y = round(pt(3) * 600);
        
        mRect_hAxes_ABird = get(hAxes_ABird, 'position');
        
        mState_pt_inhAxes_ABird_Field = pt_x > mRect_hAxes_ABird(1) & pt_x < mRect_hAxes_ABird(1) + 50 & pt_y > mRect_hAxes_ABird(2) & pt_y < mRect_hAxes_ABird(2) + 50;
        if mState_pt_inhAxes_ABird_Field
            hImage_ABird_Hurt = imshow(imgMatrix_ABird_Hurt,'parent',hAxes_ABird);
            set(hImage_ABird_Hurt,'AlphaData',mAlphaData_ABird_Hurt);
            stop(t);
        end
        
        
    end

% functon --> timerCallback
    function timerCallback(~,~,~)
        % get the bird pos
        hAxes_AB_pos = get(hAxes_ABird, 'position');
        dis = v_ABird * timePeriod;
        hAxes_AB_pos(1) = hAxes_AB_pos(1) + dis;
        set(hAxes_ABird, 'position',hAxes_AB_pos);
        
        if hAxes_AB_pos(1) > 550 | hAxes_AB_pos(1) < 0
            v_ABird = - v_ABird;
        end
    end

% function --> hFigure_DeleteFcn
    function hFigure_DeleteFcn(hObject, hEvent, handles)
        stop(t); delete(t);
    end

y = 1;
end

