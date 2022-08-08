%% Dust test case array formation

%% Implementation of Neural Network to the first test case data 
% clc
% dusty all
% close all

% Retrieve flag data
flagStokesCloudy = h5read('rt_sim_1_dustyV2.h5','/OutputData/ModelErrorFlag');

% Retrieve stokes vector for dusty and cloudy
stokesDusty = h5read('rt_sim_1_dustyV2.h5','/OutputData/StokesVector');

%Data Size
SizeDataDusty = length(flagStokesCloudy(flagStokesCloudy == 0));


%% Creation of the Input data for NN

% Intensities for dusty and cloudy for every viewing angle
Idusty490 = squeeze(stokesDusty(1,2,:,flagStokesCloudy == 0));
Qdusty490 = squeeze(stokesDusty(2,2,:,flagStokesCloudy == 0));
Udusty490 = squeeze(stokesDusty(3,2,:,flagStokesCloudy == 0));

% % Polarized intensity 
% Ipdusty490 = squeeze(sqrt(Qdusty490.^2 + Udusty490.^2));
% Ipcloudy490 = squeeze(sqrt(Qcloudy490.^2 + Ucloudy490.^2));

%%

Idusty670 = squeeze(stokesDusty(1,4,:,flagStokesCloudy == 0));
Qdusty670 = squeeze(stokesDusty(2,4,:,flagStokesCloudy == 0));
Udusty670 = squeeze(stokesDusty(3,4,:,flagStokesCloudy == 0));

% % Polarized intensity 
% Ipdusty670 = squeeze(sqrt(Qdusty670.^2 + Udusty670.^2));
% Ipcloudy670 = squeeze(sqrt(Qcloudy670.^2 + Ucloudy670.^2));

%%
Idusty865 = squeeze(stokesDusty(1,7,:,flagStokesCloudy == 0));
Qdusty865 = squeeze(stokesDusty(2,7,:,flagStokesCloudy == 0));
Udusty865 = squeeze(stokesDusty(3,7,:,flagStokesCloudy == 0));

% % Polarized intensity 
% Ipdusty865 = squeeze(sqrt(Qdusty865.^2 + Udusty865.^2));
% Ipcloudy865 = squeeze(sqrt(Qcloudy865.^2 + Ucloudy865.^2));

%%
Idusty1020 = squeeze(stokesDusty(1,9,:,flagStokesCloudy == 0));


IDif1 = Idusty670 - Idusty490;
IDif1 = mean(IDif1,1);

IDif2 = Idusty865 - Idusty490;
IDif2 = mean(IDif2,1);

%%
Idusty = [Idusty490; Idusty670; Idusty865; IDif1; IDif2]'; %Idusty1020]';
Qdusty = [Qdusty490; Qdusty670; Qdusty865]';
Udusty = [Udusty490; Udusty670; Udusty865]';


% Retrieve viewing angles 
ViewingZenithAngle = h5read('rt_sim_1_dustyV2.h5','/InputData/ViewingZenithAngle');
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

f = rand(SizeDataDusty,1); 
% f2 = th + (b-th).*rand(SizeDataCloudy/2,1);


% Mix the cloudy and dusty data
I = Idusty;
Q = Qdusty;
U = Udusty;


nrows = size(I,1);
ncolumns= size(I,2);
noise = 0.01*normrnd(0,1,[nrows ncolumns]).*I;
I = I + noise;

ncolumns1=size(Q,2);
noise = 0.01*normrnd(0,1,[nrows ncolumns1]).*Q;
Q = Q + noise;

noise = 0.01*normrnd(0,1,[nrows ncolumns1]).*U;
U = U + noise;

Ip = sqrt(Q.^2 + U.^2);

%DOLP 
DOLP = Ip./I(:,1:42);

% 
% InputArraydusty = [Idusty;DOLPdusty];
% InputArrayCloudy = [Icloudy;DOLPcloudy];

InputDusty = [I'; DOLP'; SA; vza];


% %% Create the target data for training the neural network
% %Target Definition/create vectors
% Targetdusty = zeros(1,SizeDatadusty);
% TargetCloudy = ones(1,SizeDataCloudy);
% 
% %Target vector formation
% Target = [Targetdusty';TargetCloudy'];




