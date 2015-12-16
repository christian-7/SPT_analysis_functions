function plot_tracks(res,min_length,max_length,image_name,overlay);

if overlay==1;

IM=imread(image_name);
flIM=flipud(IM);    
    
figure('Position',[900 50 900 900])
imshow(flIM);
hold on;   
title(['StDev & Tracks longer than ', num2str(min_length)]);hold on;

cmap = hsv(max(res(:,4)));
for i=1:max(res(:,4))
     
    target=find(res(:,4)==i);
    
    if length(target)>min_length & length(target)<max_length;
    
    p=plot(res(target,1),res(target,2));hold on;
    s=scatter(res(max(target),1),res(max(target),2),10);hold on;
%   axis([0 256 0 256]);
    p.Color = cmap(i,:);
    
    s.LineWidth = 0.1;
    s.MarkerEdgeColor = cmap(i,:);
    s.MarkerFaceColor = cmap(i,:);
    
    else
    end
end



else
        
figure('Position',[900 50 900 900])
cmap = hsv(max(res(:,4)));
for i=1:max(res(:,4))
     
    target=find(res(:,4)==i);
    
    if length(target)>min_length;
    
    p=plot(res(target,1),res(target,2));hold on;
    s=scatter(res(max(target),1),res(max(target),2),10);hold on;
%     axis([0 256 0 256]);
    p.Color = cmap(i,:);
    
    s.LineWidth = 0.1;
    s.MarkerEdgeColor = cmap(i,:);
    s.MarkerFaceColor = cmap(i,:);
    
    else
    end
end

title(['Tracks longer than ', num2str(min_length)]);hold on;
end