% Solve a Pattern Recognition Problem with a Neural Network
% Script generated by NPRTOOL
% Created Mon Sep 07 13:23:13 CEST 2015
%
% This script assumes these variables are defined:
%
%   Input - input data.
%   Target - target data.

% clc
% clear all
% close all
% 
% % Define the wavelength(or all) for a single or all wavelengths.
% % wn = wavelength no. or pass a string to execute all
% % rangef = range of values for f
% % th = the threshold for determining whether the data is cloudy or clear 
% % This function stores the data to be used 
% 
% wn = 'all';
% th = 0.05;
% rangef = [0 1];
% [inputs,Target,f] = NNdatafun(wn,th,rangef);
% 
inputs = Input;
targets = f;

% Create a Pattern Recognition Network
hiddenLayerSize = 10;
net = patternnet(hiddenLayerSize);
% Setting up the transfer function 
net.layers{1}.transferFcn = 'tansig'; %'logsig'


% To display the training parameter window
net.trainParam.showWindow = false; %Training window
net.trainParam.showCommandLine = true; %Commandline display
net.trainParam.show = 35; %Epochs after which the status is displayed

% Choose Input and Output Pre/Post-Processing Functions
% For a list of all processing functions type: help nnprocess
net.inputs{1}.processFcns = {'removeconstantrows','mapminmax'};
net.outputs{2}.processFcns = {'removeconstantrows','mapminmax'};


% Setup Division of Data for Training, Validation, Testing
% For a list of all data division functions type: help nndivide
net.divideFcn = 'dividerand';  % Divide data randomly
net.divideMode = 'sample';  % Divide up every sample
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

% For help on training function 'trainlm' type: help trainlm
% For a list of all training functions type: help nntrain
net.trainFcn = 'trainscg';  % SCG algorithm

% Choose a Performance Function
% For a list of all performance functions type: help nnperformance
net.performFcn = 'mse';  % Mean squared error

% Choose Plot Functions
% For a list of all plot functions type: help nnplot
net.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
  'plotregression', 'plotfit'};


% Train the Network
[net,tr] = train(net,inputs,targets);

% Test the Network
outputs = net(inputs);
errors = gsubtract(targets,outputs);
performance = perform(net,targets,outputs)

% Recalculate Training, Validation and Test Performance
trainTargets = targets .* tr.trainMask{1};
valTargets = targets  .* tr.valMask{1};
testTargets = targets  .* tr.testMask{1};
trainPerformance = perform(net,trainTargets,outputs)
valPerformance = perform(net,valTargets,outputs)
testPerformance = perform(net,testTargets,outputs)


rmsError = sqrt(mean((outputs-f).^2));
% View the Network
%view(net)

% Plots
% Uncomment these lines to enable various plots.
%figure, plotperform(tr)
%figure, plottrainstate(tr)
%figure, plotconfusion(targets,outputs)
%figure, ploterrhist(errors)
