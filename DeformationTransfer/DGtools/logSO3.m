function [ logR ] = logSO3( R )
% find exponential map of an element in SO3.
% ln(R) = (θ/(2 sin θ)) (R − R')
% cos θ =(tr(R) − 1)/2
% ω = [ln(R)]▽
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

matR=vec2mat(R,9);
traceR=sum(matR(:,[1 5 9]),2);

% changed while Re-implementing
% traceR_is_3=find(traceR<3);
% traceR(traceR_is_3)=3;

nf=size(matR,1);
% theta=norm(acos(((traceR-1)/2)));
theta=acos(((traceR-1)/2));
% theta=acos(max(-.9999,((traceR-1)/2)));
theta_is_0=double(abs(theta)<.0000001);
idx=find(theta_is_0);

A=sin(theta)./theta;

A(idx,:)=1; 


logR=repmat(1./(2*A),1,9).*vec2mat(R-transposeMatrix(R),9);

R_is_I=sum(abs(logR),2)<.0000001;
idx1=find(R_is_I);
W=.0001*[zeros(nf,1) -ones(nf,1) ones(nf,1) ones(nf,1) zeros(nf,1) -ones(nf,1) -ones(nf,1) ones(nf,1) zeros(nf,1)];
logR(idx1,:)=W(idx1,:); 
logR=vec2mat(logR,3);

% 
% matR=vec2mat(R,9);
% 
% % To check is R=I;
% nf=size(matR,1);
% % I=[ones(nf,1) zeros(nf,1) zeros(nf,1) zeros(nf,1) ones(nf,1) zeros(nf,1) zeros(nf,1) zeros(nf,1) ones(nf,1)];
% I=[ones(nf,1) ones(nf,1) ones(nf,1)];
% R_is_I=double(all((matR(:,[1 5 9]) <1.0001*I & matR(:,[1 5 9]) >.9999*I) ,2));
% 
% idx=find(R_is_I);
% % for R=I, W is arbitrary we choose W=[0 -1 1;1 0 -1;-1 1 0]
% W=.0001*[zeros(nf,1) -ones(nf,1) ones(nf,1) ones(nf,1) zeros(nf,1) -ones(nf,1) -ones(nf,1) ones(nf,1) zeros(nf,1)];
% 
% 
% traceR=sum(matR(:,[1 5 9]),2);
% 
% I= find(traceR>3 & traceR<3.001);
% traceR(I)=3;
% 
% theta=acos(((traceR-1)/2));
% logR=repmat((1./(2*sin(theta))),1,9).*vec2mat(R-transpose_mat(R),9);
% 
% % theta=sqrt(real(acos(mod((traceR-1)/2,pi))).^2+imag(acos(mod((traceR-1)/2,pi))).^2);
% 
% % logR=vec2mat(repmat((1./(2*sin(theta))),1,9),3).*(R-transpose_mat(R));
% 
% % if R = I, θ = 2π  we choose arbitrary W=[0 1 1;-1 0 1; -1 -1 0];
% 
% % skew=[zeros(nf,1) ones(nf,1) ones(nf,1) -ones(nf,1) zeros(nf,1) ones(nf,1) -ones(nf,1) -ones(nf,1) zeros(nf,1)];
% 
% % mat_logR=vec2mat(logR,9).*repmat(1-R_is_I,1,9)+ skew.*repmat(R_is_I,1,9);
% logR(idx,:)=W(idx,:); 
% logR=vec2mat(logR,3);
% 
end
