%%
% SOM sample plots indexing to find which neurons corresponds to what data

output = importdata('SOMoutputDataAllIntensity&DOLP.mat');

% Check for no. of cloudy datas in each neuron 
N1 = Target(output(1,:)==1);
N2 = Target(output(2,:)==1);
N3 = Target(output(3,:)==1);
N4 = Target(output(4,:)==1);
N5 = Target(output(5,:)==1);
N6 = Target(output(6,:)==1);
N7 = Target(output(7,:)==1);
N8 = Target(output(8,:)==1);
N9 = Target(output(9,:)==1);

% Count the no. of cloudy data in each neuron 
y1=length(N1(N1==1));
y2=length(N2(N2==1));
y3=length(N3(N3==1));
y4=length(N4(N4==1));
y5=length(N5(N5==1));
y6=length(N6(N6==1));
y7=length(N7(N7==1));
y8=length(N8(N8==1));
y9=length(N9(N9==1));
Cloudy = [y1,y2,y3,y4,y5,y6,y7,y8,y9]

% Count the no. of clear data in each neuron 
z1=length(N1(N1==0));
z2=length(N2(N2==0));
z3=length(N3(N3==0));
z4=length(N4(N4==0));
z5=length(N5(N5==0));
z6=length(N6(N6==0));
z7=length(N7(N7==0));
z8=length(N8(N8==0));
z9=length(N9(N9==0));
Clear = [z1,z2,z3,z4,z5,z6,z7,z8,z9]
x=[1:9];
figure
plot(x,Cloudy,'or',x,Clear,'ob')
xlabel('Neurons')
ylabel('Data')
legend('Red = Cloudy','Blue = Clear')


%% to plot the data in a better way
% Cloudy data
xploty1 = (1.3 - 0.7).*rand(y1,1) + 0.7;
yploty1 = (1.3 - 0.7).*rand(y1,1) + 0.7;

xploty2 = (2.3 - 1.7).*rand(y2,1) + 1.7;
yploty2 = (1.3 - 0.7).*rand(y2,1) + 0.7;

xploty3 = (3.3 - 2.7).*rand(y3,1) + 2.7;
yploty3 = (1.3 - 0.7).*rand(y3,1) + 0.7;

xploty4 = (1.3 - 0.7).*rand(y4,1) + 0.7;
yploty4 = (2.3 - 1.7).*rand(y4,1) + 1.7;

xploty5 = (2.3 - 1.7).*rand(y5,1) + 1.7;
yploty5 = (2.3 - 1.7).*rand(y5,1) + 1.7;

xploty6 = (3.3 - 2.7).*rand(y6,1) + 2.7;
yploty6 = (2.3 - 1.7).*rand(y6,1) + 1.7;

xploty7 = (1.3 - 0.7).*rand(y7,1) + 0.7;
yploty7 = (3.3 - 2.7).*rand(y7,1) + 2.7;

xploty8 = (2.3 - 1.7).*rand(y8,1) + 1.7;
yploty8 = (3.3 - 2.7).*rand(y8,1) + 2.7;

xploty9 = (3.3 - 2.7).*rand(y9,1) + 2.7;
yploty9 = (3.3 - 2.7).*rand(y9,1) + 2.7;


% clear data
xplotz1 = (1.3 - 0.7).*rand(z1,1) + 0.7;
yplotz1 = (1.3 - 0.7).*rand(z1,1) + 0.7;

xplotz2 = (2.3 - 1.7).*rand(z2,1) + 1.7;
yplotz2 = (1.3 - 0.7).*rand(z2,1) + 0.7;

xplotz3 = (3.3 - 2.7).*rand(z3,1) + 2.7;
yplotz3 = (1.3 - 0.7).*rand(z3,1) + 0.7;

xplotz4 = (1.3 - 0.7).*rand(z4,1) + 0.7;
yplotz4 = (2.3 - 1.7).*rand(z4,1) + 1.7;

xplotz5 = (2.3 - 1.7).*rand(z5,1) + 1.7;
yplotz5 = (2.3 - 1.7).*rand(z5,1) + 1.7;

xplotz6 = (3.3 - 2.7).*rand(z6,1) + 2.7;
yplotz6 = (2.3 - 1.7).*rand(z6,1) + 1.7;

xplotz7 = (1.3 - 0.7).*rand(z7,1) + 0.7;
yplotz7 = (3.3 - 2.7).*rand(z7,1) + 2.7;

xplotz8 = (2.3 - 1.7).*rand(z8,1) + 1.7;
yplotz8 = (3.3 - 2.7).*rand(z8,1) + 2.7;

xplotz9 = (3.3 - 2.7).*rand(z9,1) + 2.7;
yplotz9 = (3.3 - 2.7).*rand(z9,1) + 2.7;




figure
axis([0 5 0 5])
plot(xploty1,yploty1,'xr',xploty2,yploty2,'xr',xploty3,yploty3,'xr',xploty4,yploty4,...
    'xr',xploty5,yploty5,'xr',xploty6,yploty6,'xr',xploty7,yploty7,'xr',xploty8,yploty8,'xr',xploty9,yploty9,'xr')
hold on 
plot(xplotz1,yplotz1,'ob',xplotz2,yplotz2,'ob',xplotz3,yplotz3,'ob',xplotz4,yplotz4,...
    'ob',xplotz5,yplotz5,'ob',xplotz6,yplotz6,'ob',xplotz7,yplotz7,'ob',xplotz8,yplotz8,'ob',xplotz9,yplotz9,'ob')
xlabel('Neuron No.')
ylabel('Neuron No.')
title('Graph showing the separation of Cloudy vs. Clear data using SOM (3x3) NeuralNet')
legend('Red = Cloudy','Blue = Clear')
hold off