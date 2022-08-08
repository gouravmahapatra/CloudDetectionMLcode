%% Program to view the NN output

Z = zeros(3240,6480);
% Z490 = zeros(3240,6480);
% Z670 = zeros(3240,6480);
% Z865 = zeros(3240,6480);
% ZB = zeros(3240,6480);
% ZG = zeros(3240,6480);
% ZR = zeros(3240,6480);
Zrad = zeros(3240,6480);



for i = 1:length(PLN)
    Z(PLN(i),PCN(i)) = Output(i);
    Zrad(PLN(i),PCN(i)) = I670(i,10);
%      ZB(PLN(i),PCN(i)) = IB(i,10);
% %     Z670(PLN1(i),PCN1(i)) = Ip670(i,10);
% %     Z865(PLN1(i),PCN1(i)) = Ip865(i,10); 
%     ZG(PLN(i),PCN(i)) = IG(i,10);
%     ZR(PLN(i),PCN(i)) = IR(i,10);
end



% Z = [[ZR];[ZG];[ZB]];


% refvec = [18 90 -180];
% figure
% axesm sinusoid
% geoshow(Z,refvec,'DisplayType','Image')
% colormap(gray(256))
% load coast
% plotm(lat,long,'w')
% gridm
% framem