function Yc=DeformationTransfer(P1,P2,Fp,Q1,Fq,type)
% Tranfer the Deformation between P1,P2 to Q1
% Input: P1,P2,Q1, type
% Assuming P1 and Q1 are the reference poses
switch type
    case 'RAS'
        Ip=P1;
        Iq=P1;
        [Rp1, Ap1, Sp1]=Compute_RAS(Ip,P1,Fp);
        [Rp2, Ap2, Sp2]=Compute_RAS(Ip,P2,Fp);
        [Rq1, Aq1, Sq1]=Compute_RAS(Iq,Q1,Fq);
        [TR, TA, TS]=logRAS(Rp1,Ap1,Sp1,Rp2,Ap2,Sp2);
        [Rc, Ac, Sc]=expRAS(Rq1,Aq1,Sq1,TR,TA,TS);
        Tc=ComputeT_RAS(Rc,Ac,Sc,Iq,Fq);
        [ Yc ] = ShapeReconstruction_RAS( Tc,Iq,Fq,'RAS' );
end
end