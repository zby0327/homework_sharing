function mat = generate_cjMatrix()

repeatNum = 1;
itemNum = 24;
trialNum = itemNum * repeatNum;

Column_TrialID = 1;
Column_Digit = 2;
Column_Type = 3;
Column_TimeInterval = 4;
Column_CorrectResponse = 5;
mat=zeros(240,5);
for times=1:10
    while 1
        
        digitArr = 1:24; digitArr = digitArr';
        typeArr = [1; 2; 1; 2; 1; 2; 1; 2; 1; 2; 1; 2; 1; 2; 1; 2; 1; 2; 1; 2; 1; 2; 1; 2];
        
        trialID_Array = 1:trialNum; trialID_Array = trialID_Array';
        digit_Array = kron(ones(1,1), digitArr);
        type_Array = kron(ones(1,1), typeArr);
        while 1
            timeIntervalArray = 500 + round( 100 * (rand(24,1)-0.5) );
            mean_TimeInterval = mean(timeIntervalArray);
            if mean_TimeInterval > 490 && mean_TimeInterval < 510
                break;
            end
        end
        correctResponse_Array = type_Array;
        
        rand_Array = randperm(trialNum);
        rand_Array = rand_Array';
        tmpMat_r = [digit_Array type_Array timeIntervalArray correctResponse_Array rand_Array];
        tmpMat_r = sortrows(tmpMat_r, 5);
        tmpMatrix = tmpMat_r(:,1:end-1);
        cjMatrix = [trialID_Array tmpMatrix];
        
        repeatCount = 1;
        repeatCountMax = 1;
        
        for i = 2:length(cjMatrix)
            currentDigit = cjMatrix(i, Column_Digit);
            theLastDigit = cjMatrix(i-1, Column_Digit);
            if currentDigit == theLastDigit
                repeatCount = repeatCount + 1;
                if repeatCount > repeatCountMax
                    repeatCountMax = repeatCount;
                end
            else
                repeatCount = 1;
            end
        end
        
        repeatResponse = 1;
        repeatResponseMax = 1;
        for j = 2:length(cjMatrix)
            currentResponse = cjMatrix(j, Column_CorrectResponse);
            theLastResponse = cjMatrix(j-1, Column_CorrectResponse);
            if currentResponse == theLastResponse
                repeatResponse = repeatResponse + 1;
                if repeatResponse > repeatResponseMax
                    repeatResponseMax = repeatResponse;
                end
            else
                repeatResponse = 1;
            end
            
        end
        break;
        if repeatCountMax < 3 && repeatResponseMax < 4
            break;
        end
    end
    mat((times-1)*24+1:(times-1)*24+24,:)=cjMatrix;
    mat(:,1)=1:240;
    
end

end