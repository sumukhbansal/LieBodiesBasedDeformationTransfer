function [R,A,S]=Compute_RAS(PV,QV,F)
%% Compute deformation triplet (R A S) for initial pose P to final pose Q.
[PEdge1,PEdge2]=ComputeEdges(PV,F);
[QEdge1,QEdge2]=ComputeEdges(QV,F);

%% Convert all triangles into [o v1 v2] form.
% translate both poses P, Q to origin.
% [P,tP]=Translate2Origin(P);
% [Q,tQ]=Translate2Origin(Q);

%% Compute canonical rotation matrix for both poses
Rp=ComputeCanonicalRotation(PEdge1,PEdge2);
Rq=ComputeCanonicalRotation(QEdge1,QEdge2);

% apply canonical rotation on edges of both poses.
PE1=ApplyTransformation(Rp,PEdge1);
PE2=ApplyTransformation(Rp,PEdge2);
QE1=ApplyTransformation(Rq,QEdge1);
QE2=ApplyTransformation(Rq,QEdge2); 

%% Find scale and Affine transformation for pairs of triangle for set of poses.
% S is scale for P to Q
S=QE1(:,1)./PE1(:,1);

%% Afine Transformation
% A=[1 U;0 V] in 2D
% A=[1 U 0;0 V 0;0 0 1] in 3D
% find U V for each pose as given in  the paper.

PE1=PE1.*repmat(S,1,3);
PE2=PE2.*repmat(S,1,3);



V=QE2(:,2)./PE2(:,2);
U=(QE2(:,1)-PE2(:,1))./PE2(:,2);
nf=size(F,1);
A=[ones(nf,1) U zeros(nf,1) zeros(nf,1) V zeros(nf,1) zeros(nf,1) zeros(nf,1) ones(nf,1) ];
A=vec2mat(A,3);
% AS=A.*repmat(S,1,9);
% AS=vec2mat(AS,3);
%% Check the final transformation
% RpT=transpose_mat(Rp);
RqT=transposeMatrix(Rq);
R=CompositionOfTransformation(RqT,Rp);

end

