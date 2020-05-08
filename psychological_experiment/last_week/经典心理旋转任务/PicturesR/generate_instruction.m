
% create a figure
hFigure = figure(1);
set(hFigure, 'position',[100 50 900 600], 'color','w');

% create a uicontrol for zhidaoyu
hText_Kaishi = uicontrol('Style','Text', 'String','指导语', 'Fontname','Microsoft Yahei', 'Position',[350 500 200 60], 'Fontsize',36, 'Backgroundcolor','w', 'Foregroundcolor','k');

% 
tmpInstr = sprintf('          请您判断屏幕上的R是正常的还是镜像的，\n                （不管他们旋转的角度）\n          如果是正向的，请用左手食指按F键；\n          如果是镜像的，请用右手食指按J键。');
hText_Content = uicontrol('style','text', 'String',tmpInstr,'HorizontalAlign','center', 'fontname','Microsoft Yahei', 'position',[90 150 720 250], 'fontsize',24, 'backgroundcolor','w', 'Foregroundcolor','k', 'HorizontalAlign','left');

tmpGo = '按空格键开始';
hText_Go = uicontrol('style','text', 'HorizontalAlign','center', 'String',tmpGo, 'fontname','Microsoft Yahei', 'position',[101 150 700 40], 'fontsize',24, 'Backgroundcolor','w', 'Foregroundcolor','k');

% snapshot
hFrame = getframe(gcf);
imgInstruction_Ori = hFrame.cdata;

jpgPathName_instruction = sprintf('Instruction_Start.jpg');
imwrite(imgInstruction_Ori, jpgPathName_instruction, 'jpg');
saveas(gcf,'Instruction_Start.jpg');
close all;