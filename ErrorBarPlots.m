%% Error bar plots
clc
clear all
close all

% Retrieve flag data
flagStokesClear = h5read('rt_sim_1_clear.h5','/OutputData/ModelErrorFlag');
flagStokesCloudy = h5read('rt_sim_1_cloudy.h5','/OutputData/ModelErrorFlag');

% Retrieve stokes vector for clear and cloudy
stokesClear = h5read('rt_sim_1_clear.h5','/OutputData/StokesVector');
stokesCloudy = h5read('rt_sim_1_cloudy.h5','/OutputData/StokesVector');

stokesCloudyCorrect = stokesCloudy(:,:,:,flagStokesCloudy == 0);

% Retrieve viewing angles 
ViewingZenithAngle = h5read('rt_sim_1_clear.h5','/InputData/ViewingZenithAngle');
vza = ViewingZenithAngle(:,1)';

%Data Size
SizeDataClear = length(flagStokesClear);
SizeDataCloudy = length(flagStokesCloudy(flagStokesCloudy == 0));

%%

wn = 3; % Wavelength number
Qclr = stokesClear(2,wn,:,:);
Uclr = stokesClear(3,wn,:,:);

Qclo = stokesCloudyCorrect(2,wn,:,:);
Uclo = stokesCloudyCorrect(3,wn,:,:);

% Intensities for clear and cloudy for every viewing angle
Ipclr = sqrt(Qclr.^2 + Uclr.^2);
Ipclo = sqrt(Qclo.^2 + Uclo.^2);

Iclear = stokesClear(1,wn,:,:);
Icloudy = stokesCloudyCorrect(1,wn,:,:);

% DOLP 
DOLPclear = Ipclr./Iclear;
DOLPcloudy = Ipclo./Icloudy;


%%

mIclear = mean(Iclear,4);
mIcloudy = mean(Icloudy,4);


% Q and U co-efficients for clear sky for every viewing angle
mDOLPclr = mean(DOLPclear,4);
mDOLPclo = mean(DOLPcloudy,4);

sDOLPclr = std(DOLPclear,0,4);
sDOLPclo = std(DOLPcloudy,0,4);

% convert to 1d
mDOLPclr = mDOLPclr(:);
mDOLPclo = mDOLPclo(:);

sDOLPclr = sDOLPclr(:);
sDOLPclo = sDOLPclo(:);

sIclear = std(Iclear,0,4);
sIcloudy = std(Icloudy,0,4);

mIclear = mIclear(:);
mIcloudy = mIcloudy(:);

sIclear = sIclear(:);
sIcloudy = sIcloudy(:);

errorbar(vza,mDOLPclr,sDOLPclr,'r')
hold on
errorbar(vza,mDOLPclo,sDOLPclo,'b')
xlabel('Viewing zenith angle(deg)');
ylabel('Mean DOLP');
title('Error bar plots for VZA vs. DOLP (Lambda = 3)')

figure
errorbar(vza,mIclear,sIclear,'r')
hold on
errorbar(vza,mIcloudy,sIcloudy,'b')
xlabel('Viewing zenith angle(deg)');
ylabel('Mean Intensity');
title('Error bar plots for VZA vs. Intensity (Lambda = 3)')
