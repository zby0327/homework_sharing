classdef GunSight < handle
    properties
        imgMatrix_GSight
        alphaMatrix_GSight
        rect_GSight;
        isEnable;
        % countShootNum
        shootCount
        bulletNum
    end
    events
        eResetGunSight
    end
    methods
        function obj = GunSight()
            imgFolderName = 'imgFolder';
            pngFileName_GunSight = 'gunsight50x50.png';
            pngPathName_GunSight = sprintf('%s/%s', imgFolderName, pngFileName_GunSight);
            [imgMatrix_GSight colorMap_GSight, alphaMatrix_GSight] = imread(pngPathName_GunSight);
            obj.imgMatrix_GSight = imgMatrix_GSight;
            obj.alphaMatrix_GSight = alphaMatrix_GSight;
            [m n d3] = size(imgMatrix_GSight);
            x_GSight = -50;
            y_GSight = 200;
            width_GSight = n;
            height_GSight = m;
            obj.rect_GSight = [x_GSight y_GSight width_GSight height_GSight];
            
            
            obj.isEnable = 1;
            
            obj.shootCount = 0;
            obj.bulletNum = 3;
        end
        function obj = resetGunSight(obj)
            
            obj.isEnable = 1;
            obj.shootCount = 0;
            obj.bulletNum = 3;
            
            obj.notify('eResetGunSight');
        end
    end
    methods
        function shoot(obj)
            if obj.isEnable
                obj.shootCount = obj.shootCount + 1;
                obj.bulletNum = obj.bulletNum - 1;
            end
            if obj.bulletNum <=0
                obj.isEnable = 0;
            end
        end
    end
end