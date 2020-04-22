% filename is:: generateInstruction_Bye.m

% clear
clc; clear; close all;

% prepare picFolderName
picFolderName = 'Instructions';

if ~exist(picFolderName, 'dir')
    mkdir(picFolderName);
end

% create a figure
hFigure = figure(1);
set(hFigure, 'position',[100 50 900 600], 'color','w');

% create a uicontrol for zhidaoyu
% hText_Kaishi = uicontrol('Style','Text', 'String','指导语', 'Fontname','Microsoft Yahei', 'Position',[351 500 200 60], 'Fontsize',36, 'Backgroundcolor','w', 'Foregroundcolor','k');

% 
% tmpInstr = sprintf('请您根据屏幕上方呈现的单词选择其中与这个单词语义相符的图片，\n如果是左边的图片相符，请按J键；\n如果是中间的图片相符，请按K键；\n如果是右边的图片相符，请按L键。');
% hText_Content = uicontrol('style','text', 'String',tmpInstr, 'fontname','Microsoft Yahei', 'position',[91 150 720 300], 'fontsize',24, 'backgroundcolor','w', 'Foregroundcolor','k', 'HorizontalAlign','left');

tmpGo = '感谢参与我们的实验！';
hText_Go = uicontrol('style','text', 'HorizontalAlign','center', 'String',tmpGo, 'fontname','Microsoft Yahei', 'position',[101 300 700 40], 'fontsize',24, 'Backgroundcolor','w', 'Foregroundcolor','k');

% snapshot
hFrame = getframe(gcf);
imgInstruction_Ori = hFrame.cdata;
% imgInstruction = imresize(imgInstruction_Ori, [600 900]);

jpgFileName_instruction = 'Instruction_Bye.jpg';
jpgPathName_instruction = sprintf('%s/%s', picFolderName, jpgFileName_instruction);
imwrite(imgInstruction_Ori, jpgPathName_instruction, 'jpg');
saveas(gcf,'goodbye.bmp');