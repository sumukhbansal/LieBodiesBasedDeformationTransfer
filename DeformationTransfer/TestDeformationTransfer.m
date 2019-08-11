% Results Deformation transfer ICVGIP paper
close all;
clear all;
clc;
%% Path
addpath(genpath('Read_Write'));
addpath(genpath('LieGroupRep'));
addpath(genpath('DGtools'));
%% Experiment 2.2: DT without markers for For Kids data

% Load Reference meshes 
[P1,Fp]=load_data('0001.null.0.off');
[Q1,Fq]=load_data('0002.null.0.off');

% Load Example mesh for source
[P2,~]=load_data('0001.isometry.2.off');

% Output mesh for target 
Yc=DeformationTransfer(P1,P2,Fp,Q1,Fq,'RAS');
