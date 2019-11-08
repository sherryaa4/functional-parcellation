load('C:\Users\Administrator\Desktop\scripts\atlas_s200.mat');
sub_rest=ft_read_cifti('sub_rest.dtseries.nii');
left=gifti('L.midthickness.32k.surf.gii');
right=gifti('R.midthickness.32k.surf.gii');
[l_seg_ind,r_seg_ind]=Indivparcel(atlas,sub_rest,left,right);