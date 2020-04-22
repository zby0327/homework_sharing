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
set(hFigure, 'position',[100 50 900 600], 'color','w');

% create a uicontrol for zhidaoyu
hText_Kaishi = uicontrol('Style','Text', 'String','ָ����', 'Fontname','Microsoft Yahei', 'Position',[351 500 200 60], 'Fontsize',36, 'Backgroundcolor','w', 'Foregroundcolor','k');

% 
tmpInstr = sprintf('            �����ж���Ļ�ϵĴ�����ʻ��Ǽٴʣ�\n            �������ʣ���������ʳָ��F����\n            ����Ǽٴʣ���������ʳָ��J����');
hText_Content = uicontrol('style','text', 'String',tmpInstr,'HorizontalAlign','center', 'fontname','Microsoft Yahei', 'position',[91 150 720 300], 'fontsize',24, 'backgroundcolor','w', 'Foregroundcolor','k', 'HorizontalAlign','left');

tmpGo = '�밴�ո�ʼ��ʽʵ��';
hText_Go = uicontrol('style','text', 'HorizontalAlign','center', 'String',tmpGo, 'fontname','Microsoft Yahei', 'position',[101 150 700 40], 'fontsize',24, 'Backgroundcolor','w', 'Foregroundcolor','k');

% snapshot
hFrame = getframe(gcf);
imgInstruction_Ori = hFrame.cdata;
% imgInstruction = imresize(imgInstruction_Ori, [600 900]);

jpgFileName_instruction = 'Instruction_Start.jpg';
jpgPathName_instruction = sprintf('%s/%s', picFolderName, jpgFileName_instruction);
imwrite(imgInstruction_Ori, jpgPathName_instruction, 'bmp');
saveas(gcf,'instruction.bmp');