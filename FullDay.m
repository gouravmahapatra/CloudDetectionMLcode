%% Function to form the input vectors for the whole day of satellite data
% and compute the output from the neural network.

%function [OutputReal,PLN,PCN,Z] = FullDay()
clear all
clc

Z = zeros(3240,6480);
Zradiance = zeros(3240,6480);

ZR = zeros(3240,6480);
ZG = zeros(3240,6480);
ZB = zeros(3240,6480);

Zdolp = zeros(3240,6480);
Zsa = zeros(3240,6480);

load('net_Final.mat');

[InputActual1, PLN1, PCN1, I1020, I490, I670, I865, DOLP, SAdeg] = DataVecForm('P3L1TBG1028205MD.h5');
OutputReal1 = net_Final(InputActual1);
OutputReal1 = 1./(1+exp(-OutputReal1));
IR = mean(abs(I490 - I1020),2);
IG = mean(abs(I490 - I865),2);
IB = mean(abs(I490 - I670),2);
for i = 1:length(PLN1)
    Z(PLN1(i),PCN1(i)) = OutputReal1(i);
    Zradiance(PLN1(i),PCN1(i)) = I1020(i,7);
    ZB(PLN1(i),PCN1(i)) = IB(i);
    ZG(PLN1(i),PCN1(i)) = IG(i);
    ZR(PLN1(i),PCN1(i)) = IR(i);
%   Zdolp(PLN1(i),PCN1(i)) = DOLP(7,i);
%   Zsa(PLN1(i),PCN1(i)) = SAdeg(7,i);
end
clearvars InputActual1 PLN1 PCN1 I490 I670 I865 I1020 IR IG IB;


% [InputActual2, PLN2, PCN2, I1020, I490, I670, I865, DOLP, SAdeg] = DataVecForm('P3L1TBG1028206MD.h5');
% OutputReal2 = net_Final(InputActual2);
% OutputReal2 = 1./(1+exp(-OutputReal2));
% IR = mean(abs(I490 - I1020),2);
% IG = mean(abs(I490 - I865),2);
% IB = mean(abs(I490 - I670),2);
% for i = 1:length(PLN2)
%     Z(PLN2(i),PCN2(i)) = OutputReal2(i);
%     Zradiance(PLN2(i),PCN2(i)) = I1020(i,7);
%     ZB(PLN2(i),PCN2(i)) = IB(i);
%     ZG(PLN2(i),PCN2(i)) = IG(i);
%     ZR(PLN2(i),PCN2(i)) = IR(i);
% end
% clearvars InputActual2 PLN2 PCN2 I490 I670 I865 I1020 IR IG IB;
% 
% 
% [InputActual3, PLN3, PCN3, I1020, I490, I670, I865, DOLP, SAdeg] = DataVecForm('P3L1TBG1028207MD.h5');
% OutputReal3 = net_Final(InputActual3);
% OutputReal3 = 1./(1+exp(-OutputReal3));
% IR = mean(abs(I490 - I1020),2);
% IG = mean(abs(I490 - I865),2);
% IB = mean(abs(I490 - I670),2);
% for i = 1:length(PLN3)
%     Z(PLN3(i),PCN3(i)) = OutputReal3(i);
%     Zradiance(PLN3(i),PCN3(i)) = I1020(i,7);
%     ZB(PLN3(i),PCN3(i)) = IB(i);
%     ZG(PLN3(i),PCN3(i)) = IG(i);
%     ZR(PLN3(i),PCN3(i)) = IR(i);
% end
% clearvars InputActual3 PLN3 PCN3 I490 I670 I865 I1020 IR IG IB;


% [InputActual4, PLN4, PCN4, I1020, I490, I670, I865, DOLP, SAdeg] = DataVecForm('P3L1TBG1028208MD.h5');
% OutputReal4 = net_Final(InputActual4);
% OutputReal4 = 1./(1+exp(-OutputReal4));
% IR = mean(abs(I490 - I1020),2);
% IG = mean(abs(I490 - I865),2);
% IB = mean(abs(I490 - I670),2);
% for i = 1:length(PLN4)
%     Z(PLN4(i),PCN4(i)) = OutputReal4(i);
%     Zradiance(PLN4(i),PCN4(i)) = I1020(i,7);
%     ZB(PLN4(i),PCN4(i)) = IB(i);
%     ZG(PLN4(i),PCN4(i)) = IG(i);
%     ZR(PLN4(i),PCN4(i)) = IR(i);
% end
% clearvars InputActual4 PLN4 PCN4 I490 I670 I865 I1020 IR IG IB;


[InputActual5, PLN5, PCN5, I1020, I490, I670, I865, DOLP, SAdeg] = DataVecForm('P3L1TBG1028209MD.h5');
OutputReal5 = net_Final(InputActual5);
OutputReal5 = 1./(1+exp(-OutputReal5));
IR = mean(abs(I490 - I1020),2);
IG = mean(abs(I490 - I865),2);
IB = mean(abs(I490 - I670),2);
for i = 1:length(PLN5)
    Z(PLN5(i),PCN5(i)) = OutputReal5(i);
    Zradiance(PLN5(i),PCN5(i)) = I1020(i,7);
    ZB(PLN5(i),PCN5(i)) = IB(i);
    ZG(PLN5(i),PCN5(i)) = IG(i);
    ZR(PLN5(i),PCN5(i)) = IR(i);
end
clearvars InputActual5 PLN5 PCN5 I490 I670 I865 I1020 IR IG IB;


[InputActual6, PLN6, PCN6, I1020, I490, I670, I865, DOLP, SAdeg] = DataVecForm('P3L1TBG1028210MD.h5');
OutputReal6 = net_Final(InputActual6);
OutputReal6 = 1./(1+exp(-OutputReal6));
IR = mean(abs(I490 - I1020),2);
IG = mean(abs(I490 - I865),2);
IB = mean(abs(I490 - I670),2);
for i = 1:length(PLN6)
    Z(PLN6(i),PCN6(i)) = OutputReal6(i);
    Zradiance(PLN6(i),PCN6(i)) = I1020(i,7);
    ZB(PLN6(i),PCN6(i)) = IB(i);
    ZG(PLN6(i),PCN6(i)) = IG(i);
    ZR(PLN6(i),PCN6(i)) = IR(i);
end
clearvars InputActual6 PLN6 PCN6 I490 I670 I865 I1020 IR IG IB;


[InputActual7, PLN7, PCN7, I1020, I490, I670, I865, DOLP, SAdeg] = DataVecForm('P3L1TBG1028211MD.h5');
OutputReal7 = net_Final(InputActual7);
OutputReal7 = 1./(1+exp(-OutputReal7));
IR = mean(abs(I490 - I1020),2);
IG = mean(abs(I490 - I865),2);
IB = mean(abs(I490 - I670),2);
for i = 1:length(PLN7)
    Z(PLN7(i),PCN7(i)) = OutputReal7(i);
    Zradiance(PLN7(i),PCN7(i)) = I1020(i,7);
    ZB(PLN7(i),PCN7(i)) = IB(i);
    ZG(PLN7(i),PCN7(i)) = IG(i);
    ZR(PLN7(i),PCN7(i)) = IR(i);
end
clearvars InputActual7 PLN7 PCN7 I490 I670 I865 I1020 IR IG IB;


[InputActual8, PLN8, PCN8, I1020, I490, I670, I865, DOLP, SAdeg] = DataVecForm('P3L1TBG1028212MD.h5');
OutputReal8 = net_Final(InputActual8);
OutputReal8 = 1./(1+exp(-OutputReal8));
IR = mean(abs(I490 - I1020),2);
IG = mean(abs(I490 - I865),2);
IB = mean(abs(I490 - I670),2);
for i = 1:length(PLN8)
    Z(PLN8(i),PCN8(i)) = OutputReal8(i);
    Zradiance(PLN8(i),PCN8(i)) = I1020(i,7);
    ZB(PLN8(i),PCN8(i)) = IB(i);
    ZG(PLN8(i),PCN8(i)) = IG(i);
    ZR(PLN8(i),PCN8(i)) = IR(i);
end
clearvars InputActual8 PLN8 PCN8 I490 I670 I865 I1020 IR IG IB;


[InputActual9, PLN9, PCN9, I1020, I490, I670, I865, DOLP, SAdeg] = DataVecForm('P3L1TBG1028213MD.h5');
OutputReal9 = net_Final(InputActual9);
OutputReal9 = 1./(1+exp(-OutputReal9));
IR = mean(abs(I490 - I1020),2);
IG = mean(abs(I490 - I865),2);
IB = mean(abs(I490 - I670),2);
for i = 1:length(PLN9)
    Z(PLN9(i),PCN9(i)) = OutputReal9(i);
    Zradiance(PLN9(i),PCN9(i)) = I1020(i,7);
    ZB(PLN9(i),PCN9(i)) = IB(i);
    ZG(PLN9(i),PCN9(i)) = IG(i);
    ZR(PLN9(i),PCN9(i)) = IR(i);
end
clearvars InputActual9 PLN9 PCN9 I490 I670 I865 I1020 IR IG IB;


[InputActual10, PLN10, PCN10, I1020, I490, I670, I865, DOLP, SAdeg] = DataVecForm('P3L1TBG1028214MD.h5');
OutputReal10 = net_Final(InputActual10);
OutputReal10 = 1./(1+exp(-OutputReal10));
IR = mean(abs(I490 - I1020),2);
IG = mean(abs(I490 - I865),2);
IB = mean(abs(I490 - I670),2);
for i = 1:length(PLN10)
    Z(PLN10(i),PCN10(i)) = OutputReal10(i);
    Zradiance(PLN10(i),PCN10(i)) = I1020(i,7);
    ZB(PLN10(i),PCN10(i)) = IB(i);
    ZG(PLN10(i),PCN10(i)) = IG(i);
    ZR(PLN10(i),PCN10(i)) = IR(i);
end
clearvars InputActual10 PLN10 PCN10 I490 I670 I865 I1020 IR IG IB;


[InputActual11, PLN11, PCN11, I1020, I490, I670, I865, DOLP, SAdeg] = DataVecForm('P3L1TBG1028215MD.h5');
OutputReal11 = net_Final(InputActual11);
OutputReal11 = 1./(1+exp(-OutputReal11));
IR = mean(abs(I490 - I1020),2);
IG = mean(abs(I490 - I865),2);
IB = mean(abs(I490 - I670),2);
for i = 1:length(PLN11)
    Z(PLN11(i),PCN11(i)) = OutputReal11(i);
    Zradiance(PLN11(i),PCN11(i)) = I1020(i,7);
    ZB(PLN11(i),PCN11(i)) = IB(i);
    ZG(PLN11(i),PCN11(i)) = IG(i);
    ZR(PLN11(i),PCN11(i)) = IR(i);
end
clearvars InputActual11 PLN11 PCN11 I490 I670 I865 I1020 IR IG IB;


[InputActual12, PLN12, PCN12, I1020, I490, I670, I865, DOLP, SAdeg] = DataVecForm('P3L1TBG1028216MD.h5');
OutputReal12 = net_Final(InputActual12);
OutputReal12 = 1./(1+exp(-OutputReal12));
IR = mean(abs(I490 - I1020),2);
IG = mean(abs(I490 - I865),2);
IB = mean(abs(I490 - I670),2);
for i = 1:length(PLN12)
    Z(PLN12(i),PCN12(i)) = OutputReal12(i);
    Zradiance(PLN12(i),PCN12(i)) = I1020(i,7);
    ZB(PLN12(i),PCN12(i)) = IB(i);
    ZG(PLN12(i),PCN12(i)) = IG(i);
    ZR(PLN12(i),PCN12(i)) = IR(i);
end
clearvars InputActual12 PLN12 PCN12 I490 I670 I865 I1020 IR IG IB;


[InputActual13, PLN13, PCN13, I1020, I490, I670, I865, DOLP, SAdeg] = DataVecForm('P3L1TBG1028217MD.h5');
OutputReal13 = net_Final(InputActual13);
OutputReal13 = 1./(1+exp(-OutputReal13));
IR = mean(abs(I490 - I1020),2);
IG = mean(abs(I490 - I865),2);
IB = mean(abs(I490 - I670),2);
for i = 1:length(PLN13)
    Z(PLN13(i),PCN13(i)) = OutputReal13(i);
    Zradiance(PLN13(i),PCN13(i)) = I1020(i,7);
    ZB(PLN13(i),PCN13(i)) = IB(i);
    ZG(PLN13(i),PCN13(i)) = IG(i);
    ZR(PLN13(i),PCN13(i)) = IR(i);
end
clearvars InputActual13 PLN13 PCN13 I490 I670 I865 I1020 IR IG IB;


[InputActual14, PLN14, PCN14, I1020, I490, I670, I865, DOLP, SAdeg] = DataVecForm('P3L1TBG1028218MD.h5');
OutputReal14 = net_Final(InputActual14);
OutputReal14 = 1./(1+exp(-OutputReal14));
IR = mean(abs(I490 - I1020),2);
IG = mean(abs(I490 - I865),2);
IB = mean(abs(I490 - I670),2);
for i = 1:length(PLN14)
    Z(PLN14(i),PCN14(i)) = OutputReal14(i);
    Zradiance(PLN14(i),PCN14(i)) = I1020(i,7);
    ZB(PLN14(i),PCN14(i)) = IB(i);
    ZG(PLN14(i),PCN14(i)) = IG(i);
    ZR(PLN14(i),PCN14(i)) = IR(i);
end
clearvars InputActual14 PLN14 PCN14 I490 I670 I865 I1020 IR IG IB;


Z3D(:,:,1) = ZR;
Z3D(:,:,2) = ZG;
Z3D(:,:,3) = ZB;


% OutputReal = [OutputReal1,OutputReal2,OutputReal3,OutputReal4,OutputReal5,...
% OutputReal6,OutputReal7,OutputReal8,OutputReal9,OutputReal10,OutputReal11,...
% OutputReal2,OutputReal3,OutputReal4];

%PLN = [PLN1',PLN2',PLN3',PLN4',PLN5',PLN6',PLN7',PLN8',PLN9',PLN10',PLN11',PLN12',PLN13',...
%   PLN14'];

%PCN = [PCN1',PCN2',PCN3',PCN4',PCN5',PCN6',PCN7',PCN8',PCN9',PCN10',PCN11',PCN12',PCN13',...
%    PCN14'];

% for i = 1:length(PLN)
%     Z(PLN(i),PCN(i)) = OutputReal(i);    
% end

%end