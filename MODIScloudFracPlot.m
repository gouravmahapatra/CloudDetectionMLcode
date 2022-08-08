% Script to read modis cloud fraction data and form the image 

ZmodisDustStorm1 = zeros(3240,6480);

% LandWaterFlag = double(h5read('DustStormPass.h5','/GeolocationFields/LandWaterFlag'));
% PLN_PARA = double(h5read('DustStormPass.h5','/GeolocationFields/PixelLineNumber'));
% PCN_PARA = double(h5read('DustStormPass.h5','/GeolocationFields/PixelColumnNumber'));
% 
% PLN1 = double(h5read('DustStormPass_MODIS.h5','/PixelLineNumber'));
% PCN1 = double(h5read('DustStormPass_MODIS.h5','/PixelColumnNumber'));
%CF1 = double(h5read('DustStormPass_MODIS.h5','/CloudFraction'));


for i = 1:length(PLN1modis)
    ZmodisDustStorm1(PLN1modis(i),PCN1modis(i)) = CF1(i);
end


% PLN2 = double(h5read('P3L1TBG1064206_MODIS-V2.h5','/PixelLineNumber'));
% PCN2 = double(h5read('P3L1TBG1064206_MODIS-V2.h5','/PixelColumnNumber'));
% CF2 = double(h5read('P3L1TBG1064206_MODIS-V2.h5','/CloudFraction'));
% for i = 1:length(PLN2)
%     Zmodis(PLN2(i),PCN2(i)) = CF2(i);
% end
% 
% 
% PLN3 = double(h5read('P3L1TBG1064207_MODIS-V2.h5','/PixelLineNumber'));
% PCN3 = double(h5read('P3L1TBG1064207_MODIS-V2.h5','/PixelColumnNumber'));
% CF3 = double(h5read('P3L1TBG1064207_MODIS-V2.h5','/CloudFraction'));
% for i = 1:length(PLN3)
%     Zmodis(PLN3(i),PCN3(i)) = CF3(i);
% end
% 
% 
% PLN4 = double(h5read('P3L1TBG1064208_MODIS-V2.h5','/PixelLineNumber'));
% PCN4 = double(h5read('P3L1TBG1064208_MODIS-V2.h5','/PixelColumnNumber'));
% CF4 = double(h5read('P3L1TBG1064208_MODIS-V2.h5','/CloudFraction'));
% for i = 1:length(PLN4)
%     Zmodis(PLN4(i),PCN4(i)) = CF4(i);
% end
% 
% 
% PLN5 = double(h5read('P3L1TBG1064209_MODIS-V2.h5','/PixelLineNumber'));
% PCN5 = double(h5read('P3L1TBG1064209_MODIS-V2.h5','/PixelColumnNumber'));
% CF5 = double(h5read('P3L1TBG1064209_MODIS-V2.h5','/CloudFraction'));
% for i = 1:length(PLN5)
%     Zmodis(PLN5(i),PCN5(i)) = CF5(i);
% end
% 
% 
% PLN = double(h5read('P3L1TBG1064210_MODIS-V2.h5','/PixelLineNumber'));
% PCN = double(h5read('P3L1TBG1064210_MODIS-V2.h5','/PixelColumnNumber'));
% CF6 = double(h5read('P3L1TBG1064210_MODIS-V2.h5','/CloudFraction'));
% for i = 1:length(PLN)
%     Zmodis(PLN(i),PCN(i)) = CF6(i);
% end
% 
% 
% 
% 
% PLN7 = double(h5read('P3L1TBG1064211_MODIS-V2.h5','/PixelLineNumber'));
% PCN7 = double(h5read('P3L1TBG1064211_MODIS-V2.h5','/PixelColumnNumber'));
% CF7 = double(h5read('P3L1TBG1064211_MODIS-V2.h5','/CloudFraction'));
% for i = 1:length(PLN7)
%     Zmodis(PLN7(i),PCN7(i)) = CF7(i);
% end
% 
% 
% PLN8 = double(h5read('P3L1TBG1064212_MODIS-V2.h5','/PixelLineNumber'));
% PCN8 = double(h5read('P3L1TBG1064212_MODIS-V2.h5','/PixelColumnNumber'));
% CF8 = double(h5read('P3L1TBG1064212_MODIS-V2.h5','/CloudFraction'));
% for i = 1:length(PLN8)
%     Zmodis(PLN8(i),PCN8(i)) = CF8(i);
% end
% 
% 
% PLN9 = double(h5read('P3L1TBG1064213_MODIS-V2.h5','/PixelLineNumber'));
% PCN9 = double(h5read('P3L1TBG1064213_MODIS-V2.h5','/PixelColumnNumber'));
% CF9 = double(h5read('P3L1TBG1064213_MODIS-V2.h5','/CloudFraction'));
% for i = 1:length(PLN9)
%     Zmodis(PLN9(i),PCN9(i)) = CF9(i);
% end
% 
% 
% PLN10 = double(h5read('P3L1TBG1064214_MODIS-V2.h5','/PixelLineNumber'));
% PCN10 = double(h5read('P3L1TBG1064214_MODIS-V2.h5','/PixelColumnNumber'));
% CF10 = double(h5read('P3L1TBG1064214_MODIS-V2.h5','/CloudFraction'));
% for i = 1:length(PLN10)
%     Zmodis(PLN10(i),PCN10(i)) = CF10(i);
% end
% 
% 
% PLN11 = double(h5read('P3L1TBG1064215_MODIS-V2.h5','/PixelLineNumber'));
% PCN11 = double(h5read('P3L1TBG1064215_MODIS-V2.h5','/PixelColumnNumber'));
% CF11 = double(h5read('P3L1TBG1064215_MODIS-V2.h5','/CloudFraction'));
% for i = 1:length(PLN11)
%     Zmodis(PLN11(i),PCN11(i)) = CF11(i);
% end
% 
% 
% PLN12 = double(h5read('P3L1TBG1064216_MODIS-V2.h5','/PixelLineNumber'));
% PCN12 = double(h5read('P3L1TBG1064216_MODIS-V2.h5','/PixelColumnNumber'));
% CF12 = double(h5read('P3L1TBG1064216_MODIS-V2.h5','/CloudFraction'));
% for i = 1:length(PLN12)
%     Zmodis(PLN12(i),PCN12(i)) = CF12(i);
% end
% 
% 
% PLN13 = double(h5read('P3L1TBG1064217_MODIS-V2.h5','/PixelLineNumber'));
% PCN13 = double(h5read('P3L1TBG1064217_MODIS-V2.h5','/PixelColumnNumber'));
% CF13 = double(h5read('P3L1TBG1064217_MODIS-V2.h5','/CloudFraction'));
% for i = 1:length(PLN13)
%     Zmodis(PLN13(i),PCN13(i)) = CF13(i);
% end
% 
% 
% PLN14 = double(h5read('P3L1TBG1064218_MODIS-V2.h5','/PixelLineNumber'));
% PCN14 = double(h5read('P3L1TBG1064218_MODIS-V2.h5','/PixelColumnNumber'));
% CF14 = double(h5read('P3L1TBG1064218_MODIS-V2.h5','/CloudFraction'));
% for i = 1:length(PLN14)
%     Zmodis(PLN14(i),PCN14(i)) = CF14(i);
% end
% 
% 
% CloudFraction_MODIS = [CF1', CF2', CF3', CF4', CF5', CF6', CF7', CF8', CF9', CF10', CF11', CF12', CF13', CF14'];