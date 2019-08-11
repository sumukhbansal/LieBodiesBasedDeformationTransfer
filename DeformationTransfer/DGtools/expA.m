function [ expA] = expA( A)
% A is in vector form i.e. A=[A1;A2;...:An]
% find exponential map of A;
% Input A : [0 u 0;0 v 0;0 0 1] in 3D;
% Output expA=[1 U 0;0 V 0;0 0 1] in 3D

n=size(A,2);

if n==4
    A=vec2mat(A,16);
    A=vec2mat(A(:,[1 2 3 5 6 7 9 10 11]),3);
end

matA=vec2mat(A,9); %for 3D
nf=size(matA,1);
u=matA(:,2);
v=matA(:,5);

V1=exp(v);
U1=(exp(v)-1).*(u./v);

% v_zero=double(v==0);
% v_not_zero=double(v~=0);
% U=v_zero.*u + v_not_zero.*U1;
% V=v_zero.*1 + v_not_zero.*V1;

U=U1;
V=V1;

v_zero=find(v==0);
U(v_zero)=u(v_zero);
V(v_zero)=1; 


expA=[ones(nf,1) U zeros(nf,1) zeros(nf,1) V zeros(nf,1) zeros(nf,1) zeros(nf,1) ones(nf,1) ];
expA=vec2mat(expA,3);

if n==4
    expA=vec2mat([vec2mat([expA,zeros(3*nf,1)],12), zeros(nf,3) ones(nf,1)],4);
end

end

