function [ ind_parcel ] = IndividualParcelFastMarch( atlas_parcel,  center_vers, neighbor, max_neighbor, nei_sim)

    N_parcel=max(atlas_parcel);
    N_ver=length(atlas_parcel);
    
    %prepare fastmarching
    v_time=zeros(N_ver,1)+1e10;
    v_time(center_vers)=0;
    
    dist=1-nei_sim;
     dist=dist.*dist; %this should be modified to fit different situation
   

    stat=zeros(N_ver,1); %Far=0, Open=1, Dead=2, useless=-2;
    stat(center_vers)=1;
    stat(find(atlas_parcel==0))=-2;
    ind_parcel=zeros(N_ver,1);
    for i=1:N_parcel
        ind_parcel(center_vers(i))=i;
    end
    %start fast marching
    
    while sum(stat==0)>0
        Open=find(stat==1);
        [M,Ind]=min(v_time(Open));
        cur=Open(Ind(1));
        stat(cur)=2;
        for i=1:max_neighbor(cur)
            if stat(neighbor(cur,i))==0
                stat(neighbor(cur,i))=1;
            end
        end
         for i=1:max_neighbor(cur)
            nei=neighbor(cur,i);
            if stat(nei)==1
                for j=1:max_neighbor(nei)
                    if stat(neighbor(nei,j))>0
                        c_time=v_time(neighbor(nei,j))+dist(nei,j);
                        if c_time<v_time(nei)
                            ind_parcel(nei)=ind_parcel(neighbor(nei,j));
                            v_time(nei)=c_time;
                        end
                    end
                end

            end
        end
            
    end
    




end

