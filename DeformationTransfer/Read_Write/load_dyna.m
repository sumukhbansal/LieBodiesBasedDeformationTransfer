clear ;
close all;
clc;

%%
addpath('dyna_scripts');
% To get info of the dataset use following
% h5disp('dyna_dataset_m.h5')
% [verts,faces]=load_dyna_dataset('dyna_dataset_m.h5','50027','running_on_spot','./',false);
idx='50027';%'50027';50002_
% one_leg_jump
% one_leg_loose
% hips
% jiggle_on_toes
% jumping_jacks
% shake_hips
% shake_shoulders
% shake_arms
% running_on_spot
% light_hopping_stiff
% punching
% faces
% knees
action= 'hips';%%'running_on_spot';
[verts,faces]=load_dyna_dataset('dyna_dataset_m.h5',idx,action,'./',false);
visualize_mesh_sequence(verts,faces);

%%
% for i=55:10:99
%     filename=strcat('000',num2str(i),'.obj');
%     [V,F]=load_data(filename);
%     display_mesh(V,F,'mesh','r'); hold on;
% end
% 
% for i=100:10:110
%     filename=strcat('00',num2str(i),'.obj');
%     [V,F]=load_data(filename);
%     display_mesh(V,F,'mesh','r'); hold on;
% end

