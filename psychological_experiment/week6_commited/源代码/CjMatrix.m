classdef CjMatrix < handle
    properties
        cjMatrix
        currentTrialIndex
        trialNum
        trialID
        iniX
        iniY
        v_X
        v_Y
        moveNum_UpperLimit
    end
    methods
        function obj = CjMatrix()
            obj.trialID = 1;
            obj.iniX = 2;
            obj.iniY = 3;
            obj.v_X = 4;
            obj.v_Y = 5;
            obj.moveNum_UpperLimit = 6;
            obj.currentTrialIndex = 1;
            obj.trialNum = 6;
            obj.cjMatrix = obj.generate_cjMatrix();
        end
        function cjMatrix = generate_cjMatrix(obj)
            trialNum = obj.trialNum;
            
            trialVector = 1:obj.trialNum;  trialVector = trialVector';
            
            xVector = 100 + round(600 * rand(trialNum,1));
            yVector = 151 * ones(trialNum,1);
            
            Vx_Vector = zeros(trialNum,1);
            Vy_Vector = zeros(trialNum,1);
            vVector = 100;
            thetaVector = pi/6 + 2*pi/3 * rand(trialNum,1);
            for i = 1:trialNum
                tmpTheta = thetaVector(i);
                Vx_Vector(i) = round(vVector * cos(tmpTheta));
                Vy_Vector(i) = round(vVector * sin(tmpTheta));
            end
            moveNum_UpperLimitVector = ones(trialNum,1) * 1000;
            
            cjMatrix = [trialVector xVector yVector Vx_Vector Vy_Vector moveNum_UpperLimitVector];
        end
        function move2nextTrial(obj)
            obj.currentTrialIndex = obj.currentTrialIndex + 1;
        end
    end
end