hFigure = figure(1);
set(hFigure, 'position',[100 100 1000 700], 'color','w');

hAxes_BKGround = axes('parent',hFigure);
set(hAxes_BKGround, 'units','pixels', 'position',[1 1 1000 700], 'xtick',[], 'ytick', []); axis([1 1000 1 700]); axis off;

mRect = [30 30 940 640];
mCurv = [0.15 0.2];
grayColor = [120 120 120]/255;
rectangle('Position',mRect, 'Curvature',mCurv, 'linewidth',30, 'facecolor',grayColor, 'edgecolor',[240 240 240]/255);

text(500,200,'Score', 'fontsize',250, 'fontname','Arial', 'HorizontalAlign','center', 'VerticalAlign','middle', 'color',[240 240 240]/255);

hFrame = getframe(gcf); imgMat_Magazine = hFrame.cdata;

imgMat_Magazine = imresize(imgMat_Magazine,[75 100], 'bilinear');
alphaMatrix_BW = im2bw(imgMat_Magazine,0.98);
alphaMatrix_BW = imresize(alphaMatrix_BW,[75 100], 'bilinear');
[m n d3] = size(imgMat_Magazine);
alphaMatrix = ones(m, n);
alphaMatrix(alphaMatrix_BW) = 0; 
alphaMatrix(~alphaMatrix_BW) = 0.7;
pngFileName = 'ScoreBox.png';
imwrite(imgMat_Magazine, pngFileName, 'png','alpha',alphaMatrix);
