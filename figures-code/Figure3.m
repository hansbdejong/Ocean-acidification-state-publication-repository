%Plots Figure 3

axes('Position',[0.25, 0.4, 0.5, 0.5])
deltas = [0.57, 0.525, 0.108, 0.001, -0.012, -0.002]
%sDIC, sTA, T, S_total, pTA
SD = [0.19, 0.180, 0.063, 0.002, 0.005, 0.046]

%bar graph
bar(0.6, deltas(1),'facecolor', [0.7 0.7 0.7])
hold on
bar(2, deltas(2), 'r')
hold on
bar(3, deltas(3), 'g')
hold on 
bar(4, deltas(4), 'm')
hold on
bar(5, deltas(5), 'b')
hold on
bar(6, deltas(6), 'c')

%formats axes
set(gca,'XTickLabel','','XTick', [], 'fontsize',15)
set(gca,'Ytick',-0.2:0.2:0.9)
ylabel('Contribution to \Delta\Omega_{Ar}','fontsize',20)
ylim([-.2 0.9])

%adds error bar
errorbar([0.6 2 3 4 5 6], deltas, SD,'.','color','k','linewidth',2)

%adds text to plot
text(0.6,0.83,'Total','fontsize',20,'horizontalalignment','center')
text(2,0.83,'sDIC','fontsize',20,'horizontalalignment','center')
text(3,0.83,'sTA','fontsize',20,'horizontalalignment','center')
text(4,0.83,'Temp','fontsize',20,'horizontalalignment','center')
text(5,0.83,'Sal','fontsize',20,'horizontalalignment','center')   
text(6,0.83,'pTA','fontsize',20,'horizontalalignment','center')

text(0.6,-0.07,'0.572 \pm 0.192' ,'fontsize',12,'horizontalalignment','center')
text(2,-0.15,'0.525 \pm 0.180' ,'fontsize',12,'horizontalalignment','center')
text(3,-0.07,'0.108 \pm 0.063' ,'fontsize',12,'horizontalalignment','center')
text(4,-0.15,'0.001 \pm 0.002' ,'fontsize',12,'horizontalalignment','center')
text(5,-0.07,'-0.012 \pm 0.005' ,'fontsize',12,'horizontalalignment','center')
text(6,-0.15,'-0.002 \pm 0.046' ,'fontsize',12,'horizontalalignment','center')
text(1.1,0.97,'Decomposition of \Delta\Omega_{Ar} from winter', 'fontsize',20)

%plots division line between total and carbon system components
X = [1.3 1.3]
Y = [-0.2 0.9]
hold on
plot(X,Y, '--k', 'linewidth', 2)
