% Plots figure 4

% changes directory
cd('C:\...')

%inport data
A = xlsread('Omega_sDIC_SO');
B = xlsread('pCO2_SO');
C = xlsread('SO_T_S');
D = xlsread('UWPOC');

temp = C(:,5);
temp_lat = C(:,3);
omega = A(:,5);
omega_lat = A(:,2);
pCO2 = B(:,4);
pCO2_lat = B(:,2);
POC = D(:,6);
POC_lat = D(:,5);
sal = C(:,6);
sal_lat = C(:,3);

%--------------------------------------------------------------------------
%Plot The Polar Fronts
axes('Position',[0.25, 0.1, 0.5, 0.77])
plot([-67 -67],[0 1],'-','color',[0.9 0.9 0.9], 'linewidth',3)
hold on
plot([-65.2 -65.2],[0 1],'-','color',[0.9 0.9 0.9], 'linewidth',3)
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

%--------------------------------------------------------------------------
%Plot A
axes('Position',[0.25, 0.7, 0.5, 0.17])
scatter(omega_lat,omega,3,'markerfacecolor','r','markeredgecolor','r')

%format plot
xlim([-75 -55])
ylim([1.2 2])

%add labels 
ylabel('\Omega_{Ar} ', 'fontsize',10)
text(-67,2,'SACCF-N','fontsize',13,'horizontalalignment','center','verticalalignment','bottom')
text(-65.2,1.85,'PF-S','fontsize',13,'horizontalalignment','center','verticalalignment','bottom')
text(-64.2,2,'PF-M','fontsize',13,'horizontalalignment','center','verticalalignment','bottom')
text(-61.6,2,'PF-N','fontsize',13,'horizontalalignment','center','verticalalignment','bottom')
text(-60.6,1.85,'SAF-S','fontsize',13,'horizontalalignment','center','verticalalignment','bottom')
text(-58,2,'SAF-M','fontsize',13,'horizontalalignment','center','verticalalignment','bottom')
text(-57,1.85,'SAF-N','fontsize',13,'horizontalalignment','center','verticalalignment','bottom')
text(-74,1.85,'a','fontsize',15,'horizontalalignment','center','verticalalignment','bottom')
set(gca,'xticklabel',[])
set(gca,'FontSize',10)
set(gca,'Color','None')

%--------------------------------------------------------------------------
%Plot B

axes('Position',[0.25, 0.5, 0.5, 0.17])
scatter(temp_lat,temp,3,'markerfacecolor','k','markeredgecolor','k')
set(gca,'FontSize',10)
xlim([-75 -55])
ylim([-2 9])

%add labels
ylabel('Temp [ ^{\circ}C]', 'fontsize',10)
text(-74,6.5,'b','fontsize',15,'horizontalalignment','center','verticalalignment','bottom')

%format plot
set(gca,'xticklabel',[])
set(gca,'Color','None')

%--------------------------------------------------------------------------
%Plot C
axes('Position',[0.25, 0.3, 0.5, 0.17])

%plot
scatter(pCO2_lat,pCO2,3,'markerfacecolor','b','markeredgecolor','b')
xlim([-75 -55])
ylim([320 400])

%format plot
text(-74,385,'c','fontsize',15,'horizontalalignment','center','verticalalignment','bottom')
ylabel('pCO_{2} [\muatm]', 'fontsize',10)
set(gca,'xticklabel',[])
set(gca,'Color','None')
set(gca,'FontSize',10)

%--------------------------------------------------------------------------
%Plot D

axes('Position',[0.25, 0.1, 0.5, 0.17])

%plot
scatter(POC_lat,POC,20,'markerfacecolor','g','markeredgecolor','k')
set(gca,'FontSize',10)
xlim([-75 -55])

% Format plot
text(-74,160,'d','fontsize',15,'horizontalalignment','center','verticalalignment','bottom')
ylabel('POC [\mug C L^{-1}]', 'fontsize',10)
xlabel('Latitude [ ^{\circ}S]', 'fontsize',10)
set(gca,'Color','None')
