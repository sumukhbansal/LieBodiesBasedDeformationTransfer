function [E1,E2]=ComputeEdges(V,F)
% compute edges of the triguler mesh

E1=V(F(:,2),:)-V(F(:,1),:); %V2-V1
E2=V(F(:,3),:)-V(F(:,1),:); %V3-V1

end