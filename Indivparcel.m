function [ l_seg_ind,r_seg_ind ] = Indivparcel(atlas,sub_dt,left,right )
%UNTITLED 
%  atlas！！the population-based atlas including parameters:
%  l_parcel,r_parcel,l_neib,r_nieb,l_neib_max,r_neib_max,l_center,r_center
%  sub_dt！！the subject's CIFTI data
%  left-- brain's left GIfTI Geometry file(.gii)
%  right-- brain's right GIfTI Geometry file(.gii)


l_index=find(sub_dt.brainstructure==1);
r_index=find(sub_dt.brainstructure==2);
l_mean_cor1=SurfaceCorr(sub_dt.dtseries(l_index,:),atlas.l_neib,atlas.l_neib_max);
r_mean_cor1=SurfaceCorr(sub_dt.dtseries(r_index,:),atlas.r_neib,atlas.r_neib_max);
l_center=CenterBackFM(atlas.l_parcel,atlas.l_neib,atlas.l_neib_max,left);
r_center=CenterBackFM(atlas.r_parcel,atlas.r_neib,atlas.r_neib_max,right);
l_seg_ind=IndividualParcelFastMarch(atlas.l_parcel,l_center, atlas.l_neib, atlas.l_neib_max,l_mean_cor1 );
r_seg_ind=IndividualParcelFastMarch(atlas.r_parcel,r_center, atlas.r_neib, atlas.r_neib_max,r_mean_cor1);

end

