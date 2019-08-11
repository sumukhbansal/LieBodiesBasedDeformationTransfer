function [ Y ] = ShapeReconstruction_RAS( T, V, F, type )
n=size(T,2);
nf=size(F,1);
nv=size(V,1);
PV=V;

%% 
switch type
    case 'RAS'
        E1=F(:,1);
        E2=F(:,2);
        E3=F(:,3);
        I=[1:nf]';
        II=double([I;I]);
        J1=double([E1;E2]);
        J2=double([E1;E3]);
        J3=double([E2;E3]);
        K=double([-ones(nf,1);ones(nf,1)]);
        A1 = (sparse(II,J1,K,nf,nv));
        A2 = (sparse(II,J2,K,nf,nv));
        A3 = (sparse(II,J3,K,nf,nv));
        AE1=kron(A1,eye(n));
        AE2=kron(A2,eye(n));
        AE3=kron(A3,eye(n));
        
        X=vec2mat(PV,1);        
        nf1=3000;
        Diag_T=[];
        for st=1:nf1:size(T,1)
            nf1=min(size(T,1)-st+1,nf1);
            T1=T(st:st+nf1-1,:);
            temp1=sparse(repmat(T1,1,nf1/3));
            temp2=kron(sparse(eye(nf1/3)),ones(3));
            temp_Diag_T=temp1.*temp2;
            Diag_T=sparse(blkdiag(Diag_T,temp_Diag_T));
        end
        
        AE12=sparse([AE1;AE2;AE3]);
        b=sparse([Diag_T*AE1;Diag_T*AE2;Diag_T*AE3]*X);
        tic;
        Y=full(AE12\b);
        tm=toc;fprintf('Computing Least Square. Time taken: %d \n',tm);
        Y=vec2mat(Y,n);
  
end


end

