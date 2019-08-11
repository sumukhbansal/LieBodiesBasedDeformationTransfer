% Load mesh from .off or .obj or .mat file in form of X,Y,Z and TRI
%
% [M] = load_mesh(filename1,filename2,...)
% [V,F] = load_mesh(filename,'ParameterName',ParameterValue, ...)
%
% Input:
%   filename  file holding mesh
%   Optional:
%     'Quiet' followed by whether to be quiet {false}
% Output:
%


function [ M ] = Load_Mesh( varargin )
M={};
for i=1:nargin
    M{i}=read_mesh(varargin{i});
    
end
end

function [m] = read_mesh(filename)
[~,~,ext] = fileparts(filename);
ext = lower(ext);
switch ext
    case '.mat'
        t=load(filename);
        m=t.surface; %default mesh name for .mat file is surface
    case '.off'
        [V,F] = readOFF(filename);
        m.X=V(:,1);
        m.Y=V(:,2);
        m.Z=V(:,3);
        m.TRIV=F;
    case '.ply'
        [V,F] = readPLY(filename);
        m.X=V(:,1);
        m.Y=V(:,2);
        m.Z=V(:,3);
        m.TRIV=F;
    case '.stl'
        [V,F] = readSTL(filename);
        m.X=V(:,1);
        m.Y=V(:,2);
        m.Z=V(:,3);
        m.TRIV=F;
    case '.wrl'
        [V,F] = readWRL(filename);
        m.X=V(:,1);
        m.Y=V(:,2);
        m.Z=V(:,3);
        m.TRIV=F;
    case '.obj'
%         try
%             [V,F] = readOBJfast(filename);
%         catch exception
%             [V,F] = readOBJ(filename);
%         end
        [V,F] = readOBJ(filename);
        m.X=V(:,1);
        m.Y=V(:,2);
        m.Z=V(:,3);
        m.TRIV=F;
    otherwise
        error('Unknown mesh format: %s',ext);
end
end