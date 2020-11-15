%Plot figure 6

%changes directory
cd('C:\Users\hansb\Desktop\1. Ocean acidification paper\OA figures\SO_Graphs_fig_4_5_6')

%loads data
B=xlsread('Omega_sDIC_SO');
C=xlsread('TA_SO');
sTA=C(:,5);
sTA_lat=C(:,2);
sDIC=B(:,7);
sDIC_lat=B(:,2);

axes('Position',[0.25, 0.1, 0.5, 0.8])

%% Plots Polar Fronts
plot([-67 -67],[0 1],'-','color',[0.9 0.9 0.9],'linewidth',3)
hold on
plot([-65.2 -65.2],[0 1],'-','color',[0.9 0.9 0.9],'linewidth',3)
hold on
plot([-64.2 -64.2],[0 1],'-','color',[0.9 0.9 0.9],'linewidth',3)
hold on
plot([-64.2 -64.2],[0 1],'-','color',[0.9 0.9 0.9],'linewidth',3)
hold on
plot([-61.6 -61.6],[0 1],'-','color',[0.9 0.9 0.9],'linewidth',3)
hold on
plot([-60.6 -60.6],[0 1],'-','color',[0.9 0.9 0.9],'linewidth',3)
hold on
plot([-58 -58],[0 1],'-','color',[0.9 0.9 0.9],'linewidth',3)
hold on
plot([-57 -57],[0 1],'-','color',[0.9 0.9 0.9],'linewidth',3)

%format plot
ylim([0 1])
xlim([-75 -55])
hold on
set(gca,'Xtick',[],'Ytick',[],'Visible','off');

%% Plot A
axes('Position',[0.25, 0.5125, 0.5, 0.3875])

plot(sDIC_lat,sDIC,'ro','markersize',3,'markerfacecolor','r')
set(gca,'FontSize',10)
ylabel('sDIC_{calc} [\mumol kg^{-1}]', 'fontsize',15)
set(gca,'xticklabel',[])
xlim([-75 -55])
set(gca,'Color','None')

%% Labels Polar Fronts
text(-67,2243,'SACCF-N','fontsize',13,'horizontalalignment','center',...
    'verticalalignment','bottom')
text(-65.2,2230,'PF-S','fontsize',13,'horizontalalignment','center',...
    'verticalalignment','bottom')
text(-64.2,2243,'PF-M','fontsize',13,'horizontalalignment','center',...
    'verticalalignment','bottom')
text(-61.6,2243,'PF-N','fontsize',13,'horizontalalignment','center',...
    'verticalalignment','bottom')
text(-60.6,2230,'SAF-S','fontsize',13,'horizontalalignment','center',...
    'verticalalignment','bottom')
text(-58,2243,'SAF-M','fontsize',13,'horizontalalignment','center',...
    'verticalalignment','bottom')
text(-57,2230,'SAF-N','fontsize',13,'horizontalalignment','center',...
    'verticalalignment','bottom')
text(-74,2130,'a','fontsize',15,'horizontalalignment','center',...
    'verticalalignment','bottom')

%% Plot B
axes('Position',[0.25, 0.1, 0.5, 0.3875])
plot(sTA_lat,sTA,'ko','markersize',3,'markerfacecolor','k')
set(gca,'FontSize',10)
ylabel('sTA [\mumol kg^{-1}]', 'fontsize',15)
xlabel('Latitude [ ^{\circ}S]', 'fontsize',15)
text(-74,2305,'b','fontsize',15,'horizontalalignment','center',...
    'verticalalignment','bottom')
xlim([-75 -55])
set(gca,'Color','None')


