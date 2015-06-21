function [dist,dcum]=cum_displacement(pos)

num_steps=length(pos);      % number of steps in total
dcum = zeros(num_steps,1);  % create variable and fill with 0s
dcum(1,1)=0;                % start from 0

for k=2:num_steps;
    
    dist(k,1)=sqrt(((pos(k,1)-pos(1,1))^2)+((pos(k,2)-pos(1,2))^2));

    dcum(k)=dist(k)+dcum(k-1);
end

end