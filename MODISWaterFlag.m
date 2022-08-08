%% Code to find the water pixels in MODIS data

LandWaterFlag = double(h5read('DustStormPass.h5','/GeolocationFields/LandWaterFlag'));
PLN_PARA = double(h5read('DustStormPass.h5','/GeolocationFields/PixelLineNumber'));
PCN_PARA = double(h5read('DustStormPass.h5','/GeolocationFields/PixelColumnNumber'));

PLN1 = double(h5read('DustStormPass_MODIS.h5','/PixelLineNumber'));
PCN1 = double(h5read('DustStormPass_MODIS.h5','/PixelColumnNumber'));
CF1 = double(h5read('DustStormPass_MODIS.h5','/CloudFraction'));

PLNwaterPARA = PLN_PARA(LandWaterFlag == 0);
PCNwaterPARA = PCN_PARA(LandWaterFlag == 0);

j = 1;

for i = 1:length(PLNwaterPARA)
    
    find(PLN1 == PLNwaterPARA(i) & PCN1 == PCNwaterPARA(i));
    
    if ans ~= 0 
        WaterInd(j) = ans;
        j = j + 1;
    else
    end
   
end
