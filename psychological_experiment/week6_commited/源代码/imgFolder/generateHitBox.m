hFigure = figure(1);
set(hFigure, 'position',[100 100 360 75], 'color','w');
hAxes_BKGround = axes('parent',hFigure);
set(hAxes_BKGround, 'units','pixels', 'position',[1 1 360 75], 'xtick',[], 'ytick',[]);
axis([1 360 1 75]);
axis off;
mRect = [3 3 354 69];
mCurv = [0.05 0.15];
grayColor = [120 120 120]/255;
rectangle('Position',mRect, 'Curvature',mCurv, 'linewidth',3, 'facecolor',grayColor, 'edgecolor',[240 240 240]/255);
text(46,35,'Hit', 'fontsize',32, 'fontname','Arial', 'HorizontalAlign','center', 'VerticalAlign','middle', 'color',[240 240 240]/255);
hFrame = getframe(gcf); imgMat_Magazine = hFrame.cdata;
imgMat_Magazine = imresize(imgMat_Magazine,[75 360], 'bilinear');
alphaMatrix_BW = im2bw(imgMat_Magazine,0.98);

[m n d3] = size(imgMat_Magazine);
alphaMatrix = ones(m, n);

alphaMatrix(alphaMatrix_BW) = 0;
alphaMatrix(~alphaMatrix_BW) = 1;
pngFileName = 'HitBox.png';
imwrite(imgMat_Magazine, pngFileName, 'png','alpha',alphaMatrix);
