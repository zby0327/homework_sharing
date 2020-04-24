classdef WinViewer < handle
    properties
        viewSize
        hFigure
        hAxes_BKGround
        hAxes_Ground
        hImage_Ground
        hAxes_Sky
        hImage_Sky
        hAxes_FlyAway
        rect_hAxes_FlyAway_inCenter
        rect_hAxes_FlyAway_out2Top
        hImage_FlyAway
        hAxes_Tree
        hImage_Tree
        hAxes_Grass
        hImage_Grass
        hAxes_ABird
        hImage_ABird
        hAxes_click
        hImage_click
        hAxes_GSight
        hImage_GSight
        hAxes_Magazine
        hImage_Magazine
        imgMat_Bullet
        alphaMat_Bullet
        hAxes_word
        hImage_word
        hAxes_word2
        hImage_word2
        hAxes_word3
        hImage_word3
        hAxes_Bullet01
        hAxes_Bullet02
        hAxes_Bullet03
        hImage_Bullet01
        hImage_Bullet02
        hImage_Bullet03
        hAxes_HitBox
        hImage_HitBox
        hAxes_loading1
        hImage_loading1
        hAxes_loading2
        hImage_loading2
        hAxes_loading3
        hImage_loading3
        hAxes_bwABird01
        hAxes_bwABird02
        hAxes_bwABird03
        hAxes_bwABird04
        hAxes_bwABird05
        hAxes_bwABird06
        hImage_bwABird01
        hImage_bwABird02
        hImage_bwABird03
        hImage_bwABird04
        hImage_bwABird05
        hImage_bwABird06
        imgMat_bwRGB_ABird
        imgMat_bwRGB_ABird_Red
        imgMat_bwRGB_ABird_Gray
        hAxes_instruction
        hImage_instruction
        hAxes_ScoreBox
        hImage_ScoreBox
        hText_ScoreBox
        hAxes_Text
        mScore
        angrybirdObj
        gunsightObj
        moveTimerObj
        flyTimerObj
        dropTimerObj
        cjMatrixObj
        txtPathName_Data
        fid
        dataVector
        dataMatrix
        hImage_GameOver
        hAxes_GameOver
        started
        word
    end
    
    methods
        function obj = WinViewer(timePeriod)
            imgFolderName = 'imgFolder';
            dataFolderName = 'dataFolder';
            if ~exist(dataFolderName)
                mkdir(dataFolderName);
            end
            dateString = datestr(now,'HH:MM:SS');
            dateString_Rep = strrep(dateString,':','_');
            txtFileName_Data = sprintf('Result_%s.txt', dateString_Rep);
            obj.txtPathName_Data = sprintf('%s/%s', dataFolderName, txtFileName_Data);
            obj.fid = fopen(obj.txtPathName_Data, 'a+');
            fprintf(obj.fid, 'trialid x y Vx Vy moveUpperLimit\n');
            fclose(obj.fid);
            obj.dataVector = zeros(1,6);
            obj.dataMatrix = zeros(6,6);
            
            
            obj.angrybirdObj = AngryBird();
            obj.gunsightObj = GunSight();
            obj.moveTimerObj = timer('ExecutionMode','fixedDelay', 'Period',timePeriod);
            obj.flyTimerObj = timer('ExecutionMode','fixedDelay', 'Period',timePeriod);
            obj.dropTimerObj = timer('ExecutionMode','fixedDelay', 'Period',timePeriod);
            obj.cjMatrixObj = CjMatrix();
            scrSize = get(0,'ScreenSize');
            scrWidth = scrSize(3);
            scrHeight = scrSize(4);
            
            figWidth = 800;
            figHeight = 600;
            
            figX = (scrWidth - figWidth)/2 + 1;
            figY = (scrHeight - figHeight)/2 + 1;
            
            obj.viewSize = [figX figY figWidth figHeight];
            obj.hFigure = figure(1);
            set(obj.hFigure, 'position',obj.viewSize);
            
            set(obj.hFigure, 'color','w', 'name','Game: Angry Bird Hunt', 'numbertitle','off', 'menubar','none');
            
            set(obj.hFigure, 'Pointer','custom', 'PointerShapeCData',NaN(16,16));
            
            obj.hAxes_BKGround = axes('parent',obj.hFigure);
            set(obj.hAxes_BKGround, 'units','pixels', 'position',[1 1 figWidth figHeight]);
            
            set(obj.hAxes_BKGround, 'xtick',[], 'ytick',[], 'xcolor','w', 'ycolor','w');
            
            obj.hAxes_Ground = axes('parent',obj.hFigure);
            set(obj.hAxes_Ground, 'units','pixels', 'position',[1 1 800 150]);
            jpgFileName_Ground = 'ground.jpg';
            jpgPathName_Ground = sprintf('%s/%s', imgFolderName, jpgFileName_Ground);
            [imgMat_Ground , ~, ~] = imread(jpgPathName_Ground);
            imgMat_Ground_Scale = imresize(imgMat_Ground, [150 800]);
            obj.hImage_Ground = imshow(imgMat_Ground_Scale,'parent',obj.hAxes_Ground);
            
            pngFileName_Magazine = 'magazine.png';
            pngPathName_Magazine = sprintf('%s/%s', imgFolderName, pngFileName_Magazine);
            [imgMat_Magazine , ~, alphaMat_Magazine] = imread(pngPathName_Magazine);
            [rowNum_Magazine, columnNum_Magazine , ~] = size(imgMat_Magazine);
            obj.hAxes_Magazine = axes('parent',obj.hFigure);
            set(obj.hAxes_Magazine, 'units','pixels', 'position',[81 35 columnNum_Magazine rowNum_Magazine]);
            obj.hImage_Magazine = imshow(imgMat_Magazine,'parent',obj.hAxes_Magazine);
            set(obj.hImage_Magazine, 'alphadata',alphaMat_Magazine);
            
            pngFileName_Bullet = 'bullet.png';
            pngPathName_Bullet = sprintf('%s/%s', imgFolderName, pngFileName_Bullet);
            [imgMat_Bullet , ~, alphaMat_Bullet] = imread(pngPathName_Bullet);
            obj.imgMat_Bullet = imgMat_Bullet;
            obj.alphaMat_Bullet = alphaMat_Bullet;
            imgMat_Bullet = imresize(imgMat_Bullet,[25 15]);
            alphaMat_Bullet = imresize(alphaMat_Bullet,[25 15]);
            [mm, nn] = size(alphaMat_Bullet);
            
            
            iniY_Bullet01 = 75;
            iniX_Bullet01 = 105;
            x_Interval_Bullets = 30;
            obj.hAxes_Bullet01 = axes('parent',obj.hFigure);
            set(obj.hAxes_Bullet01, 'units','pixels', 'position',[iniX_Bullet01 iniY_Bullet01 nn mm]);
            obj.hImage_Bullet01 = imshow(imgMat_Bullet,'parent',obj.hAxes_Bullet01);
            
            set(obj.hImage_Bullet01, 'alphadata',alphaMat_Bullet);
            obj.hAxes_Bullet02 = axes('parent',obj.hFigure);
            set(obj.hAxes_Bullet02, 'units','pixels', 'position', [iniX_Bullet01+x_Interval_Bullets iniY_Bullet01 nn mm]);
            obj.hImage_Bullet02 = imshow(imgMat_Bullet,'parent',obj.hAxes_Bullet02);
            set(obj.hImage_Bullet02, 'alphadata',alphaMat_Bullet);
            
            
            obj.hAxes_Bullet03 = axes('parent',obj.hFigure);
            set(obj.hAxes_Bullet03, 'units','pixels', 'position', [iniX_Bullet01+2*x_Interval_Bullets iniY_Bullet01 nn mm]);
            obj.hImage_Bullet03 = imshow(imgMat_Bullet,'parent',obj.hAxes_Bullet03);
            set(obj.hImage_Bullet03, 'alphadata',alphaMat_Bullet);
            
            pngFileName_HitBox = 'HitBox.png';
            pngPathName_HitBox = sprintf('%s/%s', imgFolderName, pngFileName_HitBox);
            [imgMat_HitBox , ~, alphaMat_HitBox] = imread(pngPathName_HitBox);
            [rowNum_HitBox, columnNum_HitBox , ~] = size(imgMat_HitBox);
            obj.hAxes_HitBox = axes('parent',obj.hFigure);
            set(obj.hAxes_HitBox, 'units','pixels', 'position',[221 35 columnNum_HitBox rowNum_HitBox]);
            obj.hImage_HitBox = imshow(imgMat_HitBox,'parent',obj.hAxes_HitBox);
            set(obj.hImage_HitBox, 'alphadata',alphaMat_HitBox);
            
            imgMat_bwRGB_ABird = obj.angrybirdObj.imgMatrix_ABird_Forward;
            imgMat_bwRGB_ABird_Red = obj.angrybirdObj.imgMatrix_ABird_Forward;
            imgMat_bwRGB_ABird_Gray = obj.angrybirdObj.imgMatrix_ABird_Forward;
            
            alphaMat_ABird = obj.angrybirdObj.alphaMatrix_ABird_Forward;
            alphaMat_ABird_Red = obj.angrybirdObj.alphaMatrix_ABird_Forward;
            alphaMat_ABird(alphaMat_ABird == 0) = 120;
            imgMat_bwRGB_ABird(:,:,1) = alphaMat_ABird;
            imgMat_bwRGB_ABird(:,:,2) = alphaMat_ABird;
            imgMat_bwRGB_ABird(:,:,3) = alphaMat_ABird;
            alphaMat_ABird(alphaMat_ABird>120) = 220;
            
            
            imgMat_bwRGB_ABird_Gray(:,:,1) = alphaMat_ABird;
            imgMat_bwRGB_ABird_Gray(:,:,2) = alphaMat_ABird;
            imgMat_bwRGB_ABird_Gray(:,:,3) = alphaMat_ABird;
            alphaMat_ABird_Red(alphaMat_ABird_Red == 0) = 120;
            alphaMat_ABird_Red(alphaMat_ABird_Red > 120) = 240;
            
            imgMat_bwRGB_ABird_Red(:,:,1) = alphaMat_ABird_Red;
            alphaMat_ABird_Red(alphaMat_ABird_Red > 120) = 180;
            imgMat_bwRGB_ABird_Red(:,:,2) = alphaMat_ABird_Red;
            
            imgMat_bwRGB_ABird_Red(:,:,3) = alphaMat_ABird_Red;
            
            obj.imgMat_bwRGB_ABird = imresize(imgMat_bwRGB_ABird,[30 30]);
            obj.imgMat_bwRGB_ABird_Red = imresize(imgMat_bwRGB_ABird_Red, [30 30]);
            obj.imgMat_bwRGB_ABird_Gray = imresize(imgMat_bwRGB_ABird_Gray,[30 30]);
            horizontal_Interval_bwABird = 43;
            iniX_bwABird = 306;
            iniY_bwABird = 53;
            width_bwABird = 30;
            height_bwABird = 30;
            interval_N = 1 - 1;
            obj.hAxes_bwABird01 = axes('parent',obj.hFigure);
            set(obj.hAxes_bwABird01, 'units','pixels', 'position', [iniX_bwABird+interval_N*horizontal_Interval_bwABird iniY_bwABird width_bwABird height_bwABird]);
            obj.hImage_bwABird01 = imshow(obj.imgMat_bwRGB_ABird, 'parent',obj.hAxes_bwABird01);
            interval_N = 2 - 1;
            obj.hAxes_bwABird02 = axes('parent',obj.hFigure);
            
            set(obj.hAxes_bwABird02, 'units','pixels', 'position', [iniX_bwABird+interval_N*horizontal_Interval_bwABird iniY_bwABird width_bwABird height_bwABird]);
            obj.hImage_bwABird02 = imshow(obj.imgMat_bwRGB_ABird,'parent',obj.hAxes_bwABird02);
            interval_N = 3 - 1;
            obj.hAxes_bwABird03 = axes('parent',obj.hFigure);
            set(obj.hAxes_bwABird03, 'units','pixels', 'position', [iniX_bwABird+interval_N*horizontal_Interval_bwABird iniY_bwABird width_bwABird height_bwABird]);
            obj.hImage_bwABird03 = imshow(obj.imgMat_bwRGB_ABird, 'parent',obj.hAxes_bwABird03);
            interval_N = 4 - 1;
            obj.hAxes_bwABird04 = axes('parent',obj.hFigure);
            set(obj.hAxes_bwABird04, 'units','pixels', 'position', [iniX_bwABird+interval_N*horizontal_Interval_bwABird iniY_bwABird width_bwABird height_bwABird]);
            obj.hImage_bwABird04 = imshow(obj.imgMat_bwRGB_ABird, 'parent',obj.hAxes_bwABird04);
            interval_N = 5 - 1;
            obj.hAxes_bwABird05 = axes('parent',obj.hFigure);
            set(obj.hAxes_bwABird05, 'units','pixels', 'position', [iniX_bwABird+interval_N*horizontal_Interval_bwABird iniY_bwABird width_bwABird height_bwABird]);
            obj.hImage_bwABird05 = imshow(obj.imgMat_bwRGB_ABird, 'parent',obj.hAxes_bwABird05);
            interval_N = 6 - 1;
            obj.hAxes_bwABird06 = axes('parent',obj.hFigure);
            set(obj.hAxes_bwABird06, 'units','pixels', 'position', [iniX_bwABird+interval_N*horizontal_Interval_bwABird iniY_bwABird width_bwABird height_bwABird]);
            obj.hImage_bwABird06 = imshow(obj.imgMat_bwRGB_ABird, 'parent',obj.hAxes_bwABird06);
            pngFileName = 'ScoreBox.png';
            pngPathName = sprintf('%s/%s', imgFolderName, pngFileName);
            [imgMat_ScoreBox , ~, alphaMat_ScoreBox] = imread(pngPathName);
            [ms, ns , ~] = size(imgMat_ScoreBox);
            obj.hAxes_ScoreBox = axes('parent',obj.hFigure);
            set(obj.hAxes_ScoreBox, 'units','pixels', 'position',[601 35 ns ms]);
            obj.hImage_ScoreBox = imshow(imgMat_ScoreBox,'parent',obj.hAxes_ScoreBox);
            set(obj.hImage_ScoreBox,'alphadata',alphaMat_ScoreBox);
            obj.mScore = 0;
            strScore = sprintf('%03d',obj.mScore);
            obj.hText_ScoreBox = uicontrol(obj.hFigure, 'Style','Text','String',strScore, 'fontsize',23, 'position',[621 72 ns-40 30], 'backgroundcolor',[120 120 120]/255, 'foregroundcolor',[220 220 220]/255);
            
            obj.hAxes_Sky = axes('parent',obj.hFigure);
            set(obj.hAxes_Sky, 'units','pixels', 'position',[1 151 800 450]);
            imgMat_Sky = ones(450,800,3);
            colorMap_R = linspace(120/255, 0.8, 450);
            colorMap_G = linspace(170/255, 0.9, 450);
            colorMap_B = linspace(240/255, 1, 450);
            for i = 1:450
                imgMat_Sky(i,:,1) = colorMap_R(i);
                imgMat_Sky(i,:,2) = colorMap_G(i);
                imgMat_Sky(i,:,3) = colorMap_B(i);
            end
            obj.hImage_Sky = imshow(imgMat_Sky,'parent',obj.hAxes_Sky);
            pngFileName_FlyAway = 'ABird_FlyAway_Instruction.png';
            pngPathName_FlyAway = sprintf('%s/%s', imgFolderName, pngFileName_FlyAway);
            [imgMat_FlyAway , ~, alphaMat_FlyAway] = imread(pngPathName_FlyAway);
            [rowNums, columnNums , ~] = size(imgMat_FlyAway);
            hAxes_FlyAway_W = columnNums;
            hAxes_FlyAway_H = rowNums;
            hAxes_FlyAway_X = (figWidth - hAxes_FlyAway_W)/2 + 1;
            hAxes_FlyAway_Y = (figHeight - hAxes_FlyAway_H)/2 + 1 + 100;
            obj.rect_hAxes_FlyAway_inCenter = [hAxes_FlyAway_X hAxes_FlyAway_Y hAxes_FlyAway_W hAxes_FlyAway_H];
            obj.rect_hAxes_FlyAway_out2Top = [hAxes_FlyAway_X hAxes_FlyAway_Y+600 hAxes_FlyAway_W hAxes_FlyAway_H];
            obj.hAxes_FlyAway = axes('parent',obj.hFigure);
            set(obj.hAxes_FlyAway, 'units','pixels', 'position',obj.rect_hAxes_FlyAway_inCenter);
            obj.hImage_FlyAway = imshow(imgMat_FlyAway,'parent',obj.hAxes_FlyAway);
            set(obj.hImage_FlyAway,'alphadata',alphaMat_FlyAway);
            rect_hAxes_FlyAway = get(obj.hAxes_FlyAway,'position');
            tempX = rect_hAxes_FlyAway(1);
            tempY = rect_hAxes_FlyAway(2);
            tempW = rect_hAxes_FlyAway(3);
            tempH = rect_hAxes_FlyAway(4);
            set(obj.hAxes_FlyAway, 'position',[tempX 601 tempW tempH]);
            
            imgMat_White = zeros(30,100,3);
            
            imgMat_Score = insertText(imgMat_White, [50 15], '5', 'boxcolor','black', 'fontsize',22, 'AnchorPoint','Center', 'Font','Arial');
            alphaMatrix_Score = imgMat_Score(:,:,1);
            alphaMatrix_Score(alphaMatrix_Score>240/255) = 1;
            alphaMatrix_Score(alphaMatrix_Score<=240/255) = 0;
            obj.hAxes_Text = axes('parent',obj.hFigure);
            set(obj.hAxes_Text, 'units','pixels', 'position',[401 601 100 30], 'color','k');
            
            axis([1 100 1 30]);
            text(50,15,'5', 'HorizontalAlign','Center', 'VerticalAlign','Middle', 'fontname','Arial', 'fontsize',20, 'color','w');
            axis off;
            tempImage = imshow(imgMat_Score, 'parent',obj.hAxes_Text);
            
            set(tempImage, 'alphadata',alphaMatrix_Score);
            obj.hAxes_ABird = axes('parent',obj.hFigure);
            set(obj.hAxes_ABird, 'units','pixels', 'position', obj.angrybirdObj.rect_ABird);
            obj.hImage_ABird = imshow(obj.angrybirdObj.Current_imgMatrix_ABird, 'parent',obj.hAxes_ABird);
            set(obj.hImage_ABird,'alphadata',obj.angrybirdObj.Current_alphaMatrix_ABird) ;
            
            obj.hAxes_Tree = axes('parent',obj.hFigure);
            set(obj.hAxes_Tree, 'units','pixels', 'position',[30 151 200 300]);
            pngFileName_Tree = 'tree.png';
            pngPathName_Tree = sprintf('%s/%s', imgFolderName, pngFileName_Tree);
            [imgMat_Tree , ~, alphaMat_Tree] = imread(pngPathName_Tree);
            imgMat_Tree_Scale = imresize(imgMat_Tree,[300 200]);
            alphaMat_Tree_Scale = imresize(alphaMat_Tree,[300 200]);
            obj.hImage_Tree = imshow(imgMat_Tree_Scale, 'parent', obj.hAxes_Tree);
            set(obj.hImage_Tree, 'alphadata',alphaMat_Tree_Scale);
            
            obj.hAxes_Grass = axes('parent',obj.hFigure);
            
            set(obj.hAxes_Grass, 'units','pixels', 'position',[1 151 800 150]);
            pngFileName_Grass = 'grass.png';
            pngPathName_Grass = sprintf('%s/%s', imgFolderName, pngFileName_Grass);
            [imgMat_Grass, ~, alphaMat_Grass] = imread(pngPathName_Grass);
            imgMat_Grass_Scale = imresize(imgMat_Grass, [150 800]);
            alphaMat_Grass_Scale = imresize(alphaMat_Grass, [150 800]);
            obj.hImage_Grass = imshow(imgMat_Grass_Scale,'parent',obj.hAxes_Grass);
            set(obj.hImage_Grass,'alphadata',alphaMat_Grass_Scale);
            
            obj.hAxes_instruction = axes('parent',obj.hFigure);
            set(obj.hAxes_instruction, 'units','pixels', 'position',[240 120 360 100]);
            jpgFileName_instruction = 'Instruction.png';
            jpgPathName_instruction = sprintf('%s/%s', imgFolderName, jpgFileName_instruction);
            [imgMat_instruction , ~, Alphadata_instruction] = imread(jpgPathName_instruction);
            imgMat_instruction_Scale = imresize(imgMat_instruction, [100 360]);
            alphaMat_instruction_Scale = imresize(Alphadata_instruction, [100 360]);
            obj.hImage_instruction = imshow(imgMat_instruction_Scale,'parent',obj.hAxes_instruction);
            set(obj.hImage_instruction,'alphadata',alphaMat_instruction_Scale,'visible','off');
            
            obj.hAxes_GSight = axes('parent',obj.hFigure);
            set(obj.hAxes_GSight, 'units','pixels', 'position',obj.gunsightObj.rect_GSight);
            obj.hImage_GSight = imshow(obj.gunsightObj.imgMatrix_GSight, 'parent',obj.hAxes_GSight);
            set(obj.hImage_GSight,'alphadata',obj.gunsightObj.alphaMatrix_GSight);
            
            
            obj.Update_rect_hAxes_ABird();
            obj.hAxes_word = axes('parent',obj.hFigure);
            set(obj.hAxes_word, 'units','pixels', 'position',[240 500 360 100]);
            jpgFileName_word = 'word1.png';
            jpgPathName_word = sprintf('%s/%s', imgFolderName, jpgFileName_word);
            [imgMat_word , ~, Alphadata_word] = imread(jpgPathName_word);
            imgMat_word_Scale = imresize(imgMat_word, [120 400]);
            alphaMat_word_Scale = imresize(Alphadata_word, [120 400]);
            obj.hImage_word = imshow(imgMat_word_Scale,'parent',obj.hAxes_word);
            set(obj.hImage_word, 'alphadata',alphaMat_word_Scale);
            
            obj.hAxes_word2 = axes('parent',obj.hFigure);
            set(obj.hAxes_word2, 'units','pixels', 'position',[240 420 360 100]);
            jpgFileName_word2 = 'word2.png';
            jpgPathName_word2 = sprintf('%s/%s', imgFolderName, jpgFileName_word2);
            [imgMat_word2 , ~, Alphadata_word2] = imread(jpgPathName_word2);
            imgMat_word2_Scale = imresize(imgMat_word2, [240 800]);
            alphaMat_word2_Scale = imresize(Alphadata_word2, [240 800]);
            obj.hImage_word2 = imshow(imgMat_word2_Scale,'parent',obj.hAxes_word2);
            set(obj.hImage_word2, 'alphadata',alphaMat_word2_Scale);
            
            obj.hAxes_word3 = axes('parent',obj.hFigure);
            set(obj.hAxes_word3, 'units','pixels', 'position',[240 360 360 100]);
            jpgFileName_word3 = 'word3.png';
            jpgPathName_word3 = sprintf('%s/%s', imgFolderName, jpgFileName_word3);
            [imgMat_word3 , ~, Alphadata_word3] = imread(jpgPathName_word3);
            imgMat_word3_Scale = imresize(imgMat_word3, [240 800]);
            alphaMat_word3_Scale = imresize(Alphadata_word3, [240 800]);
            obj.hImage_word3 = imshow(imgMat_word3_Scale,'parent',obj.hAxes_word3);
            set(obj.hImage_word3, 'alphadata',alphaMat_word3_Scale);
            
            obj.hAxes_click = axes('parent',obj.hFigure);
            set(obj.hAxes_click, 'units','pixels', 'position',[240 120 360 100]);
            jpgFileName_click = 'click.png';
            jpgPathName_click = sprintf('%s/%s', imgFolderName, jpgFileName_click);
            [imgMat_click , ~, Alphadata_click] = imread(jpgPathName_click);
            imgMat_click_Scale = imresize(imgMat_click, [100 360]);
            alphaMat_click_Scale = imresize(Alphadata_click, [100 360]);
            obj.hImage_click = imshow(imgMat_click_Scale,'parent',obj.hAxes_click);
            set(obj.hImage_click, 'alphadata',alphaMat_click_Scale);
            pause(5);
            set(obj.hAxes_word,'visible','off');
            set(obj.hImage_word,'visible','off');
            set(obj.hAxes_word2,'visible','off');
            set(obj.hImage_word2,'visible','off');
            set(obj.hAxes_word3,'visible','off');
            set(obj.hImage_word3,'visible','off');
            set(obj.hAxes_click,'visible','off');
            set(obj.hImage_click,'visible','off');
            pause(2);
            obj.hAxes_loading1 = axes('parent',obj.hFigure);
            set(obj.hAxes_loading1, 'units','pixels', 'position',[240 120 360 100]);
            jpgFileName_loading1 = 'loading1.png';
            jpgPathName_loading1 = sprintf('%s/%s', imgFolderName, jpgFileName_loading1);
            [imgMat_loading1 , ~, Alphadata_loading1] = imread(jpgPathName_loading1);
            imgMat_loading1_Scale = imresize(imgMat_loading1, [100 360]);
            alphaMat_loading1_Scale = imresize(Alphadata_loading1, [100 360]);
            obj.hImage_loading1 = imshow(imgMat_loading1_Scale,'parent',obj.hAxes_loading1);
            set(obj.hImage_loading1, 'alphadata',alphaMat_loading1_Scale);
            pause(1);
            obj.hAxes_loading2 = axes('parent',obj.hFigure);
            set(obj.hAxes_loading2, 'units','pixels', 'position',[240 120 360 100]);
            jpgFileName_loading2 = 'loading2.png';
            jpgPathName_loading2 = sprintf('%s/%s', imgFolderName, jpgFileName_loading2);
            [imgMat_loading2 , ~, Alphadata_loading2] = imread(jpgPathName_loading2);
            imgMat_loading2_Scale = imresize(imgMat_loading2, [100 360]);
            alphaMat_loading2_Scale = imresize(Alphadata_loading2, [100 360]);
            obj.hImage_loading2 = imshow(imgMat_loading2_Scale,'parent',obj.hAxes_loading2);
            set(obj.hImage_loading2, 'alphadata',alphaMat_loading2_Scale);
            pause(1);
            obj.hAxes_loading3 = axes('parent',obj.hFigure);
            set(obj.hAxes_loading3, 'units','pixels', 'position',[240 120 360 100]);
            jpgFileName_loading3 = 'loading3.png';
            jpgPathName_loading3 = sprintf('%s/%s', imgFolderName, jpgFileName_loading3);
            [imgMat_loading3 , ~, Alphadata_loading3] = imread(jpgPathName_loading3);
            imgMat_loading3_Scale = imresize(imgMat_loading3, [100 360]);
            alphaMat_loading3_Scale = imresize(Alphadata_loading3, [100 360]);
            obj.hImage_loading3 = imshow(imgMat_loading3_Scale,'parent',obj.hAxes_loading3);
            set(obj.hImage_loading3, 'alphadata',alphaMat_loading3_Scale);
            pause(1);
            set(obj.hAxes_loading1,'visible','off');
            set(obj.hImage_loading1,'visible','off');
            set(obj.hAxes_loading2,'visible','off');
            set(obj.hImage_loading2,'visible','off');
            set(obj.hAxes_loading3,'visible','off');
            set(obj.hImage_loading3,'visible','off');
            pause(1);
            set(obj.moveTimerObj, 'TimerFcn',@obj.MoveTmerCallback);
            set(obj.flyTimerObj, 'TimerFcn',@obj.FlyTmerCallback);
            set(obj.dropTimerObj, 'TimerFcn',@obj.DropTmerCallback);
            
            
            obj.angrybirdObj.addlistener('eBounce',@obj.Update_ABird_Listener2eBounce );
            obj.angrybirdObj.addlistener('eMoveEnough',@obj.FlyAway_ABird_Listener2eMoveEnough);
            obj.angrybirdObj.addlistener('eHurtByBullet',@obj.Drop_ABird_Listener2eHurtByBullet);
            
            obj.angrybirdObj.addlistener('eTrialDone',@obj.TrialOver_ABird_Listener2eTrialDone);
            
            obj.gunsightObj.addlistener('eResetGunSight',@obj.ReloadMagazine_Listener2eResetGunSight);
            obj.started=0;
            set(obj.hFigure,'WindowButtonDownFcn',@obj.hFgiure_WindowButtonDownFcn);
            set(obj.hFigure,'WindowButtonMotionFcn',@obj.hFigure_WindowButtonMotionFcn);
            set(obj.hFigure, 'DeleteFcn',@obj.hFigure_DeleteFcn);
            set(obj.hFigure,'WindowKeyPressFcn',@obj.hFigure_WindowKeyPressFcn);
            obj.gunsightObj.resetGunSight();
            obj.angrybirdObj.resetAngryBird();
            tmpRect_ABird = obj.angrybirdObj.rect_ABird;
            tmpW_ABird = tmpRect_ABird(3);
            tmpH_ABird = tmpRect_ABird(4);
            
            tmpX_ABird = obj.cjMatrixObj.cjMatrix(obj.cjMatrixObj.currentTrialIndex,obj.cjMatrixObj.iniX) ;
            tmpY_ABird = obj.cjMatrixObj.cjMatrix(obj.cjMatrixObj.currentTrialIndex,obj.cjMatrixObj.iniY);
            
            obj.angrybirdObj.rect_ABird = [tmpX_ABird tmpY_ABird tmpW_ABird tmpH_ABird];
            obj.Update_rect_hAxes_ABird();
            obj.angrybirdObj.Vx_ABird = obj.cjMatrixObj.cjMatrix(obj.cjMatrixObj.currentTrialIndex,obj.cjMatrixObj.v_X);
            obj.angrybirdObj.Vy_ABird = obj.cjMatrixObj.cjMatrix(obj.cjMatrixObj.currentTrialIndex,obj.cjMatrixObj.v_Y);
            obj.angrybirdObj.abirdChangePose();
            obj.Update_ABird();
            obj.started=0;
            start(obj.moveTimerObj);
        end
    end
    methods
        function obj = Update_rect_hAxes_ABird(obj)
            set(obj.hAxes_ABird, 'position',obj.angrybirdObj.rect_ABird);
        end
        function MoveTmerCallback(obj, ~, ~)
            obj.angrybirdObj.abirdMove();
            obj.Update_rect_hAxes_ABird();
        end
        
        function FlyTmerCallback(obj, ~, ~)
            obj.angrybirdObj.abirdFly();
            obj.Update_rect_hAxes_ABird();
        end
        function DropTmerCallback(obj, ~, ~)
            obj.angrybirdObj.abirdDrop();
            obj.Update_rect_hAxes_ABird();
        end
        function obj = Update_ABird(obj)
            
            obj.hImage_ABird = imshow(obj.angrybirdObj.Current_imgMatrix_ABird, 'parent',obj.hAxes_ABird);
            set(obj.hImage_ABird,'alphadata',obj.angrybirdObj.Current_alphaMatrix_ABird) ;
        end
    end
    
    
    methods
        function Update_ABird_Listener2eBounce(obj, ~, ~)
            
            
            obj.hImage_ABird = imshow(obj.angrybirdObj.Current_imgMatrix_ABird, 'parent',obj.hAxes_ABird);
            set(obj.hImage_ABird,'alphadata',obj.angrybirdObj.Current_alphaMatrix_ABird) ;
            
            
            obj.Update_rect_hAxes_ABird();
        end
        
        
        function FlyAway_ABird_Listener2eMoveEnough(obj, ~, ~)
            
            
            stop(obj.moveTimerObj);
            obj.gunsightObj.isEnable = 0;
            start(obj.flyTimerObj);
            set(obj.hAxes_FlyAway, 'position',obj.rect_hAxes_FlyAway_inCenter);
        end
        
        
        function Drop_ABird_Listener2eHurtByBullet(obj, ~, ~)
            
            obj.Update_ABird();
            
            
            stop(obj.moveTimerObj);
            obj.gunsightObj.isEnable = 0;
            start(obj.dropTimerObj);
        end
        function TrialOver_ABird_Listener2eTrialDone(obj, ~, ~)
            ts = timerfind;
            timerN = length(ts);
            if timerN >0
                stop(ts);
            end
            obj.dataMatrix(obj.cjMatrixObj.currentTrialIndex,:) = obj.dataVector;
            obj.fid = fopen(obj.txtPathName_Data, 'a+');
            tmpLine = [obj.cjMatrixObj.cjMatrix(obj.cjMatrixObj.currentTrialIndex,:) obj.dataVector];
            
            tmpStr = sprintf('%d %d %d %d %d %d %d %d %d %d %d %d', tmpLine);
            fprintf(obj.fid, '%s\n', tmpStr);
            fclose(obj.fid);
            
            
            set(obj.hAxes_FlyAway, 'position',obj.rect_hAxes_FlyAway_out2Top);
            
            set(obj.hAxes_Text, 'position',[801 601  100 30]);
        end
        
        function ReloadMagazine_Listener2eResetGunSight(obj, ~, ~)
            set(obj.hAxes_Bullet01, 'visible','on');
            set(obj.hAxes_Bullet02, 'visible','on');
            set(obj.hAxes_Bullet03, 'visible','on');
            obj.hImage_Bullet01 = imshow(obj.imgMat_Bullet,'parent',obj.hAxes_Bullet01);
            set(obj.hImage_Bullet01, 'alphadata',obj.alphaMat_Bullet);
            
            obj.hImage_Bullet02 = imshow(obj.imgMat_Bullet,'parent',obj.hAxes_Bullet02);
            set(obj.hImage_Bullet02, 'alphadata',obj.alphaMat_Bullet);
            
            
            obj.hImage_Bullet03 = imshow(obj.imgMat_Bullet,'parent',obj.hAxes_Bullet03);
            set(obj.hImage_Bullet03, 'alphadata',obj.alphaMat_Bullet);
        end
    end
    methods
        function hFigure_DeleteFcn(~, ~, ~)
            ts = timerfind;
            timerN = length(ts);
            if timerN >0
                stop(ts); delete(ts); clear ts;
                return;
            end
        end
        function hFgiure_WindowButtonDownFcn(obj, ~, ~)
            if obj.gunsightObj.isEnable == 0||obj.angrybirdObj.beFlyAway == 1||obj.angrybirdObj.beInjured == 1
                return;
                
            end
            pt = get(obj.hAxes_BKGround,'CurrentPoint');
            pt_x = round(pt(1) * 800);
            pt_y = round(pt(3) * 600);
            
            mRect_hAxes_ABird = get(obj.hAxes_ABird,'position');
            mState_pt_inhAxes_ABird_Field = pt_x > mRect_hAxes_ABird(1) & pt_x < mRect_hAxes_ABird(1) + 50 & pt_y > mRect_hAxes_ABird(2) & pt_y < mRect_hAxes_ABird(2) + 50;
            if mState_pt_inhAxes_ABird_Field
                
                obj.gunsightObj.shoot();
                if obj.gunsightObj.bulletNum == 2
                    set(obj.hAxes_Bullet03, 'visible','off');
                    set(obj.hImage_Bullet03, 'visible','off');
                    tmpDataVector = obj.dataVector;
                    tmpDataVector(1) = obj.angrybirdObj.moveCount;
                    tmpDataVector(2) = 1;
                    obj.dataVector = tmpDataVector;
                    
                else
                    if obj.gunsightObj.bulletNum == 1
                        set(obj.hAxes_Bullet02, 'visible','off');
                        set(obj.hImage_Bullet02, 'visible','off');
                        
                        tmpDataVector = obj.dataVector;
                        tmpDataVector(3) = obj.angrybirdObj.moveCount;
                        tmpDataVector(4) = 1;
                        obj.dataVector = tmpDataVector;
                    else
                        set(obj.hAxes_Bullet01, 'visible','off');
                        set(obj.hImage_Bullet01, 'visible','off');
                        tmpDataVector = obj.dataVector;
                        tmpDataVector(5) = obj.angrybirdObj.moveCount;
                        tmpDataVector(6) = 1;
                        obj.dataVector = tmpDataVector;
                    end
                end
                
                obj.angrybirdObj.abirdHurtByBullet();
                pause(4);
                set(obj.hImage_instruction,'visible','on');
                currentTrialID = obj.cjMatrixObj.currentTrialIndex;
                obj.mScore = obj.mScore + 5;
                strScore = sprintf('%03d',obj.mScore);
                
                set(obj.hText_ScoreBox, 'String',strScore);
                set(obj.hAxes_Text, 'position',[pt_x pt_y  100 30]);
                switch currentTrialID
                    case 1
                        obj.hImage_bwABird01 = imshow(obj.imgMat_bwRGB_ABird_Red, 'parent',obj.hAxes_bwABird01);
                    case 2
                        obj.hImage_bwABird02 = imshow(obj.imgMat_bwRGB_ABird_Red, 'parent',obj.hAxes_bwABird02);
                    case 3
                        obj.hImage_bwABird03 = imshow(obj.imgMat_bwRGB_ABird_Red, 'parent',obj.hAxes_bwABird03);
                    case 4
                        obj.hImage_bwABird04 = imshow(obj.imgMat_bwRGB_ABird_Red, 'parent',obj.hAxes_bwABird04);
                    case 5
                        obj.hImage_bwABird05 = imshow(obj.imgMat_bwRGB_ABird_Red, 'parent',obj.hAxes_bwABird05);
                        
                    case 6
                        obj.hImage_bwABird06 = imshow(obj.imgMat_bwRGB_ABird_Red, 'parent',obj.hAxes_bwABird06);
                    otherwise
                        msgbox('Error in WindowButtonDownFcn');
                end
            else
                obj.gunsightObj.shoot();
                if obj.gunsightObj.bulletNum == 2
                    set(obj.hAxes_Bullet03, 'visible','off');
                    set(obj.hImage_Bullet03, 'visible','off');
                    tmpDataVector = obj.dataVector;
                    tmpDataVector(1) = obj.angrybirdObj.moveCount;
                    tmpDataVector(2) = 0;
                    obj.dataVector = tmpDataVector;
                else
                    if obj.gunsightObj.bulletNum == 1
                        set(obj.hAxes_Bullet02, 'visible','off');
                        set(obj.hImage_Bullet02, 'visible','off');
                        tmpDataVector = obj.dataVector;
                        tmpDataVector(3) = obj.angrybirdObj.moveCount;
                        tmpDataVector(4) = 0;
                        obj.dataVector = tmpDataVector;
                    else
                        set(obj.hAxes_Bullet01, 'visible','off');
                        set(obj.hImage_Bullet01, 'visible','off');
                        
                        
                        tmpDataVector = obj.dataVector;
                        tmpDataVector(5) = obj.angrybirdObj.moveCount;
                        tmpDataVector(6) = 0;
                        obj.dataVector = tmpDataVector;
                        obj.angrybirdObj.abird_TerminateMove();
                        currentTrialID = obj.cjMatrixObj.currentTrialIndex;
                        switch currentTrialID
                            
                            case 1
                                obj.hImage_bwABird01 = imshow(obj.imgMat_bwRGB_ABird_Gray, 'parent',obj.hAxes_bwABird01);
                            case 2
                                obj.hImage_bwABird02 = imshow(obj.imgMat_bwRGB_ABird_Gray, 'parent',obj.hAxes_bwABird02);
                            case 3
                                obj.hImage_bwABird03 =imshow(obj.imgMat_bwRGB_ABird_Gray, 'parent',obj.hAxes_bwABird03);
                                
                            case 4
                                obj.hImage_bwABird04 = imshow(obj.imgMat_bwRGB_ABird_Gray, 'parent',obj.hAxes_bwABird04);
                            case 5
                                obj.hImage_bwABird05 = imshow(obj.imgMat_bwRGB_ABird_Gray, 'parent',obj.hAxes_bwABird05);
                            case 6
                                obj.hImage_bwABird06 = imshow(obj.imgMat_bwRGB_ABird_Gray, 'parent',obj.hAxes_bwABird06);
                                
                            otherwise
                                msgbox('Error in WindowButtonDownFcn');
                        end
                        
                    end
                end
            end
        end
        
        function hFigure_WindowButtonMotionFcn(obj, ~, ~)
            pt = get(obj.hAxes_BKGround,'CurrentPoint');
            pt_x = round(pt(1) * 800);
            pt_y = round(pt(3) * 600);
            mRect_hAxes_GSight = get(obj.hAxes_GSight,'position');
            gsX = pt_x - 25;
            gsY = pt_y - 25;
            gsW = mRect_hAxes_GSight(3);
            gsH = mRect_hAxes_GSight(4);
            mRect_hAxes_GSight = [gsX gsY gsW gsH];
            set(obj.hAxes_GSight,'position',mRect_hAxes_GSight);
        end
        function hFigure_WindowKeyPressFcn(obj, ~, eventdata)
            if obj.angrybirdObj.beFlyAway==1||obj.angrybirdObj.beInjured == 1||obj.angrybirdObj.beMoveIng == 1
                
                return;
            end
            
            if eventdata.Key == 'space'
                set(obj.hAxes_instruction,'visible','off');
                set(obj.hImage_instruction,'visible','off');
                if obj.cjMatrixObj.currentTrialIndex < obj.cjMatrixObj.trialNum
                    
                    obj.dataVector = zeros(1,6);
                    obj.cjMatrixObj.move2nextTrial();
                    obj.gunsightObj.resetGunSight();
                    obj.angrybirdObj.resetAngryBird();
                    tmpRect_ABird = obj.angrybirdObj.rect_ABird;
                    tmpW_ABird = tmpRect_ABird(3);
                    tmpH_ABird = tmpRect_ABird(4);
                    tmpX_ABird = obj.cjMatrixObj.cjMatrix(obj.cjMatrixObj.currentTrialIndex,obj.cjMatrixObj.iniX) ;
                    tmpY_ABird = obj.cjMatrixObj.cjMatrix(obj.cjMatrixObj.currentTrialIndex,obj.cjMatrixObj.iniY);
                    
                    obj.angrybirdObj.rect_ABird = [tmpX_ABird tmpY_ABird tmpW_ABird tmpH_ABird];
                    
                    obj.Update_rect_hAxes_ABird();
                    obj.angrybirdObj.Vx_ABird = obj.cjMatrixObj.cjMatrix(obj.cjMatrixObj.currentTrialIndex,obj.cjMatrixObj.v_X);
                    obj.angrybirdObj.Vy_ABird = obj.cjMatrixObj.cjMatrix(obj.cjMatrixObj.currentTrialIndex,obj.cjMatrixObj.v_Y);
                    obj.angrybirdObj.abirdChangePose();
                    obj.Update_ABird();
                    
                    ts = timerfind;
                    timerN = length(ts);
                    if timerN >0
                        stop(ts);
                    end
                    start(obj.moveTimerObj);
                else
                    obj.hAxes_GameOver = axes('parent',obj.hFigure);
                    set(obj.hAxes_GameOver, 'units','pixels', 'position',[240 120 360 100]);
                    imgFolderName='imgFolder';
                    jpgFileName_GameOver = 'GameOver.png';
                    jpgPathName_GameOver = sprintf('%s/%s', imgFolderName, jpgFileName_GameOver);
                    [imgMat_GameOver , ~, Alphadata_GameOver] = imread(jpgPathName_GameOver);
                    imgMat_GameOver_Scale = imresize(imgMat_GameOver, [100 360]);
                    alphaMat_GameOver_Scale = imresize(Alphadata_GameOver, [100 360]);
                    obj.hImage_GameOver = imshow(imgMat_GameOver_Scale,'parent',obj.hAxes_GameOver);
                    set(obj.hImage_GameOver,'alphadata',alphaMat_GameOver_Scale,'visible','on');
                    pause(5.0);
                    close(gcf);
                end
            end
        end
    end
end