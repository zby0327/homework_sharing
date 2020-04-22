% filename is:: generateInstruction_Start.m

% clear
clc; clear; close all;
% prepare picFolderName
picFolderName = 'Instructions';

if ~exist(picFolderName, 'dir')
    mkdir(picFolderName);
end

% create a figure
hFigure = figure(1);
set(hFigure, 'position',[100 50 900 600], 'color','k');

% create a uicontrol for zhidaoyu
hText_Kaishi = uicontrol('Style','Text', 'String','指导语', 'Fontname','Microsoft Yahei', 'Position',[351 500 200 60], 'Fontsize',36, 'Backgroundcolor','k', 'Foregroundcolor','w');

% 
tmpInstr = sprintf('            请您判断屏幕上两个数字哪个较大，\n            如果左边大，请用左手食指按F键；\n            如果右边大，请用右手食指按J键。');
hText_Content = uicontrol('style','text', 'String',tmpInstr,'HorizontalAlign','center', 'fontname','Microsoft Yahei', 'position',[90 150 720 250], 'fontsize',24, 'backgroundcolor','k', 'Foregroundcolor','w', 'HorizontalAlign','left');

tmpGo = '请按空格开始正式实验';
hText_Go = uicontrol('style','text', 'HorizontalAlign','center', 'String',tmpGo, 'fontname','Microsoft Yahei', 'position',[101 150 700 40], 'fontsize',24, 'Backgroundcolor','k', 'Foregroundcolor','w');

% snapshot
hFrame = getframe(gcf);
imgInstruction_Ori = hFrame.cdata;
% imgInstruction = imresize(imgInstruction_Ori, [600 900]);

jpgFileName_instruction = 'Instruction_Start.jpg';
jpgPathName_instruction = sprintf('%s/%s', picFolderName, jpgFileName_instruction);
imwrite(imgInstruction_Ori, jpgPathName_instruction, 'bmp');
saveas(gcf,'instruction.bmp');