% Plots Figure 5

% changes directory
cd('C:\')

% import data
A = xlsread('Controls_SO_graph');
lat = A(:,1);
delta_omega = A(:,6);
omega_T = A(:,2);
omega_DIC = A(:,3);
omega_TA = A(:,4);
omega_S = A(:,5);

%% adds the polar front lines
axes('Position',[0.25, 0.1, 0.5, 0.8])
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

ylim([0 1])
xlim([-75 -55])
hold on
set(gca,'Xtick',[],'Ytick',[],'Visible','off');

%% Adds Plot A

axes('Position',[0.25, 0.5125, 0.5, 0.3875])

%plots data
plot(lat,delta_omega,'k','linewidth',2)
hold on
plot(lat,omega_DIC,'r','linewidth',2)
hold on
plot(lat,omega_TA,'b','linewidth',2)
hold on
plot(lat, omega_T,'g','linewidth',2)
hold on
plot(lat, omega_S,'m','linewidth',2)
hold on
plot(lat,omega_TA,'b','linewidth',2)
hold on

%formats plot
text(-74,-0.3,'a','fontsize',15,'horizontalalignment','center',...
    'verticalalignment','bottom')
set(gca,'FontSize',10)
ylabel('Contribution to \Delta\Omega_{Ar}', 'fontsize',15)
xlim([-75 -55])
set(gca,'xticklabel',[])
set(gca,'Color','None')

%adds legend
h = legend('\Delta\Omega_{Ar}','sDIC','sTA','Temp','Sal');
set(h,'fontsize',20,'box','off')
set(h,'location','north','Orientation','horizontal')
set(gca,'Color','None')
set(gca,'Ytick',-0.4:0.4:1.2)
ylim([-0.4 1.2])

%% Adds Plot B

%imports data 
B = xlsread('Omega_sDIC_SO');
TA_DIC = B(:,8);
TA_DIC_lat = B(:,2);

%plots data
axes('Position',[0.25, 0.1, 0.5, 0.3875])
plot(TA_DIC_lat,TA_DIC,'o','markersize',3,'markerfacecolor','b')

%formats plot
ylim([1.04 1.09])
xlim([-75 -55])
set(gca,'Color','None')
text(-74,1.043,'b','fontsize',15,'horizontalalignment','center')

%%
%Polar front labels
text(-67,1.085,'SACCF-N','fontsize',13,'horizontalalignment','center',...
    'verticalalignment','bottom')
text(-65.2,1.08,'PF-S','fontsize',13,'horizontalalignment','center',...
    'verticalalignment','bottom')
text(-64.2,1.085,'PF-M','fontsize',13,'horizontalalignment','center',...
    'verticalalignment','bottom')
text(-61.6,1.085,'PF-N','fontsize',13,'horizontalalignment','center',...
    'verticalalignment','bottom')
text(-60.6,1.08,'SAF-S','fontsize',13,'horizontalalignment','center',...
    'verticalalignment','bottom')
text(-58,1.085,'SAF-M','fontsize',13,'horizontalalignment','center',...
    'verticalalignment','bottom')
text(-57,1.08,'SAF-N','fontsize',13,'horizontalalignment','center',...
    'verticalalignment','bottom')

%%
%Final plot axis labels
ylabel('TA:DIC', 'fontsize',15)
xlabel('Latitude [ ^{\circ}S]', 'fontsize',15)
