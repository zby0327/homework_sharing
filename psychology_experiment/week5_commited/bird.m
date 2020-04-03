%创建avi文件并设置视频参数
nframe=200;
frate=50;
v=VideoWriter('flyingbird.avi');
v.FrameRate=frate;
v.Quality=100;
timeperiod=1/frate;

%准备图片和运动参数
picname='angrybird_50x50.png';
[imgmat,mcolor,alphamat]=imread(picname);
x0=50;
y0=50;
v0x=150;
v0y=400;
g=200;

%开始写入
open(v);

for ii=1:nframe
    tmptime=timeperiod*ii;
    
    hfigure=figure(1);
    set(hfigure,'position',[200,50,800,600]);
    x=x0+tmptime*v0x;
    y=y0+v0y*tmptime-0.5*g*tmptime^2;
    axespic=axes('parent',hfigure);
    set(axespic,'units','pixels','position',[x y 50 50]);
    
    himg=imshow(imgmat,'parent',axespic);
    set(himg,'AlphaData',alphamat);
    
    hframe = getframe(gcf);
    writeVideo(v,hframe);
    close
end

close(v);