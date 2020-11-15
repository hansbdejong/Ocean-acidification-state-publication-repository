%Plots figure Appendix 1

%current directory
cd('C:\Users\hansb\Desktop\1. Ocean acidification paper\OA figures\m_map_fig1_2_7')

%Loads the data
data = xlsread('MATLAB_TA_S_input');
Sal_TRACERS = data(:,1);
TA_TRACERS = data(:,2);
Sal_Bates_Nov = data(:,3);
TA_Bates_Nov = data(:,4);
Sal_Bates_Jan = data(:,5);
TA_Bates_Jan = data(:,6);
Sal_JGOFS = data(:,7);
TA_JGOFS = data(:,8);

x = [33.4, 34, 34.7];
y = [2263.852, 2305.199, 2353.437];

%sets the panel
axes('Position',[0.3, 0.15, 0.45, 0.8])

%plots the data
scatter(Sal_TRACERS,TA_TRACERS,100,'markerfacecolor','b','MarkerEdgeColor','k')
hold on
scatter(Sal_Bates_Nov,TA_Bates_Nov,100,'markerfacecolor','g','MarkerEdgeColor','k')
hold on
scatter(Sal_Bates_Jan,TA_Bates_Jan,100,'markerfacecolor','r','MarkerEdgeColor','k')
hold on
scatter(Sal_JGOFS,TA_JGOFS,100,'markerfacecolor','m','MarkerEdgeColor','k')
hold on
plot(x,y,'color','k', 'linewidth',3)
hold on

%formats the plot
set(gca,'fontsize',18)
ylim([2240 2360])
xlim([33.2 35])
ylabel('TA (\mumol kg^{-1})', 'fontsize',18)
xlabel('Salinity', 'fontsize',18)
text(33.3,2350,'TA = 68.9*Sal - 37.8','fontsize',18)
text(33.3,2340,'R^{2} = 0.94','fontsize',18)
box on
