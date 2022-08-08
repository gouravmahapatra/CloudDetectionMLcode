%% Implementation of Neural Network to the first test case data 
clc
clear all
close all

% Retrieve flag data
flagStokesClear = h5read('rt_sim_1_clearV2.h5','/OutputData/ModelErrorFlag');
flagStokesCloudy = h5read('rt_sim_1_cloudyV2.h5','/OutputData/ModelErrorFlag');

% Retrieve stokes vector for clear and cloudy
stokesClear = h5read('rt_sim_1_clearV2.h5','/OutputData/StokesVector');
stokesCloudy = h5read('rt_sim_1_cloudyV2.h5','/OutputData/StokesVector');


%Data Size
SizeDataClear = length(flagStokesCloudy(flagStokesCloudy == 0));
SizeDataCloudy = length(flagStokesCloudy(flagStokesCloudy == 0));

%% Creation of the Input data for NN

% Intensities for clear and cloudy for every viewing angle
Iclear490 = squeeze(stokesClear(1,2,:,flagStokesCloudy == 0));
Icloudy490 = squeeze(stokesCloudy(1,2,:,flagStokesCloudy == 0));

Qclear490 = squeeze(stokesClear(2,2,:,flagStokesCloudy == 0));
Uclear490 = squeeze(stokesClear(3,2,:,flagStokesCloudy == 0));

Qcloudy490 = squeeze(stokesCloudy(2,2,:,flagStokesCloudy == 0));
Ucloudy490 = squeeze(stokesCloudy(3,2,:,flagStokesCloudy == 0));

% % Polarized intensity 
% Ipclear490 = squeeze(sqrt(Qclear490.^2 + Uclear490.^2));
% Ipcloudy490 = squeeze(sqrt(Qcloudy490.^2 + Ucloudy490.^2));

%%

Iclear670 = squeeze(stokesClear(1,4,:,flagStokesCloudy == 0));
Icloudy670 = squeeze(stokesCloudy(1,4,:,flagStokesCloudy == 0));

Qclear670 = squeeze(stokesClear(2,4,:,flagStokesCloudy == 0));
Uclear670 = squeeze(stokesClear(3,4,:,flagStokesCloudy == 0));

Qcloudy670 = squeeze(stokesCloudy(2,4,:,flagStokesCloudy == 0));
Ucloudy670 = squeeze(stokesCloudy(3,4,:,flagStokesCloudy == 0));

% % Polarized intensity 
% Ipclear670 = squeeze(sqrt(Qclear670.^2 + Uclear670.^2));
% Ipcloudy670 = squeeze(sqrt(Qcloudy670.^2 + Ucloudy670.^2));

%%
Iclear865 = squeeze(stokesClear(1,7,:,flagStokesCloudy == 0));
Icloudy865 = squeeze(stokesCloudy(1,7,:,flagStokesCloudy == 0));

Qclear865 = squeeze(stokesClear(2,7,:,flagStokesCloudy == 0));
Uclear865 = squeeze(stokesClear(3,7,:,flagStokesCloudy == 0));

Qcloudy865 = squeeze(stokesCloudy(2,7,:,flagStokesCloudy == 0));
Ucloudy865 = squeeze(stokesCloudy(3,7,:,flagStokesCloudy == 0));

% % Polarized intensity 
% Ipclear865 = squeeze(sqrt(Qclear865.^2 + Uclear865.^2));
% Ipcloudy865 = squeeze(sqrt(Qcloudy865.^2 + Ucloudy865.^2));

%%
Iclear1020 = squeeze(stokesClear(1,9,:,flagStokesCloudy == 0));
Icloudy1020 = squeeze(stokesCloudy(1,9,:,flagStokesCloudy == 0));
% 
% Qclear1020 = squeeze(stokesClear(2,9,:,flagStokesCloudy == 0));
% Uclear1020 = squeeze(stokesClear(3,9,:,flagStokesCloudy == 0));
% 
% Qcloudy1020 = squeeze(stokesCloudy(2,9,:,flagStokesCloudy == 0));
% Ucloudy1020 = squeeze(stokesCloudy(3,9,:,flagStokesCloudy == 0));

% % Polarized intensity 
% Ipclear1020 = squeeze(sqrt(Qclear1020.^2 + Uclear1020.^2));
% Ipcloudy1020 = squeeze(sqrt(Qcloudy1020.^2 + Ucloudy1020.^2));

%%
Iclear = [Iclear490; Iclear670; Iclear865]';
Icloudy = [Icloudy490; Icloudy670; Icloudy865]';

Qclear = [Qclear490; Qclear670; Qclear865]';
Qcloudy = [Qcloudy490; Qcloudy670; Qcloudy865]';

Uclear = [Uclear490; Uclear670; Uclear865]';
Ucloudy = [Ucloudy490; Ucloudy670; Ucloudy865]';

% Retrieve viewing angles 
ViewingZenithAngle = h5read('rt_sim_1_clearV2.h5','/InputData/ViewingZenithAngle');
RelativeAzimuthAngle = h5read('rt_sim_1_cloudyV2.h5','/InputData/RelativeAzimuthAngle');
SolarZenithAngle = h5read('rt_sim_1_cloudyV2.h5','/InputData/SolarZenithAngle');

for i = 1:14
        sza(i,:) = SolarZenithAngle;
end

vza = deg2rad(ViewingZenithAngle(:,flagStokesCloudy == 0));
raa = deg2rad(RelativeAzimuthAngle(:,flagStokesCloudy == 0));
sza = deg2rad(sza(:,flagStokesCloudy == 0));

% scattering angle matrix
SA = rad2deg(acos(-cos(vza).*cos(sza) + abs(sin(vza)).*abs(sin(sza)).*cos(raa)));
vza = rad2deg(vza);

f = (rand(SizeDataCloudy,1))'; 
f = log(f./(1-f));
% f2 = th + (b-th).*rand(SizeDataCloudy/2,1);



for n = 1:SizeDataCloudy

% Mix the cloudy and clear data
I(n,:) = Iclear(n,:).*(1-f(n)) + Icloudy(n,:).*f(n);
Q(n,:) = Qclear(n,:).*(1-f(n)) + Qcloudy(n,:).*f(n);
U(n,:) = Uclear(n,:).*(1-f(n)) + Ucloudy(n,:).*f(n);

end

nrows = size(I,1);
ncolumns= size(I,2);
noise = 0.01*normrnd(0,1,[nrows ncolumns]).*I;
I = I + noise;

ncolumns1 = size(Q,2);
noise1 = 0.01*normrnd(0,1,[nrows ncolumns1]).*Q;
Q = Q + noise1;

noise1 = 0.01*normrnd(0,1,[nrows ncolumns1]).*U;
U = U + noise1;

Ip = sqrt(Q.^2 + U.^2);

%DOLP 
DOLP = Ip./I;

% 
% InputArrayClear = [Iclear;DOLPclear];
% InputArrayCloudy = [Icloudy;DOLPcloudy];

Input = [I'; DOLP'; SA; vza];


% %% Create the target data for training the neural network
% %Target Definition/create vectors
% TargetClear = zeros(1,SizeDataClear);
% TargetCloudy = ones(1,SizeDataCloudy);
% 
% %Target vector formation
% Target = [TargetClear';TargetCloudy'];




