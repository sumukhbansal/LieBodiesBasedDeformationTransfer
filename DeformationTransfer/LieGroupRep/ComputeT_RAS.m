function T = ComputeT_RAS( R,A,S,IV,F )
%% compute T matrix form (R A S) which will take I to P.
% X to Y is Y=RRx' A S Rx X ;ie Y=TX;
[IEdge1,IEdge2]=ComputeEdges(IV,F);
IRCanonical=ComputeCanonicalRotation(IEdge1,IEdge2);
Rx=IRCanonical;
S=kron(S,eye(3));
Rxt=transposeMatrix(Rx);
SRx=CompositionOfTransformation(S,Rx);
ASRx=CompositionOfTransformation(A,SRx);
RRxt=CompositionOfTransformation(R,Rxt);
T=CompositionOfTransformation(RRxt,ASRx);
end
