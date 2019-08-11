function iA=invA(A)
matA=vec2mat(A,9);
nf=size(matA,1);
U=matA(:,2);
V=matA(:,5);
iA=[ones(nf,1) -(U./V) zeros(nf,1) zeros(nf,1) 1./V zeros(nf,1) zeros(nf,1) zeros(nf,1) ones(nf,1)];
iA=vec2mat(iA,3);
end