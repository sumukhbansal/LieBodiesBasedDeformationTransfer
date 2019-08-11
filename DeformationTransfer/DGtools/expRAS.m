function [ Rq,Aq,Sq ] = expRAS( Rp,Ap,Sp,TR,TA,TS )
% Q=P exp(Tangent at P)

Rq=CompositionOfTransformation(Rp,expSO3(TR));
Aq=CompositionOfTransformation(Ap,expA(TA));
Sq=Sp.*expS(TS);
end

