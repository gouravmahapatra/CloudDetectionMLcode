% Solve a Clustering Problem with a Self-Organizing Map
% Script generated by NCTOOL
% Created Thu Sep 03 15:17:58 CEST 2015
%
% This script assumes these variables are defined:
%
%   Input - input data.

inputs = Input';

% Create a Self-Organizing Map
% SOM topology
dimension1 = 3;
dimension2 = 3;
net = selforgmap([dimension1 dimension2]);

% Train the Network
[net,tr] = train(net,inputs);

% Test the Network
output = net(inputs);


% View the Network
% view(net)

% Plots
% Uncomment these lines to enable various plots.
% figure, plotsomtop(net)
% figure, plotsomnc(net)
% figure, plotsomnd(net)
% figure, plotsomplanes(net)
% figure, plotsomhits(net,inputs)
% figure, plotsompos(net,inputs)
