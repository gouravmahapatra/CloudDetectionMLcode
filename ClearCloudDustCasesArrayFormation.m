%% Implementation of Neural Network to the first test case data 

function [Input, Target] = DustMixCase()

% Retrieve flag data
flagStokesClear = h5read('rt_sim_1_clearV2.h5','/OutputData/ModelErrorFlag');
flagStokesCloudy = h5read('rt_sim_1_cloudyV2.h5','/OutputData/ModelErrorFlag');
flagStokesCloudy = h5read('rt_sim_1_dustyV2.h5','/OutputData/ModelErrorFlag');

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

%%
Iclear = [Iclear490; Iclear670; Iclear865]'; %Iclear1020]';
Icloudy = [Icloudy490; Icloudy670; Icloudy865]'; %Icloudy1020]';

Qclear = [Qclear490; Qclear670; Qclear865]';
Qcloudy = [Qcloudy490; Qcloudy670; Qcloudy865]';

Uclear = [Uclear490; Uclear670; Uclear865]';
Ucloudy = [Ucloudy490; Ucloudy670; Ucloudy865]';

Idusty = [Idusty490; Idusty670; Idusty865]'; %Idusty1020]';
Qdusty = [Qdusty490; Qdusty670; Qdusty865]';
Udusty = [Udusty490; Udusty670; Udusty865]';

%%

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

noise = 0.01*normrnd(0,1,[nrows ncolumns]).*Q;
Q = Q + noise;

noise = 0.01*normrnd(0,1,[nrows ncolumns]).*U;
U = U + noise;

Ip = sqrt(Q.^2 + U.^2);

%DOLP 
DOLP = Ip./I;
% 
% InputArrayClear = [Iclear;DOLPclear];
% InputArrayCloudy = [Icloudy;DOLPcloudy];
%%
% Retrieve viewing angles for the dust case
ViewingZenithAngleD = h5read('rt_sim_1_dustyV2.h5','/InputData/ViewingZenithAngle');
RelativeAzimuthAngleD = h5read('rt_sim_1_dustyV2.h5','/InputData/RelativeAzimuthAngle');
SolarZenithAngleD = h5read('rt_sim_1_dustyV2.h5','/InputData/SolarZenithAngle');

for i = 1:14
        szaD(i,:) = SolarZenithAngleD;
end

vzaD = deg2rad(ViewingZenithAngleD(:,flagStokesCloudy == 0));
raaD = deg2rad(RelativeAzimuthAngleD(:,flagStokesCloudy == 0));
szaD = deg2rad(szaD(:,flagStokesCloudy == 0));

% scattering angle matrix
SAD = rad2deg(acos(-cos(vzaD).*cos(szaD) + abs(sin(vzaD)).*abs(sin(szaD)).*cos(raaD)));
vzaD = rad2deg(vzaD);

fD = ones(SizeDataDusty,1)*0.01; 

nrowsD = size(Idusty,1);
ncolumnsD= size(Idusty,2);
noiseD = 0.01*normrnd(0,1,[nrowsD ncolumnsD]).*Idusty;
Idusty = Idusty + noiseD;

noiseD = 0.01*normrnd(0,1,[nrowsD ncolumnsD]).*Qdusty;
Qdusty = Qdusty + noiseD;

noiseD = 0.01*normrnd(0,1,[nrowsD ncolumnsD]).*Udusty;
Udusty = Udusty + noiseD;

Ipdusty = sqrt(Qdusty.^2 + Udusty.^2);

%DOLP 
DOLPdusty = Ipdusty./Idusty;

Ifinal = [I;Idusty];
DOLPfinal = [DOLP;DOLPdusty];
SAfinal = [SA';SAD']';
vzafinal = [vza';vzaD']';

Input = [Ifinal'; DOLPfinal'; SAfinal; vzafinal];

Target = [f;fD];

Target = log(Target./(1 - Target));

end
% %% Create the target data for training the neural network
% %Target Definition/create vectors
% TargetClear = zeros(1,SizeDataClear);
% TargetCloudy = ones(1,SizeDataCloudy);
% 
% %Target vector formation
% Target = [TargetClear';TargetCloudy'];




