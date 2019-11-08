function [ corre ] = SurfaceCorr( time_seri, neib, neib_max )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
corre=neib;
v_num=length(neib_max);
for i=1:v_num
    for j=1:neib_max(i)
        corre(i,j)=corr(time_seri(i,:)',time_seri(neib(i,j),:)');
    end
end


end

