%Plots Figure 7 - Omega from early spring cruises

%change as appropriate
cd('C:\Users\hansb\Desktop\1. Ocean acidification paper\OA figures\m_map_fig1_2_7')

%--------------------------------------------------------------------------
%Panel A

%sets up the panel
axes('Position',[0.15, 0.5, 0.35, 0.4])

%loads the data
A=xlsread('Lat_Long_november_pCO2.xlsx');

Lat_94=A(:,2);
Lat_97=A(:,10);
Lat_05=A(:,18);
Lat_06=A(:,22);

Long_94=A(:,3);
Long_97=A(:,11);
Long_05=A(:,19);
Long_06=A(:,23);

%plots the data on the map
m_proj('stereographic','lat',-75,'long',180,'radius',6,'rec','on')
m_scatter(Long_94,Lat_94,20,'b')
hold on
m_scatter(Long_97,Lat_97,20,'r')
hold on
m_scatter(Long_05,Lat_05,20,'g')
hold on
m_scatter(Long_06,Lat_06,20,'k')
hold on

%Formats the map
m_gshhs_i('patch',[.85 .85 .85])
m_grid('linestyle','-','linewidth',0.4,'box','on','tickdir','in',...
    'xtick',[165 180 195],'ytick',[-72 -74 -76 -78],...
'color',[0.5 0.5 0.5])
m_tbase('contour',[-1001:1:-1000],'edgecolor','b','linewidth',2);
m_text(190, -71,'a','fontsize',20)


%--------------------------------------------------------------------------
%Panel B

axes('Position',[0.5, 0.5, 0.25, 0.4])

%loads the data
data=xlsread('MASTER_November');
Date_94=data(:,1);
Date_97=data(:,9);
Date_05=data(:,17);
Date_06=data(:,21);

Omega_94=data(:,4); 
Omega_97=data(:,12); 
Omega_05=data(:,20);
Omega_06=data(:,24); 

%plots the data
plot(Date_94,Omega_94,'ob', 'markerfacecolor','b', 'markersize', 3)
hold on
plot(Date_97,Omega_97,'or','markerfacecolor','r','markersize', 3)
hold on
plot(Date_05,Omega_05,'og','markerfacecolor','g','markersize', 3)
hold on
plot(Date_06,Omega_06,'ok','markerfacecolor','k','markersize', 3)
ylim([1 2.5])
xlim([5 30])

%formats the plot
h = legend('1994','1997','2005','2006')
xlabel('November','fontsize',15)
ylabel('\Omega_{Aragonite}','fontsize',15)
set(h,'location','northwest','box','off','fontsize',12)
text(28,2.4,'b','fontsize',20)
