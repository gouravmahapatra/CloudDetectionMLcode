%% Function to create IPA data for NN simulation
% This program reads the hdf5 clear and cloudy cases data and mixes them...
% using a factor(f) specified in a range [0,1].
% For example, to simulate a mixed cloud and clear sky data, the...
% equation used will be I = f.Iclear + (1- f).Icloudy.
% If f = 1, I will equal to Icloudy and if f = 0, I equals Iclear.
% Inputs = (wn,th,rangef)
% Outputs = [Input,Target,f,SAclear,SAcloudy]
% SAclear/Cloudy = Scattering Angle Clear/Cloudy

% Author: G.Mahapatra@sron.nl
% Supervisor: A.di.Noia@sron.nl

function [Input,Target,f,SAclear,SAcloudy,vza,I,DOLP] = NNdatafun(wn,th,rangef,sat)


if sat == 'PARASOL'

    % Retrieve flag data
    flagStokesClear = h5read('rt_sim_1_clearPARASOL.h5','/OutputData/ModelErrorFlag');
    flagStokesCloudy = h5read('rt_sim_1_cloudyPARASOL.h5','/OutputData/ModelErrorFlag');

    % Retrieve stokes vector for clear and cloudy
    stokesClear = h5read('rt_sim_1_clearPARASOL.h5','/OutputData/StokesVector');
    stokesCloudy = h5read('rt_sim_1_cloudyPARASOL.h5','/OutputData/StokesVector');

    % Only save the data with flag values equal to 0.
    stokesClearCorrect = stokesClear(:,:,:,flagStokesCloudy == 0);
    stokesCloudyCorrect = stokesCloudy(:,:,:,flagStokesCloudy == 0);

    % Retrieve viewing angles and rel. azimuth angles 
    ViewingZenithAngleClear = h5read('rt_sim_1_clearPARASOL.h5','/InputData/ViewingZenithAngle');
    ViewingZenithAngleCloudy = h5read('rt_sim_1_cloudyPARASOL.h5','/InputData/ViewingZenithAngle');
    RelativeAzimuthAngleClear = h5read('rt_sim_1_clearPARASOL.h5','/InputData/RelativeAzimuthAngle');
    RelativeAzimuthAngleCloudy = h5read('rt_sim_1_cloudyPARASOL.h5','/InputData/RelativeAzimuthAngle');
    SolarZenithAngleClear = h5read('rt_sim_1_clearPARASOL.h5','/InputData/SolarZenithAngle');
    SolarZenithAngleCloudy = h5read('rt_sim_1_cloudyPARASOL.h5','/InputData/SolarZenithAngle');
        
    
    % Make a matrix for scattering angle
    
    % convert the angles to radians
    vzaClearRad = deg2rad(ViewingZenithAngleClear);
    vzaCloudyRad = deg2rad(ViewingZenithAngleCloudy);
    raaClearRad = deg2rad(RelativeAzimuthAngleClear);
    raaCloudyRad = deg2rad(RelativeAzimuthAngleCloudy);
    szaClearRad = deg2rad(SolarZenithAngleClear);
    szaCloudyRad = deg2rad(SolarZenithAngleCloudy);
    
    for i = 1:14
        szaClearMod(:,i) = szaClearRad;
        szaCloudyMod(:,i) = szaCloudyRad;
    end
    
    szaClearMod = szaClearMod';
    szaCloudyMod = szaCloudyMod';
    
    % scattering angle matrix
    SAclear = rad2deg(acos(-cos(vzaClearRad).*cos(szaClearMod) + abs(sin(vzaClearRad)).*abs(sin(szaClearMod)).*cos(raaClearRad)));
    SAcloudy = rad2deg(acos(-cos(vzaCloudyRad).*cos(szaCloudyMod) + abs(sin(vzaCloudyRad)).*abs(sin(szaCloudyMod)).*cos(raaCloudyRad)));
    
    SAclear = SAclear(:,flagStokesCloudy == 0);
    SAcloudy = SAcloudy(:,flagStokesCloudy == 0);
    
    vza = ViewingZenithAngleCloudy(:,flagStokesCloudy == 0);
    
    
elseif sat == 'RSP'
    
    % Retrieve flag data
    flagStokesClear = h5read('rt_sim_1_clearRSP.h5','/OutputData/ModelErrorFlag');
    flagStokesCloudy = h5read('rt_sim_1_cloudyRSP.h5','/OutputData/ModelErrorFlag');

    % Retrieve stokes vector for clear and cloudy
    stokesClear = h5read('rt_sim_1_clearRSP.h5','/OutputData/StokesVector');
    stokesCloudy = h5read('rt_sim_1_cloudyRSP.h5','/OutputData/StokesVector');

    % Only save the data with flag values equal to 0.
    stokesClearCorrect = stokesClear(:,:,:,flagStokesCloudy == 0);
    stokesCloudyCorrect = stokesCloudy(:,:,:,flagStokesCloudy == 0);

    % Retrieve viewing angles 
    ViewingZenithAngle = h5read('rt_sim_1_clearRSP.h5','/InputData/ViewingZenithAngle');
    
else
    
    disp('Invalid Satellite Selection!')
    
end


vzaLength = vzaClearRad(:,1)';
valength = length(vzaLength);

%Data Size
SizeDataClear = length(flagStokesCloudy(flagStokesCloudy == 0));
SizeDataCloudy = length(flagStokesCloudy(flagStokesCloudy == 0));
% ViewingZenithAngle = ViewingZenithAngle(:,flagStokesCloudy == 0);

% Intensities for clear and cloudy for every viewing angle and separate
% wavelengths

if isnumeric(wn) == 1
% wn = Wavelength no.
    Iclear = squeeze(stokesClearCorrect(1,wn,7,:));
    Icloudy = squeeze(stokesCloudyCorrect(1,wn,7,:));
    Qclear = squeeze(stokesClearCorrect(2,wn,7,:));
    Qcloudy = squeeze(stokesCloudyCorrect(2,wn,7,:));
    Uclear = squeeze(stokesClearCorrect(3,wn,7,:));
    Ucloudy = squeeze(stokesCloudyCorrect(3,wn,7,:));
else
    Iclear = squeeze(stokesClearCorrect(1,[2 4 7],:,:));
    Icloudy = squeeze(stokesCloudyCorrect(1,[2 4 7],:,:));
    Qclear = squeeze(stokesClearCorrect(2,[2 4 7],:,:));
    Qcloudy = squeeze(stokesCloudyCorrect(2,[2 4 7],:,:));
    Uclear = squeeze(stokesClearCorrect(3,[2 4 7],:,:));
    Ucloudy = squeeze(stokesCloudyCorrect(3,[2 4 7],:,:));
   
    IclearM = squeeze(stokesClearCorrect(1,3,:,:));
    IcloudyM = squeeze(stokesCloudyCorrect(1,3,:,:));
    
    IclearL = squeeze(stokesClearCorrect(1,9,:,:));
    IcloudyL = squeeze(stokesCloudyCorrect(1,9,:,:));
    
    Iclear1 = squeeze(Iclear(1,:,:));
    Iclear2 = squeeze(Iclear(2,:,:));
    Iclear3 = squeeze(Iclear(3,:,:));
    Icloudy1 = squeeze(Icloudy(1,:,:));
    Icloudy2 = squeeze(Icloudy(2,:,:));
    Icloudy3 = squeeze(Icloudy(3,:,:));
    Qclear1 = squeeze(Qclear(1,:,:));
    Qclear2 = squeeze(Qclear(2,:,:));
    Qclear3 = squeeze(Qclear(3,:,:));
    Qcloudy1 = squeeze(Qcloudy(1,:,:));
    Qcloudy2 = squeeze(Qcloudy(2,:,:));
    Qcloudy3 = squeeze(Qcloudy(3,:,:));
    Uclear1 = squeeze(Uclear(1,:,:));
    Uclear2 = squeeze(Uclear(2,:,:));
    Uclear3 = squeeze(Uclear(3,:,:));
    Ucloudy1 = squeeze(Ucloudy(1,:,:));
    Ucloudy2 = squeeze(Ucloudy(2,:,:));
    Ucloudy3 = squeeze(Ucloudy(3,:,:));
    
    
    % Reshape the matrices into a 2D
    Iclear = [Iclear1; Iclear2; Iclear3];
    Icloudy = [Icloudy1; Icloudy2; Icloudy3];
    Qclear = [Qclear1; Qclear2; Qclear3];
    Uclear = [Uclear1; Uclear2; Uclear3];
    Qcloudy = [Qcloudy1; Qcloudy2; Qcloudy3];
    Ucloudy = [Ucloudy1; Ucloudy2; Ucloudy3];
    
end

% Transpose the matrices
Iclear = Iclear';
Icloudy = Icloudy';
Qclear = Qclear';
Qcloudy = Qcloudy';
Uclear = Uclear';
Ucloudy = Ucloudy';

% IclearM = IclearM';
% IcloudyM = IcloudyM';
% 
% IclearL = IclearL';
% IcloudyL = IcloudyL';

% Create the f matrix 
% f is evenly distributed from 0 to (th) and (th) to 1.
a = rangef(1);  % Lower limit
b = rangef(2);  % Upper limit
% This function will generate a random...
% matrix of f between the ranges of [a,b].
f1 = a + (b-a).*rand(SizeDataCloudy,1); 
% f2 = th + (b-th).*rand(SizeDataCloudy/2,1);

f = [f1]';

for n = 1:SizeDataCloudy
% Mix the cloudy and clear data
I(n,:) = Iclear(n,:).*(1-f(n)) + Icloudy(n,:).*f(n);
% I1(n,:) = IclearM(n,:).*(1-f(n)) + IcloudyM(n,:).*f(n); %Wavelength 565nm
% I2(n,:) = IclearL(n,:).*(1-f(n)) + IcloudyL(n,:).*f(n); %Wavelength 1020nm
Q(n,:) = Qclear(n,:).*(1-f(n)) + Qcloudy(n,:).*f(n);
U(n,:) = Uclear(n,:).*(1-f(n)) + Ucloudy(n,:).*f(n);
end

nrows = size(I,1);
ncolumns= size(I,2);
noise = 0.01*normrnd(0,1,[nrows ncolumns]).*I;
I = I + noise;

% % For the wavelength 3
% nrows1 = size(I1,1);
% ncolumns1 = size(I1,2);
% noise1 = 0.01*normrnd(0,1,[nrows1 ncolumns1]).*I1;
% I1 = I1 + noise1;

% % For the last wavelength
% nrows2 = size(I2,1);
% ncolumns2 = size(I2,2);
% noise2 = 0.01*normrnd(0,1,[nrows2 ncolumns2]).*I2;
% I2 = I2 + noise2;


% % For only clear and cloudy cases
% I = [Iclear;Icloudy];
% Q = [Qclear; Qcloudy];
% U = [Uclear; Ucloudy];

% Polarized Intensity
Ip = squeeze(sqrt(Q.^2 + U.^2)); 

% DOLP 
DOLP1 = Ip./I; 
noiseDOLP = 0.007*normrnd(0,1,[nrows ncolumns])*DOLP1;
DOLP = DOLP1 + noiseDOLP;

% Input vector for the NN
Input = [I';DOLP';SAcloudy;vza];


%Target Definition/create vectors
%TargetClear = zeros(1,SizeDataClear);  % Clear are 0 
% TargetCloudy = ones(1,SizeDataCloudy); % Clouds are 1
% Target = [TargetClear;TargetCloudy];
% define a threshold for clear or cloudy, th = [0,1]

% th = threshold
% th < 0.3 is cloudy =1 and th > 0.3 is clear =0
for i = 1:length(f)
    if f(i) > th
        Target(i) = 1; % Cloudy
    else
        Target(i) = 0; % Clear
    end
end

Target = Target';

% Test Plot
% figure
% plot(vza,Iclear(:,1),vza,Icloudy(:,1),vza,I(:,1))
% figure
% plot(vza,Uclear(:,1),vza,Ucloudy(:,1),vza,U(:,1))
% figure
% plot(vza,Qclear(:,1),vza,Qcloudy(:,1),vza,Q(:,1))
% hold on 

end