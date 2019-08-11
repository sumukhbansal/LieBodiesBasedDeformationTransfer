function [ TRpq,TApq,TSpq ] = logRAS( Rp,Ap,Sp,Rq,Aq,Sq )
% log(inv(p)*q)

TRpq=logSO3(CompositionOfTransformation(transposeMatrix(Rp),Rq));
TApq=logA(CompositionOfTransformation(invA(Ap),Aq));
TSpq=real(logS(Sq./Sp));
end

