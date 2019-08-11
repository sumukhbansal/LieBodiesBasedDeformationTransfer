% function Rcanonical=ComputeCanonicalRotation(PEdge1,PEdge2)
% % Compute the canonical rotation matrix for each triangle in P.
% % 1. Rx: align Edge1 to X axis.
% % 2. Rz: align normal=Edge1 x Edge2 of the triangle to Z axis.
% % 3. multiply both the matrix to get R = Rz*Rx;
% 
% 
% % unit edge vectors
% E1=NormalizeVector(PEdge1);
% E2=NormalizeVector(PEdge2);
% 
% sz=size(E1,1);
% % X axis and Z axis
% X=[ones(sz,1),zeros(sz,2)];
% Z=[zeros(sz,2),ones(sz,1)];
% 
% 
% % % normals of triangles
% % E1xE2=NormalizeVector(cross(E1,E2,2));
% 
% [ rE1 ] = RotationVec3D( E1,X );
% [ RE1 ] = RotationVec2RotationMat( rE1 );
% 
% % Apply RE1 to align triangles with X axis
% E1=ApplyTransformation(RE1,E1);
% E2=ApplyTransformation(RE1,E2);
% 
% % normals of triangles aligned with X axis
% E1xE2=NormalizeVector(cross(E1,E2,2));
% 
% % find Rotation between E1xE2 and Z axis
% [ rE1xE2 ] = RotationVec3D( E1xE2,Z );
% [ RE1xE2 ] = RotationVec2RotationMat( rE1xE2 );
% 
% % find compsition Rcanonical RE1xE2*RE1
% Rcanonical=CompositionOfTransformation(RE1xE2,RE1);
% 
% 
% end



function Rcanonical=ComputeCanonicalRotation(PEdge1,PEdge2)
% Compute the canonical SE3 for each triangle in P.
% 1. Rx: align Edge1 to X axis.
% 2. Rz: align normal=Edge1 x Edge2 of the triangle to Z axis.
% 3. multiply both the matrix to get R = Rz*Rx;

% unit edge vectors
E1=NormalizeVector(PEdge1);
E2=NormalizeVector(PEdge2);


E1_x_E2=NormalizeVector(cross(E1,E2,2));

ABt=[vec2mat(E1,1),zeros(size(E1,1)*3,1),vec2mat(E1_x_E2,1)];

Rcanonical=zeros(size(ABt));

for i=1:size(E1,1)
    [u,~,v]=svd(ABt(3*(i-1)+1:3*(i-1)+3,:));
    d=[1 0 0;0 1 0;0 0 det(v*u')];
    Rcanonical(3*(i-1)+1:3*(i-1)+3,:)=v*d*u';
end

end



