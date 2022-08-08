%% Implementation of Neural Network to the first test case data 

%function [Input, Target] = DustMixCase()

% Retrieve flag data
flagStokesClear = h5read('rt_sim_1_clearV2.h5','/OutputData/ModelErrorFlag');
flagStokesCloudy = h5read('rt_sim_1_cloudyV2.h5','/OutputData/ModelErrorFlag');

% Retrieve stokes vector for clear and cloudy
stokesClear = h5read('rt_sim_1_clearV2.h5','/OutputData/StokesVector');
stokesCloudy = h5read('rt_sim_1_cloudyV2.h5','/OutputData/StokesVector');
stokesDusty = h5read('rt_sim_1_dustyV2.h5','/OutputData/StokesVector');

%Data Size
SizeDataClear = length(flagStokesCloudy(flagStokesCloudy == 0));
SizeDataCloudy = length(flagStokesCloudy(flagStokesCloudy == 0));
SizeDataDusty = length(flagStokesCloudy(flagStokesCloudy == 0));
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
IclearDif1 = Iclear670 - Iclear490;
IclearDif1 = mean(IclearDif1,1);

IcloudyDif1 = Icloudy670 - Icloudy490;
IcloudyDif1 = mean(IcloudyDif1,1);

IclearDif2 = Iclear865 - Iclear490;
IclearDif2 = mean(IclearDif2,1);

IcloudyDif2 = Icloudy865 - Icloudy490;
IcloudyDif2 = mean(IcloudyDif2,1);

%%
% Intensities for dusty and cloudy for every viewing angle
Idusty490 = squeeze(stokesDusty(1,2,:,flagStokesCloudy == 0));
Qdusty490 = squeeze(stokesDusty(2,2,:,flagStokesCloudy == 0));
Udusty490 = squeeze(stokesDusty(3,2,:,flagStokesCloudy == 0));

Idusty670 = squeeze(stokesDusty(1,4,:,flagStokesCloudy == 0));
Qdusty670 = squeeze(stokesDusty(2,4,:,flagStokesCloudy == 0));
Udusty670 = squeeze(stokesDusty(3,4,:,flagStokesCloudy == 0));

Idusty865 = squeeze(stokesDusty(1,7,:,flagStokesCloudy == 0));
Qdusty865 = squeeze(stokesDusty(2,7,:,flagStokesCloudy == 0));
Udusty865 = squeeze(stokesDusty(3,7,:,flagStokesCloudy == 0));

IdustyDif1 = Idusty670 - Idusty490;
IdustyDif1 = mean(IdustyDif1,1);

IdustyDif2 = Idusty865 - Idusty490;
IdustyDif2 = mean(IdustyDif2,1);

%%
Iclear = [Iclear490; Iclear670; Iclear865; IclearDif1; IclearDif2]'; %Iclear1020]';
Icloudy = [Icloudy490; Icloudy670; Icloudy865; IcloudyDif1; IcloudyDif2]'; %Icloudy1020]';

Qclear = [Qclear490; Qclear670; Qclear865]';
Qcloudy = [Qcloudy490; Qcloudy670; Qcloudy865]';

Uclear = [Uclear490; Uclear670; Uclear865]';
Ucloudy = [Ucloudy490; Ucloudy670; Ucloudy865]';

Idusty = [Idusty490; Idusty670; Idusty865; IdustyDif1; IdustyDif2]'; %Idusty1020]';
Qdusty = [Qdusty490; Qdusty670; Qdusty865]';
Udusty = [Udusty490; Udusty670; Udusty865]';

%%

% Retrieve viewing angles 
ViewingZenithAngle = double(h5read('rt_sim_1_clearV2.h5','/InputData/ViewingZenithAngle'));
RelativeAzimuthAngle = double(h5read('rt_sim_1_cloudyV2.h5','/InputData/RelativeAzimuthAngle'));
SolarZenithAngle = double(h5read('rt_sim_1_cloudyV2.h5','/InputData/SolarZenithAngle'));

for i = 1:14
        sza(i,:) = SolarZenithAngle;
end

vza = deg2rad(ViewingZenithAngle(:,flagStokesCloudy == 0));
raa = deg2rad(RelativeAzimuthAngle(:,flagStokesCloudy == 0));
sza = deg2rad(sza(:,flagStokesCloudy == 0));

% scattering angle matrix
SA = rad2deg(acos(-cos(vza).*cos(sza) + abs(sin(vza)).*abs(sin(sza)).*cos(raa)));
vza = rad2deg(vza);
sz = SolarZenithAngle(flagStokesCloudy == 0,:);

f = rand(SizeDataCloudy,1); 
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
noise = 0.01*normrnd(0,1,[nrows ncolumns1]).*Q;
Q = Q + noise;

noise = 0.01*normrnd(0,1,[nrows ncolumns1]).*U;
U = U + noise;

Ip = sqrt(Q.^2 + U.^2);

%DOLP 
DOLP = Ip./I(:,1:42);
% 
% InputArrayClear = [Iclear;DOLPclear];
% InputArrayCloudy = [Icloudy;DOLPcloudy];
%%
% Retrieve viewing angles for the dust case
ViewingZenithAngleD = double(h5read('rt_sim_1_dustyV2.h5','/InputData/ViewingZenithAngle'));
RelativeAzimuthAngleD = double(h5read('rt_sim_1_dustyV2.h5','/InputData/RelativeAzimuthAngle'));
SolarZenithAngleD = double(h5read('rt_sim_1_dustyV2.h5','/InputData/SolarZenithAngle'));

for i = 1:14
        szaD(i,:) = SolarZenithAngleD;
end

vzaD = deg2rad(ViewingZenithAngleD(:,flagStokesCloudy == 0));
raaD = deg2rad(RelativeAzimuthAngleD(:,flagStokesCloudy == 0));
szaD = deg2rad(szaD(:,flagStokesCloudy == 0));

% scattering angle matrix
SAD = rad2deg(acos(-cos(vzaD).*cos(szaD) + abs(sin(vzaD)).*abs(sin(szaD)).*cos(raaD)));
vzaD = rad2deg(vzaD);
szD = SolarZenithAngleD(flagStokesCloudy == 0,:);

fD = ones(SizeDataDusty,1)*0.001; 

nrowsD = size(Idusty,1);
ncolumnsD= size(Idusty,2);
noiseD = 0.01*normrnd(0,1,[nrowsD ncolumnsD]).*Idusty;
Idusty = Idusty + noiseD;

ncolumnsD1 = size(Qdusty,2);
noiseD = 0.01*normrnd(0,1,[nrowsD ncolumnsD1]).*Qdusty;
Qdusty = Qdusty + noiseD;

noiseD = 0.01*normrnd(0,1,[nrowsD ncolumnsD1]).*Udusty;
Udusty = Udusty + noiseD;

Ipdusty = sqrt(Qdusty.^2 + Udusty.^2);

%DOLP 
DOLPdusty = Ipdusty./Idusty(:,1:42);

Ifinal = [I;Idusty(1:10000,:)];
DOLPfinal = [DOLP;DOLPdusty(1:10000,:)];
SAfinal = [SA';SAD(:,1:10000)']';
vzafinal = [vza';vzaD(:,1:10000)']';
szfinal = [sz;szD(1:10000)]';

Input = [Ifinal'; DOLPfinal'; SAfinal; vzafinal; szfinal];

Target = [f;fD(1:10000)];

Target = log(Target./(1 - Target));

%end
% %% Create the target data for training the neural network
% %Target Definition/create vectors
% TargetClear = zeros(1,SizeDataClear);
% TargetCloudy = ones(1,SizeDataCloudy);
% 
% %Target vector formation
% Target = [TargetClear';TargetCloudy'];




