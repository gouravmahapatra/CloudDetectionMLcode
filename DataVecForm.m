function [InputActual, PLN, PCN, I1020, I490, I670, I865, DOLP, SAdeg] = DataVecForm(FileName)

PLN = double(h5read(FileName,'/GeolocationFields/PixelLineNumber'));
PCN = double(h5read(FileName,'/GeolocationFields/PixelColumnNumber'));

% Lat1 = double(h5read(FileName,'/GeolocationFields/Latitude'));
% Long1 = double(h5read(FileName,'/GeolocationFields/Longitude'));

numViewingDirections = double(h5read(FileName,'/MeasurementFields/NumViewingDirections'));

LandWaterFlag = double(h5read(FileName,'/GeolocationFields/LandWaterFlag'));

% I vector
stokesI865 = double(h5read(FileName,'/MeasurementFields/StokesI865'));
stokesI670 = double(h5read(FileName,'/MeasurementFields/StokesI670'));
stokesI490 = double(h5read(FileName,'/MeasurementFields/StokesI490'));
stokesI1020 = double(h5read(FileName,'/MeasurementFields/StokesI1020'));

% Q vector
stokesQ865 = double(h5read(FileName,'/MeasurementFields/StokesQ865'));
stokesQ670 = double(h5read(FileName,'/MeasurementFields/StokesQ670'));
stokesQ490 = double(h5read(FileName,'/MeasurementFields/StokesQ490'));

% U vector
stokesU865 = double(h5read(FileName,'/MeasurementFields/StokesU865'));
stokesU670 = double(h5read(FileName,'/MeasurementFields/StokesU670'));
stokesU490 = double(h5read(FileName,'/MeasurementFields/StokesU490'));

% Reading all the angles from the hdf file
ViewingZenithAngle = double(h5read(FileName,'/GeolocationFields/ViewZenithAngle'));
SolarZenithAngle = double(h5read(FileName,'/GeolocationFields/SolarZenithAngle'));
RelativeAzimuthAngle = double(h5read(FileName,'/GeolocationFields/RelativeAzimuthAngle'));

CF1 = double(h5read('P3L1TBG1064205_MODIS.h5','/CloudFraction'));

%%

% Filter the data to get only viewing directions > 13
I865 = stokesI865(1:14,numViewingDirections > 13 & LandWaterFlag == 0)'/pi;
Q865 = stokesQ865(1:14,numViewingDirections > 13 & LandWaterFlag == 0)'/pi;
U865 = stokesU865(1:14,numViewingDirections > 13 & LandWaterFlag == 0)'/pi;

I670 = stokesI670(1:14,numViewingDirections > 13 & LandWaterFlag == 0)'/pi;
Q670 = stokesQ670(1:14,numViewingDirections > 13 & LandWaterFlag == 0)'/pi;
U670 = stokesU670(1:14,numViewingDirections > 13 & LandWaterFlag == 0)'/pi;

I490 = stokesI490(1:14,numViewingDirections > 13 & LandWaterFlag == 0)'/pi;
Q490 = stokesQ490(1:14,numViewingDirections > 13 & LandWaterFlag == 0)'/pi;
U490 = stokesU490(1:14,numViewingDirections > 13 & LandWaterFlag == 0)'/pi;

I1020 = stokesI1020(1:14,numViewingDirections > 13 & LandWaterFlag == 0)'/pi;


PLN = PLN(numViewingDirections > 13 & LandWaterFlag == 0);
PCN = PCN(numViewingDirections > 13 & LandWaterFlag == 0);

% Different angles in radians
VZA = deg2rad(ViewingZenithAngle(1:14,numViewingDirections > 13 & LandWaterFlag == 0))';
SZA = deg2rad(SolarZenithAngle(1:14,numViewingDirections > 13 & LandWaterFlag == 0))';
RAA = pi - deg2rad(RelativeAzimuthAngle(1:14,numViewingDirections > 13 & LandWaterFlag == 0))';

IDif1 = I670 - I490;
IDif1 = mean(IDif1,2);

IDif2 = I865 - I490;
IDif2 = mean(IDif2,2);

%clearvars stokesI8651 stokesQ8651 stokesU8651 stokesI6701 stokesQ6701 stokesU6701 stokesI4901 stokesQ4901 stokesU4901 stokesI1020

%%
% Remove the radiance values greater than 1.

for i = 1:14

    A1 = I490(:,i);
    A2 = I670(:,i);
    A3 = I865(:,i);
    A4 = I1020(:,i);
    B = find(A1 > 1 | A1 < -1 | A2 > 1 | A2 < -1 | A3 > 1 | A3 < -1 | A4 > 1 | A4 < -1);
    I865(B,:) = [];
    Q865(B,:) = [];
    U865(B,:) = [];
    
%     A =  I4901(:,i);
%     B = find(A > 1);
    I490(B,:) = [];
    Q490(B,:) = [];
    U490(B,:) = [];
    
%     A =  I6701(:,i);
%     B = find(A > 1);
    I670(B,:) = [];
    Q670(B,:) = [];
    U670(B,:) = [];
    
%     A4 =  I1020(:,i);
%     B4 = find(A4 > 1);
    I1020(B,:) = [];
    
    IDif1(B,:) = [];
    IDif2(B,:) = [];
    
    PLN(B,:) = [];
    PCN(B,:) = [];
    
    VZA(B,:) = [];
    SZA(B,:) = [];
    RAA(B,:) = [];
    
end
                                                                             

% Calculate the Scattering Angle(SA)
SA = acos(-cos(VZA).*cos(SZA) + abs(sin(VZA)).*abs(sin(SZA)).*cos(RAA))';

VZAdeg = rad2deg(VZA); 
SAdeg = rad2deg(SA);
szdeg = rad2deg(mean(SZA,2));
SizeData = length(PLN);

% Form the I Q and U matrice
I = [I490';I670';I865';IDif1'; IDif2'];
Q = [Q490';Q670';Q865'];
U = [U490';U670';U865'];
% 
Ip = sqrt(Q.^2 + U.^2);
% 
DOLP = Ip./I(1:42,:);

% Input Vector for the NN
InputActual = [I; DOLP; SAdeg; VZAdeg']; %szdeg'];

end

%%
% ZR = zeros(3240,6480);
% ZG = zeros(3240,6480);
% ZB = zeros(3240,6480);
% 
% for i = 1:length(PLN1)
%     ZR(PLN1(i),PCN1(i)) = IR1(i);
%     ZG(PLN1(i),PCN1(i)) = IG1(i);
%     ZB(PLN1(i),PCN1(i)) = IB1(i);
% end
% 
% for i = 1:length(PLNB)
%     ZR(PLNB(i),PCNB(i)) = IR2(i);
%     ZG(PLNB(i),PCNB(i)) = IG2(i);
%     ZB(PLNB(i),PCNB(i)) = IB2(i);
% end
% 
% Z = [[ZR];[ZG];[ZB]];
% 
% refvec = [18 90 -180];
%
% figure
% axesm sinusoid
% geoshow(Z,refvec,'DisplayType','Image')
% colormap(gray(256))
% load coast
% plotm(lat,long,'w')
% gridm
% framem