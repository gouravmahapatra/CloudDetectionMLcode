%% Implementation of Neural Network to the first test case data 
% Author: G.Mahapatra@sron.nl
% Supervisor: A.di.Noia@sron.nl

clc
clear all
close all

% Retrieve flag data
flagStokesClear = h5read('rt_sim_1_clear.h5','/OutputData/ModelErrorFlag');
flagStokesCloudy = h5read('rt_sim_1_cloudy.h5','/OutputData/ModelErrorFlag');

% Retrieve stokes vector for clear and cloudy
stokesClear = h5read('rt_sim_1_clear.h5','/OutputData/StokesVector');
stokesCloudy = h5read('rt_sim_1_cloudy.h5','/OutputData/StokesVector');

% Only save the data with flag values equal to 0.
stokesCloudyCorrect = stokesCloudy(:,:,:,flagStokesCloudy == 0);

% Retrieve viewing angles 
ViewingZenithAngle = h5read('rt_sim_1_clear.h5','/InputData/ViewingZenithAngle');
vza = ViewingZenithAngle(:,1)';

%Data Size
SizeDataClear = length(flagStokesClear);
SizeDataCloudy = length(flagStokesCloudy(flagStokesCloudy==0));
%% wn = wavelength number
% Intensities for clear and cloudy for every viewing angle and separate
% wavelengths

% Wavelength 1 
Iclear1 = squeeze(stokesClear(1,1,:,:));
Icloudy1 = squeeze(stokesCloudyCorrect(1,1,:,:));
Qclr1 = stokesClear(2,1,:,:);
Uclr1 = stokesClear(3,1,:,:);
Qclo1 = stokesCloudyCorrect(2,1,:,:);
Uclo1 = stokesCloudyCorrect(3,1,:,:);
Ipclr1 = squeeze(sqrt(Qclr1.^2 + Uclr1.^2)); % Polarized Intensity
Ipclo1 = squeeze(sqrt(Qclo1.^2 + Uclo1.^2));
% DOLP 
DOLPclear1 = Ipclr1./Iclear1;
DOLPcloudy1 = Ipclo1./Icloudy1;

% Wavelength 2
Iclear2 = squeeze(stokesClear(1,2,:,:));
Icloudy2 = squeeze(stokesCloudyCorrect(1,2,:,:));
Qclr2 = stokesClear(2,2,:,:);
Uclr2 = stokesClear(3,2,:,:);
Qclo2 = stokesCloudyCorrect(2,2,:,:);
Uclo2 = stokesCloudyCorrect(3,2,:,:);
Ipclr2 = squeeze(sqrt(Qclr2.^2 + Uclr2.^2)); % Polarized Intensity
Ipclo2 = squeeze(sqrt(Qclo2.^2 + Uclo2.^2));
% DOLP 
DOLPclear2 = Ipclr2./Iclear2;
DOLPcloudy2 = Ipclo2./Icloudy2;

% Wavelength 3
Iclear3 = squeeze(stokesClear(1,3,:,:));
Icloudy3 = squeeze(stokesCloudyCorrect(1,3,:,:));
Qclr3 = stokesClear(2,3,:,:);
Uclr3 = stokesClear(3,3,:,:);
Qclo3 = stokesCloudyCorrect(2,3,:,:);
Uclo3 = stokesCloudyCorrect(3,3,:,:);
Ipclr3 = squeeze(sqrt(Qclr3.^2 + Uclr3.^2)); % Polarized Intensity
Ipclo3 = squeeze(sqrt(Qclo3.^2 + Uclo3.^2));
% DOLP 
DOLPclear3 = Ipclr3./Iclear3;
DOLPcloudy3 = Ipclo3./Icloudy3;

% Wavelength 4
Iclear4 = squeeze(stokesClear(1,4,:,:));
Icloudy4 = squeeze(stokesCloudyCorrect(1,4,:,:));
Qclr4 = stokesClear(2,4,:,:);
Uclr4 = stokesClear(3,4,:,:);
Qclo4 = stokesCloudyCorrect(2,4,:,:);
Uclo4 = stokesCloudyCorrect(3,4,:,:);
Ipclr4 = squeeze(sqrt(Qclr4.^2 + Uclr4.^2)); % Polarized Intensity
Ipclo4 = squeeze(sqrt(Qclo4.^2 + Uclo4.^2));
% DOLP 
DOLPclear4 = Ipclr4./Iclear4;
DOLPcloudy4 = Ipclo4./Icloudy4;

% Wavelength 5
Iclear5 = squeeze(stokesClear(1,5,:,:));
Icloudy5 = squeeze(stokesCloudyCorrect(1,5,:,:));
Qclr5 = stokesClear(2,5,:,:);
Uclr5 = stokesClear(3,5,:,:);
Qclo5 = stokesCloudyCorrect(2,5,:,:);
Uclo5 = stokesCloudyCorrect(3,5,:,:);
Ipclr5 = squeeze(sqrt(Qclr5.^2 + Uclr5.^2)); % Polarized Intensity
Ipclo5 = squeeze(sqrt(Qclo5.^2 + Uclo5.^2));
% DOLP 
DOLPclear5 = Ipclr5./Iclear5;
DOLPcloudy5 = Ipclo5./Icloudy5;

% Wavelength 6 
Iclear6 = squeeze(stokesClear(1,6,:,:));
Icloudy6 = squeeze(stokesCloudyCorrect(1,6,:,:));
Qclr6 = stokesClear(2,6,:,:);
Uclr6 = stokesClear(3,6,:,:);
Qclo6 = stokesCloudyCorrect(2,6,:,:);
Uclo6 = stokesCloudyCorrect(3,6,:,:);
Ipclr6 = squeeze(sqrt(Qclr6.^2 + Uclr6.^2)); % Polarized Intensity
Ipclo6 = squeeze(sqrt(Qclo6.^2 + Uclo6.^2));
% DOLP 
DOLPclear6 = Ipclr6./Iclear6;
DOLPcloudy6 = Ipclo6./Icloudy6;

% Wavelength 7 
Iclear7 = squeeze(stokesClear(1,7,:,:));
Icloudy7 = squeeze(stokesCloudyCorrect(1,7,:,:));
Qclr7 = stokesClear(2,7,:,:);
Uclr7 = stokesClear(3,7,:,:);
Qclo7 = stokesCloudyCorrect(2,7,:,:);
Uclo7 = stokesCloudyCorrect(3,7,:,:);
Ipclr7 = squeeze(sqrt(Qclr7.^2 + Uclr7.^2)); % Polarized Intensity
Ipclo7 = squeeze(sqrt(Qclo7.^2 + Uclo7.^2));
% DOLP 
DOLPclear7 = Ipclr7./Iclear7;
DOLPcloudy7 = Ipclo7./Icloudy7;

% Wavelength 8 
Iclear8 = squeeze(stokesClear(1,8,:,:));
Icloudy8 = squeeze(stokesCloudyCorrect(1,8,:,:));
Qclr8 = stokesClear(2,8,:,:);
Uclr8 = stokesClear(3,8,:,:);
Qclo8 = stokesCloudyCorrect(2,8,:,:);
Uclo8 = stokesCloudyCorrect(3,8,:,:);
Ipclr8 = squeeze(sqrt(Qclr8.^2 + Uclr8.^2)); % Polarized Intensity
Ipclo8 = squeeze(sqrt(Qclo8.^2 + Uclo8.^2));
% DOLP 
DOLPclear8 = Ipclr8./Iclear8;
DOLPcloudy8 = Ipclo8./Icloudy8;

% Wavelength 9 
Iclear9 = squeeze(stokesClear(1,9,:,:));
Icloudy9 = squeeze(stokesCloudyCorrect(1,9,:,:));
Qclr9 = stokesClear(2,9,:,:);
Uclr9 = stokesClear(3,9,:,:);
Qclo9 = stokesCloudyCorrect(2,9,:,:);
Uclo9 = stokesCloudyCorrect(3,9,:,:);
Ipclr9 = squeeze(sqrt(Qclr9.^2 + Uclr9.^2)); % Polarized Intensity
Ipclo9 = squeeze(sqrt(Qclo9.^2 + Uclo9.^2));
% DOLP 
DOLPclear9 = Ipclr9./Iclear9;
DOLPcloudy9 = Ipclo9./Icloudy9;

%% Array formations for the NN Inputs 
% Edit the inputs for the NN here!!

InputArrayClear = [DOLPclear1];
InputArrayCloudy = [DOLPcloudy1];

Input = [InputArrayClear';InputArrayCloudy'];

% InputArrayClear = [Iclear1;DOLPclear1;Iclear2;DOLPclear2;Iclear3;DOLPclear3;Iclear4;DOLPclear4;Iclear5;DOLPclear5;Iclear6;DOLPclear6;Iclear7;DOLPclear7;Iclear8;DOLPclear8;Iclear9;DOLPclear9];
% InputArrayCloudy = [Icloudy1;DOLPcloudy1;Icloudy2;DOLPcloudy2;Icloudy3;DOLPcloudy3;Icloudy4;DOLPcloudy4;Icloudy5;DOLPcloudy5;Icloudy6;DOLPcloudy6;Icloudy7;DOLPcloudy7;Icloudy8;DOLPcloudy8;Icloudy9;DOLPcloudy9];
% 
% Input = [InputArrayClear';InputArrayCloudy'];

%% Array formations for the NN Targets
% Edit the targets for the NN here!!

wn = 9; %No. of wavelengths

%Target Definition/create vectors
TargetClear = zeros(1,SizeDataClear);  % Clear are 0 
TargetCloudy = ones(1,SizeDataCloudy); % Clouds are 1

%Target vector formation
Target = [TargetClear';TargetCloudy'];
%%





