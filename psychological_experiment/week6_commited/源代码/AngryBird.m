classdef AngryBird < handle
    properties
        Vx_ABird
        Vy_ABird
        rect_ABird
        Current_imgMatrix_ABird
        Current_alphaMatrix_ABird
        imgMatrix_ABird_Forward
        alphaMatrix_ABird_Forward
        imgMatrix_ABird_Reversed
        alphaMatrix_ABird_Reversed
        imgMatrix_ABird_Hurt
        alphaMatrix_ABird_Hurt
        beMoveIng
        moveCount
        moveNum_UpperLimit
        beFlyAway
        flyCount
        flyNum_UpperLimit
        beInjured
        dropCount
        dropNum_UpperLimit
        timePeriod
        width_hFig
        height_hFig
        groundLimit
        mAcceleration
        dropHeight0
    end
    events
        eBounce
        eMoveEnough
        eHurtByBullet
        eTrialDone
    end
    methods
        function obj = AngryBird()
            obj.timePeriod = 0.01;
            obj.width_hFig = 800;
            obj.height_hFig = 600;
            obj.groundLimit = 150;
            obj.mAcceleration = 150;
            obj.dropHeight0 = 300;
            V_ABird = 100;
            mTheta = pi/6 + 2*pi/3 * rand;
            obj.Vx_ABird = V_ABird * cos(mTheta);
            obj.Vy_ABird = V_ABird * sin(mTheta);
            imgFolderName = 'imgFolder';
            pngFileName_ABird = 'angrybird_50x50.png';
            pngPathName_ABird = sprintf('%s/%s', imgFolderName, pngFileName_ABird);
            [imgMat colorMap alphaMat] = imread(pngPathName_ABird);
            obj.imgMatrix_ABird_Forward = imgMat;
            obj.alphaMatrix_ABird_Forward = alphaMat;
            obj.imgMatrix_ABird_Reversed = fliplr(imgMat);
            obj.alphaMatrix_ABird_Reversed = fliplr(alphaMat);
            
            obj.abirdChangePose();
            pngFileName_ABird_Hurt = 'angrybird50x50_Hurt.png';
            pngPathName_ABird_Hurt = sprintf('%s/%s', imgFolderName, pngFileName_ABird_Hurt);
            [imgMat_Hurt colorMap_Hurt alphaMat_Hurt] = imread(pngPathName_ABird_Hurt);
            obj.imgMatrix_ABird_Hurt = imgMat_Hurt;
            obj.alphaMatrix_ABird_Hurt = alphaMat_Hurt;
            [m n d3] = size(imgMat);
            x_ABird = 100 + randperm(600,1);
            y_ABird = 151;
            width_ABird = n;
            height_ABird = m;
            obj.rect_ABird = [x_ABird y_ABird width_ABird height_ABird];
            obj.moveCount = 0;
            obj.moveNum_UpperLimit = 1000;
            obj.flyCount = 0;
            obj.flyNum_UpperLimit = 200;
            obj.dropCount = 0;
            obj.dropNum_UpperLimit = 200;
            
            obj.beMoveIng = 1;
            obj.beFlyAway = 0;
            obj.beInjured = 0;
        end
        
        
        function obj = resetAngryBird(obj)
            
            obj.timePeriod = 0.01;
            obj.width_hFig = 800;
            obj.height_hFig = 600;
            obj.groundLimit = 150;
            obj.mAcceleration = 150;
            V_ABird = 100;
            mTheta = pi/6 + 2*pi/3 * rand;
            obj.Vx_ABird = V_ABird * cos(mTheta);
            obj.Vy_ABird = V_ABird * sin(mTheta);
            
            obj.abirdChangePose();
            
            x_ABird = 100 + randperm(600,1);
            y_ABird = 151;
            width_ABird = obj.rect_ABird(3);
            height_ABird = obj.rect_ABird(4);
            obj.rect_ABird = [x_ABird y_ABird width_ABird height_ABird];
            
            
            obj.moveCount = 0;
            obj.moveNum_UpperLimit = 1000;
            obj.flyCount = 0;
            obj.flyNum_UpperLimit = 200;
            obj.dropCount = 0;
            obj.dropNum_UpperLimit = 200;
            
            obj.beMoveIng = 1;
            obj.beFlyAway = 0;
            obj.beInjured = 0;
        end
        function obj = abirdMove(obj)
            xMoveDist = obj.Vx_ABird * obj.timePeriod;
            
            yMoveDist = obj.Vy_ABird * obj.timePeriod;
            x_ABird = obj.rect_ABird(1);
            y_ABird = obj.rect_ABird(2);
            width_ABird = obj.rect_ABird(3);
            height_ABird = obj.rect_ABird(4);
            x_ABird = xMoveDist + x_ABird;
            y_ABird = yMoveDist + y_ABird;
            
            if x_ABird < 0 | x_ABird + width_ABird > obj.width_hFig
                obj.abirdBounce_X();
                return;
            end
            if y_ABird < 150 | y_ABird + height_ABird >obj.height_hFig
                
                
                obj.abirdBounce_Y();
                
                return;
            end
            obj.rect_ABird = [x_ABird y_ABird width_ABird height_ABird];
            obj.moveCount = obj.moveCount + 1;
            if obj.moveCount >= obj.moveNum_UpperLimit
                obj.abird_TerminateMove();
            end
        end
        
        function obj = abirdBounce_X(obj)
            obj.Vx_ABird = -obj.Vx_ABird;
            obj.abirdChangePose();
            obj.notify('eBounce');
        end
        function obj = abirdBounce_Y(obj)
            obj.Vy_ABird = -obj.Vy_ABird;
        end
        
        
        function obj = abirdChangePose(obj)
            if obj.Vx_ABird > 0
                obj.Current_imgMatrix_ABird = obj.imgMatrix_ABird_Forward;
                obj.Current_alphaMatrix_ABird = obj.alphaMatrix_ABird_Forward;
            else
                obj.Current_imgMatrix_ABird = obj.imgMatrix_ABird_Reversed;
                obj.Current_alphaMatrix_ABird = obj.alphaMatrix_ABird_Reversed;
            end
        end
        function obj = abirdHurtByBullet(obj)
            obj.Current_imgMatrix_ABird = obj.imgMatrix_ABird_Hurt;
            obj.Current_alphaMatrix_ABird = obj.alphaMatrix_ABird_Hurt;
            obj.v_ABird_0_forDrop();
            
            obj.beInjured = 1;
            
            obj.calculate_abirdAcceleration_dropHeight0();
            obj.notify('eHurtByBullet');
        end
        
        function obj = abirdFly(obj)
            xMoveDist = obj.Vx_ABird * obj.timePeriod;
            yMoveDist = obj.Vy_ABird * obj.timePeriod;
            x_ABird = obj.rect_ABird(1);
            y_ABird = obj.rect_ABird(2);
            width_ABird = obj.rect_ABird(3);
            height_ABird = obj.rect_ABird(4);
            x_ABird = xMoveDist + x_ABird;
            y_ABird = yMoveDist + y_ABird;
            
            obj.rect_ABird = [x_ABird y_ABird width_ABird height_ABird];
            
            obj.flyCount = obj.flyCount + 1;
            
            if obj.flyCount >= obj.flyNum_UpperLimit
                
                obj.v_ABird_0_forFlyAwayDone();
                obj.beMoveIng = 0;
                obj.beFlyAway = 0;
                obj.beInjured = 0;
                obj.notify('eTrialDone');
            end
        end
        function obj = calculate_abirdAcceleration_dropHeight0(obj)
            y_ABird = obj.rect_ABird(2);
            obj.dropHeight0 = y_ABird - obj.groundLimit;
            obj.mAcceleration = obj.dropHeight0/2;
        end
        
        function obj = abirdDrop(obj)
            obj.dropCount = obj.dropCount + 1;
            tmpTime = obj.dropCount * obj.timePeriod;
            dropDist = 1/2 * obj.mAcceleration * tmpTime^2;
            y_ABird = obj.dropHeight0 - dropDist + obj.groundLimit;
            x_ABird = obj.rect_ABird(1);
            w_ABird = obj.rect_ABird(3);
            h_ABird = obj.rect_ABird(4);
            obj.rect_ABird = [x_ABird  y_ABird w_ABird h_ABird];
            if obj.dropCount >= obj.dropNum_UpperLimit
                obj.v_ABird_0_Drop2Ground();
                obj.beMoveIng = 0;
                obj.beFlyAway = 0;
                obj.beInjured = 0;
                obj.notify('eTrialDone');
            end
        end
        function v_ABird_Up_forFlyAway(obj)
            obj.Vx_ABird = 0;
            obj.Vy_ABird = 600;
        end
        function v_ABird_0_forFlyAwayDone(obj)
            obj.Vx_ABird = 0;
            obj.Vy_ABird = 0;
        end
        
        function v_ABird_0_forDrop(obj)
            obj.Vx_ABird = 0;
            obj.Vy_ABird = 0;
        end
        function v_ABird_0_Drop2Ground(obj)
            obj.Vx_ABird = 0;
            obj.Vy_ABird = 0;
        end
        function abird_TerminateMove(obj)
            obj.v_ABird_Up_forFlyAway();
            obj.beFlyAway = 1;
            obj.notify('eMoveEnough');
        end
    end
    
end