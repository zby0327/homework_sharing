function y = Main(~)

cjMatrix = generate_cjMatrix();
picIndex = 0;
trialNum = length(cjMatrix);

Column_TrialID = 1;
Column_Digit = 2;
Column_Type = 3;
Column_TimeInterval = 4;
Column_CorrectResponse = 5;

picFolderName = 'PicturesR';

jpgFileName_Instruction_Start = 'Instruction_Start.jpg';
jpgPathName_Instruction_Start = sprintf('%s/%s', picFolderName, jpgFileName_Instruction_Start);

jpgFileName_Instruction_Bye = 'Instruction_Byebye.jpg';
jpgPathName_Instruction_Bye = sprintf('%s/%s', picFolderName, jpgFileName_Instruction_Bye);

dStimuli = {};

for i = 1:24
    tmpDigitFileName = sprintf('%d.jpg',i);
    tmpDigitPathName = sprintf('%s/%s', picFolderName, tmpDigitFileName);
    dStimuli{i} = imread(tmpDigitPathName);
end

jpgFileName_Fixation = 'fixation.jpg';
jpgPathName_Fixation = sprintf('%s/%s', picFolderName, jpgFileName_Fixation);
imgMatrix_Fixation = imread(jpgPathName_Fixation);

scrSize = get(0,'ScreenSize');
scrWidth = scrSize(3);
scrHeight = scrSize(4);

figWidth = 1024;
figHeight = 768;
figX = (scrWidth - figWidth)/2 + 1;
figY = (scrHeight - figHeight)/2 + 1;

hFigure = figure(1);
set(hFigure, 'position',[figX figY figWidth figHeight]);
set(hFigure, 'NumberTitle','off','MenuBar','none', 'name','', 'color','k');

hAxes_BKGround = axes('parent',hFigure);
set(hAxes_BKGround, 'units','pixels', 'position',[1 1 figWidth figHeight] , 'color' ,'k');

imgMat_White = ones(figHeight, figWidth, 3);
imgMat_White(:)=0;
imshow(imgMat_White, 'parent',hAxes_BKGround);

hAxes_Instruction = axes('parent',hFigure);
set(hAxes_Instruction, 'units','pixels', 'position',[1 1 figWidth figHeight]);

imgMat_Instruction_Start = imread(jpgPathName_Instruction_Start);
imgMat_Instruction_Bye = imread(jpgPathName_Instruction_Bye);

hImage_Instruction = imshow(imgMat_Instruction_Start,'parent',hAxes_Instruction);

hAxes_Stimulus_Width = 300;
hAxes_Stimulus_Height = 300;
hAxes_Stimulus_X = (figWidth - hAxes_Stimulus_Width)/2 + 1;
hAxes_Stimulus_Y = (figHeight - hAxes_Stimulus_Height)/2 + 1;

hAxes_Stimulus = axes('parent',hFigure);
set(hAxes_Stimulus, 'units','pixels', 'position',[hAxes_Stimulus_X hAxes_Stimulus_Y hAxes_Stimulus_Width hAxes_Stimulus_Height]);

imgMat_White300x300 = ones(300,300,3);
imgMat_White300x300(:)=0;
hImage_Stimulus = imshow(imgMat_White300x300,'parent',hAxes_Stimulus);
set(hAxes_Stimulus,'visible','off');
set(hImage_Stimulus, 'visible','off');

strDate = strrep(datestr(now, 'HH:MM:SS'),':','_');
txtFileName = sprintf('Result_%s.txt',strDate);
fid = fopen(txtFileName,'a+');
fclose(fid);

mState_Press = 1;

set(hFigure, 'WindowKeyPressFcn',@hFigure_WindowKeyPressFcn);


    function hFigure_WindowKeyPressFcn(hObject, eventdata, hs)

        if mState_Press == 0
            return;
        end
        
        
        switch eventdata.Key
            case 'space'
                if picIndex == 0
                    set(hAxes_Instruction, 'visible','off');
                    set(hImage_Instruction, 'visible','off');
                    pause(1.0);
                    
                    picIndex = picIndex + 1;
                    
                    set(hAxes_Stimulus, 'visible','on');
                    imshow(imgMatrix_Fixation, 'parent',hAxes_Stimulus);
                    pause(0.5);

                    imshow(imgMat_White300x300,'parent',hAxes_Stimulus);
                    currentTimeInterval = cjMatrix(picIndex, Column_TimeInterval)/1000;
                    pause(currentTimeInterval);

                    tmpDigit = cjMatrix(picIndex, Column_Digit);
                    imgMat_currentDigit = dStimuli{tmpDigit};
                    imshow(imgMat_currentDigit,'parent',hAxes_Stimulus);

                    tic;

                    
                end
                
            case 'f'
                mState_Press = 0;
                
                if picIndex > 0

                    responseTime = toc;
                    responseTime = round(responseTime*1000);

                    correctResponse = cjMatrix(picIndex, Column_CorrectResponse);
                    if correctResponse == 1
                        acc = 1;
                    else
                        acc= 0;
                    end

                    trialID = cjMatrix(picIndex, Column_TrialID);
                    tmpDigit = cjMatrix(picIndex, Column_Digit);
                    tmpType = cjMatrix(picIndex, Column_Type);
                    % correctResponse
                    tmpTimeInterval = cjMatrix(picIndex, Column_TimeInterval);
                    
                    fid = fopen(txtFileName, 'a+');
                    fprintf(fid, '%d %d %d %d %d\r\n', trialID, tmpDigit,correctResponse,responseTime, acc);
                    fclose(fid);
                    
                    if picIndex < trialNum

                        imshow(imgMat_White300x300, 'parent',hAxes_Stimulus);
                        pause(1.0);
                        
                        % picIndex++
                        picIndex = picIndex + 1;
                        
                        % set hAxes_Stimulus , visible on
                        set(hAxes_Stimulus, 'visible','on');
                        imshow(imgMatrix_Fixation, 'parent',hAxes_Stimulus);
                        pause(0.5);

                        imshow(imgMat_White300x300,'parent',hAxes_Stimulus);
                        currentTimeInterval = cjMatrix(picIndex, Column_TimeInterval)/1000;
                        pause(currentTimeInterval);

                        tmpDigit = cjMatrix(picIndex, Column_Digit);
                        imgMat_currentDigit = dStimuli{tmpDigit};
                        imshow(imgMat_currentDigit,'parent',hAxes_Stimulus);
                        
                        tic;

                        mState_Press = 1;
                        
                    else
                        picIndex = picIndex + 1;   % trialNum + 1

                        hImage_Stimulus = imshow(imgMat_White300x300,'parent',hAxes_Stimulus);
                        set(hAxes_Stimulus, 'visible','off');
                        set(hImage_Stimulus, 'visible','off');
                        
                        % show  the bye bye instruction
                        hImage = imshow(imgMat_Instruction_Bye,'parent',hAxes_Instruction);
                        
                        
                    end
                    
                end
                
            case 'j'
                
                % Locked == 0
                mState_Press = 0;
                
                
                if picIndex > 0
                    % record rt
                    responseTime = toc;
                    responseTime = round(responseTime*1000);
                    
                    % record acc
                    correctResponse = cjMatrix(picIndex, Column_CorrectResponse);
                    if correctResponse == 2
                        acc = 1;
                    else
                        acc= 0;
                    end
                    
                    % write the data into .txt file
                    trialID = cjMatrix(picIndex, Column_TrialID);
                    tmpDigit = cjMatrix(picIndex, Column_Digit);
                    tmpType = cjMatrix(picIndex, Column_Type);
                    % correctResponse
                    tmpTimeInterval = cjMatrix(picIndex, Column_TimeInterval);
                    
                    fid = fopen(txtFileName, 'a+');
                    fprintf(fid, '%d %d %d %d %d\r\n', trialID, tmpDigit,correctResponse, responseTime, acc);
                    fclose(fid);
                    
                    
                    if picIndex < trialNum

                        imshow(imgMat_White300x300, 'parent',hAxes_Stimulus);
                        pause(1.0);

                        picIndex = picIndex + 1;

                        set(hAxes_Stimulus, 'visible','on');
                        imshow(imgMatrix_Fixation, 'parent',hAxes_Stimulus);
                        pause(0.5);

                        imshow(imgMat_White300x300,'parent',hAxes_Stimulus);
                        currentTimeInterval = cjMatrix(picIndex, Column_TimeInterval)/1000;
                        pause(currentTimeInterval);

                        tmpDigit = cjMatrix(picIndex, Column_Digit);
                        imgMat_currentDigit = dStimuli{tmpDigit};
                        imshow(imgMat_currentDigit,'parent',hAxes_Stimulus);

                        tic;
                        
                        % Locked == 0
                        mState_Press = 1;
                    else
                        picIndex = picIndex + 1;

                        hImage_Stimulus = imshow(imgMat_White300x300,'parent',hAxes_Stimulus);
                        set(hAxes_Stimulus, 'visible','off');
                        set(hImage_Stimulus, 'visible','off');
                        

                        hImage = imshow(imgMat_Instruction_Bye,'parent',hAxes_Instruction);
                        
                        
                    end
                end

                
        end
    end

y = hFigure;

end