function [msd,time]=MSD_Hoze(pos,dx, dt);

% dx=0.1;       % pixel size
% dt=0.5;       % time step

X=pos(:,1:2);                   % x and y coornndiates
frame=pos(:,3);                 % time
frame=frame-min(frame);         % if it does not start with 0
%frame=frame/dt;                % frame in sec
N=(max(frame)-min(frame)+1);    % number of frames

msd=zeros(1,N);                 % initiate msd
time = [0:N-1]*dt;
f=zeros(1,N);


% Find the frames that have been recorded

for j=0:N
    if ~isempty(find(frame==j))
        f(j+1)=find(frame==j,1);
    end
end



for i=1:N-1
    c=0;
    
    for j=0:N-i-1
        if f(i+j+1)>0 && f(j+1)>0
            c=c+1;
            msd(i+1)=msd(i+1)+ sum((X(f(i+j+1),:)-X(f(j+1),:)).^2 );
        end
    end
    if c>0
        msd(i+1)=msd(i+1)/c;
    end
end


% msd=msd*dx^2/dt;
msd=msd/dt;

end