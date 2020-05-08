
% create a figure
hFigure = figure(1);
set(hFigure, 'position',[100 50 900 600], 'color','w');

% create a uicontrol for zhidaoyu
hText_Kaishi = uicontrol('Style','Text', 'String','ָ����', 'Fontname','Microsoft Yahei', 'Position',[350 500 200 60], 'Fontsize',36, 'Backgroundcolor','w', 'Foregroundcolor','k');

% 
tmpInstr = sprintf('          �����ж���Ļ�ϵ�R�������Ļ��Ǿ���ģ�\n                ������������ת�ĽǶȣ�\n          ���������ģ���������ʳָ��F����\n          ����Ǿ���ģ���������ʳָ��J����');
hText_Content = uicontrol('style','text', 'String',tmpInstr,'HorizontalAlign','center', 'fontname','Microsoft Yahei', 'position',[90 150 720 250], 'fontsize',24, 'backgroundcolor','w', 'Foregroundcolor','k', 'HorizontalAlign','left');

tmpGo = '���ո����ʼ';
hText_Go = uicontrol('style','text', 'HorizontalAlign','center', 'String',tmpGo, 'fontname','Microsoft Yahei', 'position',[101 150 700 40], 'fontsize',24, 'Backgroundcolor','w', 'Foregroundcolor','k');

% snapshot
hFrame = getframe(gcf);
imgInstruction_Ori = hFrame.cdata;

jpgPathName_instruction = sprintf('Instruction_Start.jpg');
imwrite(imgInstruction_Ori, jpgPathName_instruction, 'jpg');
saveas(gcf,'Instruction_Start.jpg');
close all;