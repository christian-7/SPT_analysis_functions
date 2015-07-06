function plot_tracks(res,max_length);

figure

cmap = hsv(max(res(:,4)));

for i=1:max(res(:,4))
     
    target=find(res(:,4)==i);
    
    if length(target)>max_length;
    
    p=plot(res(target,1),res(target,2));hold on;
    s=scatter(res(max(target),1),res(max(target),2),20);hold on;
    axis([0 256 0 256]);
    p.Color = cmap(i,:);
    
    s.LineWidth = 0.1;
    s.MarkerEdgeColor = cmap(i,:);
    s.MarkerFaceColor = cmap(i,:);
    
    else
    end
end
