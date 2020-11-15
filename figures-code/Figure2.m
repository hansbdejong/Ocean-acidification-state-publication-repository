% Plots Figure 2 maps

cd('C:\')

%reads the data
A=xlsread('Station_map_Ar.xlsx');
B=xlsread('Station_map_SO4P.xlsx');
stat_lat=A(:,2);
stat_lon=A(:,3);
SO4P_lat=B(:,3);
SO4P_long=B(:,2);

cruise_track=xlsread('track_cruise.xlsx');
lat_cruise_track=cruise_track(:,3);
lon_cruise_track=cruise_track(:,2);
%--------------------------------------------------------------------
%plots the station data from the Ross Sea
axes('Position',[0.2, 0.5, 0.35, 0.4])
m_proj('stereographic','lat',-75,'long',180,'radius',7.5,'rec','on')
m_gshhs_i('patch',[.85 .85 .85])
m_grid('linestyle','-','linewidth',0.4,'box','on','tickdir','in',...
    'xtick',[165 180 195],'ytick',[-70 -72 -74 -76 -78],...
'color',[0.5 0.5 0.5])
hold on
m_plot(lon_cruise_track,lat_cruise_track,'color','k',...
    'linewidth',2)
hold on
m_scatter(stat_lon,stat_lat,50,'MarkerEdgeColor','k',...
              'MarkerFaceColor','r',...
              'LineWidth',.5)
m_tbase('contour',[-1001:1:-1000],'edgecolor','b','linewidth',1);
m_text(157,-78.5,'a','FontSize',20)
%-----------------------------------------------------------------------
%Plots the cruise track from Antarctica to Punta Arenas
axes('Position',[0.45, 0.5, 0.3, 0.4])

m_proj('stereographic','lat',-75,'long',260,'radius',35,'rec','on')
m_gshhs_l('patch',[.85 .85 .85])
m_grid('linestyle','-','linewidth',0.4,'box','on','tickdir','in',...
     'color',[0.5 0.5 0.5],...
 'xtick',[],'ytick',[])
   
hold on
m_plot(lon_cruise_track,lat_cruise_track,'color','k',...
    'linewidth',2)
hold on
m_scatter(SO4P_long,SO4P_lat,3,'MarkerEdgeColor','r',...
              'MarkerFaceColor','r',...
              'LineWidth',.5)

m_tbase('contour',[-1001:1:-1000],'edgecolor','b',...
   'linewidth',1);
m_text(150,-70,'b','FontSize',20)
%-------------------------------------------------------------------
