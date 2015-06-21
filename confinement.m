function [prob2, L]=confinement(pos,segment,D)


% generate variable frame from input pos

frame=pos(:,3);               % time step in seconds
frame=frame;%/dt;             % time step in frames
frame=frame-min(frame);       % starting from 0
frame=frame+1;
% frame(1,1)=1;               % starting from 1

% i = frame --> Reihe
% j = gap; --> Spalte

prob=zeros(max(frame)-segment,1);   

d=[];
vx=[];
vy=[];

c=1;

for i=1:max(frame)-segment;                         % for all frames
    vx=find(frame == i);                            % find frame i
    
    if isempty(vx)==1;                              % if frame does not exist, skip   
    else
        
     
    for j=4:segment;                                            % segment length
          
        vy=find(frame <= (i+j) & frame >= i );                  % select segment
        subset(:,1)=pos(vy);                                    % define segment as subset
        subset(:,2)=pos(vy,2);
        
        if length(vy)==1;                                       % if subset is only 1 frame --> distance is 0
                     R=0;
        else    
        
            for  k=2:length(subset);
                 d(k,1)=sqrt(((subset(k,1)-subset(1,1))^2)+((subset(k,2)-subset(1,2))^2));    % calculate the distance to each point in subset from point i  
            end
        R=max(d);                                                      % maximum distance within subset
        prob(i:(i+j),c)=0.2048-2.5117*((D*j)./(R^2));                  % probability within subset
%       prob(c,i:(i+j))=((D*j)./(R^2));

%       prob(c,i:(i+j))=horzcat(prob(c,i:(i+j)),((D*j)./(R^2)));
        c=c+1;  
        clear subset
        end
    
%     c=c+1;    
        
    end
    clear vx vy R d;
    
    end
   
end
clear subset

% Calculate mean confinement parameter psi

prob2=zeros(length(frame),1);            % preallocate prob2

for l=1:length(frame)    
prob2(l,1)=l;                           % frame
prob2(l,2)=mean(nonzeros(prob(l,:)));   % this is psi
end

% Calculate normalized probablity index L

L=zeros(length(prob2),1);               % preallocate L

for i=1:length(prob2) 
    if 10.^(prob2(i,2))>0.1
       L(i,1)=0;
    else        
        L(i,1)=((prob2(i,2))*(-1)-1);    
    end
    
    L(i,2)=i;
    
end

end