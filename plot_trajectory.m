function [out1, out2]= plot_trajectory(pos)


figure('Position',[200 400 900 500],'name','Overview Figure: scatter, velocity, MSD, cum. displacement')
h=gcf;
set(h,'PaperOrientation','landscape');


subplot(2,3,1)
line(pos(:,1),pos(:,2));hold on;
scatter(pos(:,1),pos(:,2),3,pos(:,3));hold on;

plot(pos(1,1),pos(1,2),'*b','MarkerSize',12);hold on;
text(pos(1,1),pos(1,2), 'Start');
plot(pos(length(pos),1),pos(length(pos),2),'+b','MarkerSize',12);hold on;
text(pos(length(pos),1),pos(length(pos),2),'End');hold on;

title('XY scatter trajectory');
xlabel('x (\mu m)','FontSize',12);
ylabel('y (\mu m)','FontSize',12);

end