function [vel]=velocity(pos,dt)

num_steps=length(pos);

vel=zeros(length(pos),1);

for k=2:num_steps;
    
    vel(k,1)=sqrt(((pos(k,1)-pos(k-1,1))^2)+((pos(k,2)-pos(k-1,2))^2));
 
end

vel=vel/dt;         % vel in ?m/s

end