function [ V, F ] = load_data( filename )
% Read point cloud data or mesh data.
[~,~,ext] = fileparts(filename);
switch ext
    case '.ply'
        [V,F] = read_ply(filename);
    case '.obj'
        [V,F] = readOBJfast(filename);
    case '.off'
        [V,F,~,~,~] = readOFF( filename );
    case '.mat'
        load(filename);
        if isfield(surface,'V')
            V=surface.V;
        else
            V=[surface.X surface.Y surface.Z];
        end
        
        if isfield(surface,'TRI')
            F=surface.TRI;
        elseif isfield(surface,'TRIV')
            F=surface.TRIV;
        elseif isfield(surface,'F')
            F=surface.F;
        else
            F=[];
        end
        close all;
    case '.txt'
        V=importdata(filename);
        F=[];
    otherwise
        disp('invalid file extension');
end

end

