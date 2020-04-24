hFigure = figure(1); 
set(hFigure, 'position',[1 1 1500 400], 'color','w');
hAxes_BKGround = axes('parent',hFigure);
set(hAxes_BKGround, 'units','pixels', 'position',[1 1 1500 400], 'xtick',[], 'ytick', []);
axis([1 1500 1 400]);
axis off;

mRect = [20 20 1190 320]; mCurv = [0.1 0.3]; grayColor = [120 120 120]/255;
rectangle('Position',mRect, 'Curvature',mCurv, 'linewidth',18, 'facecolor',grayColor, 'edgecolor',[240 240 240]/255);

text(600,180,'Click to Start', 'fontsize',72, 'fontname','Arial', 'HorizontalAlign','center', 'VerticalAlign','middle', 'color',[240 240 240]/255);
hFrame = getframe(gcf);
imgMat_FlyAway = hFrame.cdata;
alphaMatrix_BW = im2bw(imgMat_FlyAway,0.98);

imgMat_FlyAway = imresize(imgMat_FlyAway,[80 300], 'bilinear');
[m n d3] = size(imgMat_FlyAway);
alphaMatrix = ones(m, n);
alphaMatrix_BW = imresize(alphaMatrix_BW,[80 300], 'bilinear');
alphaMatrix(alphaMatrix_BW) = 0; alphaMatrix(~alphaMatrix_BW) = 1;
pngFileName = 'click.png';
imwrite(imgMat_FlyAway, pngFileName, 'png','alpha',alphaMatrix);