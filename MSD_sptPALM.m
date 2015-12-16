% function [msd2]=MSD_sptPALM(res,dx,dt);


min_lengthMSD=10;
msd2=zeros(min_lengthMSD,max(res(:,4)));
nbr=0;

tic 
for index=1:max(res(:,4));
    
    track=find(res(:,4)==index);
    
    if length(track)<min_lengthMSD;
     
    
    clear track pos frame msd   
    
    else
        nbr=nbr+1; 
        pos(:,1)=res(track,1)*0.107;      % in mum
        pos(:,2)=res(track,2)*0.107;      % in mum
        pos(:,3)=res(track,3)/dt;   % in frames


%%%%%%%%%%%%%%%%%% transform time in frames %%%%%%%%%%%%%%%%%%%%%%%%%

frame=[];
frame=pos(:,3); 
% frame=frame/dt;
% frame=frame-min(frame);
% frame(1,1)=1;

% i = frame --> Reihe
% j = gap; --> Spalte

%%%%%%%%%%%%%%%%%% Calculate MSD %%%%%%%%%%%%%%%%%%%%%%%%%

msd=[];%zeros(max(frame), 50);
%msd2=[];%zeros(50, 3);

for i=1:max(frame);         % find frame, for all frames
    vx=find(frame == i);
    
    if isempty(vx)==1;      % if frame does not exist, skip   
    else
        
    
    for j=1:min_lengthMSD %floor(max(frame))/4;    % time gap
    
    if vx+j>length(pos) || i+j~=frame(vx+j) % if point plus gap exeeds lentgh, skip
    
        msd(i,j)=0;
    
    else
        
          msd(i,j)=((pos(vx,1)-pos(vx+j,1))^2)+((pos(vx,2)-pos(vx+j,2))^2); % calculate MSD
    
%         msd2(j,1)=j;
%         msd2(j,2)=mean(nonzeros(msd(:,j)));
%         msd2(j,3)=std(nonzeros(msd(:,j)));
    
    end
    
    end
        
    end
      
    
end

for m=1:min_lengthMSD%floor(max(frame)); %  average over all lag times (mean, std) 
                             %  m=lag time in frames
    
%         msd2(m,1)=m;
        msd2(m,nbr)=mean(nonzeros(msd(:,m)))/dt; % convert back to seconds
%         msd2(m,3)=std(nonzeros(msd(:,m)));
        
end

% Normalize since MSD calculated per frames / per pixel
% 
% msd2(:,4)=msd2(:,2)/dt; %dx^2/dt;           % mean in ?m2/sec
% msd2(:,5)=msd2(:,1)*dt;                     % time in sec
% msd2(:,6)=msd2(:,3)/dt; %/dx^2/dt;          % std in ?m2/s
end

clear track pos frame msd

    
end

% end
figure

for l=1:nbr;
    
    plot(msd2(:,l));
    hold on;
end

fprintf('\n -- MDS calulated in %f sec --\n',toc)
fprintf('\n -- MDS calulated in %f trajectories --\n',nbr)

