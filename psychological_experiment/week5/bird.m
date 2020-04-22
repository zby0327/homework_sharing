%����avi�ļ���������Ƶ����
nframe=200;
frate=50;
v=VideoWriter('flyingbird.avi');
v.FrameRate=frate;
v.Quality=100;
timeperiod=1/frate;

%׼��ͼƬ���˶�����
picname='angrybird_50x50.png';
[imgmat,mcolor,alphamat]=imread(picname);
x0=50;
y0=50;
v0x=150;
v0y=400;
g=200;

%��ʼд��
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