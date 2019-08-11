function [ logA] = logA( A)
% A is in vector form i.e. A=[A1;A2;...:An]
% find exponential map of A;
% Input     A = [1 U 0;0 V 0;0 0 1] in 3D;
% Output logA = [0 u 0;0 v 0;0 0 1] in 3D

n=size(A,2);

if n==4
    A=vec2mat(A,16);
    A=vec2mat(A(:,[1 2 3 5 6 7 9 10 11]),3);
end




matA=vec2mat(A,9); %for 3D
nf=size(matA,1);
U=matA(:,2);
V=matA(:,5);

% v=log(V);
v=real(log(V));
V_one=double(V==1);
V_not_one=double(V~=1);

%check
V=V+100*V_one;
u1=(U.*v)./(V-1);


u=V_one.*U +V_not_one.*u1;

logA=[zeros(nf,1) u zeros(nf,1) zeros(nf,1) v zeros(nf,1) zeros(nf,1) zeros(nf,1) ones(nf,1) ];
logA=vec2mat(logA,3);

if n==4
    logA=vec2mat([vec2mat([logA,zeros(3*nf,1)],12), zeros(nf,3) ones(nf,1)],4);
end


end

