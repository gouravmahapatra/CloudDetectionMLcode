%% Program to read HDF5 file containing radiative transfer data...
% and create plots of ViewingAngles vs. clear and cloudy sky

clc
clear all
close all

% Retrieve stokes vector for clear and cloudy
stokesClear = h5read('rt_sim_1_clear.h5','/OutputData/StokesVector');
stokesCloudy = h5read('rt_sim_1_cloudy.h5','/OutputData/StokesVector');

% Retrieve viewing angles 
ViewingZenithAngle = h5read('rt_sim_1_clear.h5','/InputData/ViewingZenithAngle');

%% n = no. of the dataset

n = 1;
% vza = viewing zenith angle
vza = ViewingZenithAngle(:,n)';

%Intensity
Iclear = stokesClear(1,1,:,n);
Icloudy = stokesCloudy(1,1,:,n);

% Q and U co-efficients for clear sky
Qclr = stokesClear(2,1,:,n);
Uclr = stokesClear(3,1,:,n);

% Q and U co-efficients for cloudy sky
Qclo = stokesCloudy(2,1,:,n);
Uclo = stokesCloudy(3,1,:,n);

% Form the Ip(Polarized Intensity) array from the StokesVector 
i = 0;
for i = 1:length(Qclo)
    Ipclr(i) = sqrt(Qclr(i).^2 + Uclr(i).^2);
    Ipclo(i) = sqrt(Qclo(i).^2 + Uclo(i).^2);
end

% To convert into 1D array
Iclear = Iclear(:)';
Icloudy = Icloudy(:)';

% DOLP = Ip/I
DOLPclr = Ipclr./Iclear;
DOLPclo = Ipclo./Icloudy;

%%
% Plotting begins
% Plot 1
plot(vza,Iclear,'r')
hold on
plot(vza,Icloudy,'b')
xlabel('VZA(deg)')
ylabel('I')
title('Total intensity(I) vs. Viewing Angle(deg)')
hold off

% Plot 2 
figure
plot(vza,DOLPclr,'r')
hold on
plot(vza,DOLPclo,'b')
xlabel('VZA(deg)');
ylabel('DOLP(Ip/I)');
title('Polarized intensity(DOLP) vs. Viewing Angle(deg) ')

%%

% Calculate the mean DOLP out of 10,000 dataset for every Viewing Zenith
% Angle
%m = viewing angle

for m = 1:33

% Q and U co-efficients for clear sky for every viewing angle
mQclr = mean(stokesClear(2,1,m,:));
mUclr = mean(stokesClear(3,1,m,:));
% Q and U co-efficients for cloudy sky for every viewing angle
mQclo = mean(stokesCloudy(2,1,m,:));
mUclo = mean(stokesCloudy(3,1,m,:));
% Intensities for clear and cloudy for every viewing angle
meanIpclr = sqrt(mQclr.^2 + mUclr.^2);
meanIpclo = sqrt(mQclo.^2 + mUclo.^2);
% Mean total Intensities
meanIclear = mean(stokesClear(1,1,m,:));
meanIcloudy = mean(stokesCloudy(1,1,m,:));


meanDOLPclr(m) = meanIpclr./meanIclear;
meanDOLPclo(m) = meanIpclo./meanIcloudy;


% Std. dev. of values for every viewing angle
% Std dev of Q and U co-efficients for clear sky for every viewing angle
devQclr = std(stokesClear(2,1,m,:));
devUclr = std(stokesClear(3,1,m,:));
% Std dev f Q and U co-efficients for cloudy sky for every viewing angle
devQclo = std(stokesCloudy(2,1,m,:));
devUclo = std(stokesCloudy(3,1,m,:));
% Std dev of Intensities for clear and cloudy for every viewing angle
devIpclr(m) = sqrt(devQclr.^2 + devUclr.^2);
devIpclo(m) = sqrt(devQclo.^2 + devUclo.^2);

end

devDOLPclr = devIpclr./Iclear;
devDOLPclo = devIpclo./Icloudy;

% Plotting
figure
errorbar(vza,meanDOLPclr,devDOLPclr,'r')
figure
errorbar(vza,meanDOLPclo,devDOLPclo,'b')


    
    
        


