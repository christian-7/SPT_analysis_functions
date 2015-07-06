%% Select and save trajectories longer than

function [pos]=track_filter(res, max_length);

pos1=[];%zeros(1, 4);%length(res)
pos2=[];
pos3=[];
pos4=[];


for i=1:max(res(:,4))
     
    target=find(res(:,4)==i);
    
    if length(target)>max_length;
    
    pos1=cat(1,pos1,res(target,4));         % track number
    pos2=cat(1,pos2,res(target,1));         % x in ?m
    pos3=cat(1,pos3,res(target,2));         % y in ?m
    pos4=cat(1,pos4,res(target,3));    % time
    
    else
    end

end

pos=[];

pos(:,1)=pos1;
pos(:,2)=pos2/10;
pos(:,3)=pos3/10;
pos(:,4)=pos4*0.03;

% dlmwrite('VP40_mEos3_longer20.trxyt',pos,'delimiter','\t');

end