% Plots each panel for Figure 1

cd('C:\Users\hansb\Desktop\1. Ocean acidification paper\OA figures\m_map_fig1_2_7')

%Loads the sea ice data
Dec1_ice = double(hdfread('asi-AMSR2-s6250-20121201-v5.hdf', 'ASI Ice Concentration'));
lon_ice = double(hdfread('LongitudeLatitudeGrid-s6250-Antarctic.hdf', 'Longitudes'));
lat_ice = double(hdfread('LongitudeLatitudeGrid-s6250-Antarctic.hdf', 'Latitudes'));

%loads chlorophyll data on a log scale
feb = double(hdfread('A20130322013059.L3m_MO_CHL_chlor_a_9km','l3m_data' ));
feb(feb == -32767) = NaN;
feb_log = log10(feb);
Y=0:2159;
X=0:4319;
incr = 360/4320;
[x,y]=meshgrid(X,Y);
chl_lat =   90 - y*incr - incr/2;
chl_lon = -180 + x*incr + incr/2;

Contours=[0.1 0.3 1 3 10];

%total alkalinity data
TA_file=xlsread('TA.xlsx');
sTA=TA_file(:,4);
TA_lat=TA_file(:,2);
TA_lon=TA_file(:,3);

%carbon system data
pCO2_file=xlsread('pCO2.xlsx');
pCO2=pCO2_file(:,4);
pCO2_lat=pCO2_file(:,2);
pCO2_lon=pCO2_file(:,3);
Sal=pCO2_file(:,5);
Omega_file=xlsread('Omega.xlsx');
Omega=Omega_file(:,4);
Omega_lat=Omega_file(:,2);
Omega_lon=Omega_file(:,3);


%--------------------------------------------------------------------------
%sea ice DEC 1

m_proj('stereographic','lat',-75,'long',180,'radius',6.5,'rec','on')
h=m_pcolor(lon_ice,lat_ice,Dec1_ice)
set(h, 'EdgeColor', 'none')
m_gshhs_i('patch',[.85 .85 .85])

m_grid('linestyle','-','linewidth',0.4,'box','on','tickdir','in',...
    'xtick',[165 180 195],'ytick',[-70 -72 -74 -76 -78],'xticklabel',[],...
    'color',[0.5 0.5 0.5],'fontsize',20)
m_gshhs_i('line','color','k')

%custom colorbar
h=colorbar
mycolor=[0 0 255; 8	48 107; 8 81 156;33	113	181;66 146 198;
    107	174	214;158	202	225;198	219	239;222	235	247;247	251	255;]
mycolor2=mycolor/255
colormap(mycolor2)
m_text(167,-70.5,'a','fontsize',30)
set(gca,'FontSize',20)
m_text(193,-70.5,'ice cover [%]','fontsize',30, 'horizontalalignment',...
    'right')

%----------------------------------------------------
%salinity
m_proj('stereographic','lat',-75,'long',180,'radius',6.5,'rec','on')

m_tbase('contour',[-1001:1:-1000],'edgecolor','b','linewidth',1);
m_scatter(pCO2_lon,pCO2_lat, 120,Sal,'fill','linewidth',5)
m_gshhs_i('patch',[.85 .85 .85])
m_grid('linestyle','-','linewidth',0.4,'box','on','tickdir','in',...
    'xtick',[165 180 195],'ytick',[-70 -72 -74 -76 -78],...
    'xticklabel',[],'yticklabel',[],...
'color',[0.5 0.5 0.5],'fontsize',20)
m_gshhs_i('line','color','k')

h = colorbar;
set(gca, 'CLim', [33 34.5]);
set(gca,'FontSize',20)
m_text(193,-70.5,'Salinity','fontsize',30, 'horizontalalignment','right')
m_text(167,-70.5,'b','fontsize',30)

%--------------------------------------------------------------------------
%Chlorophyll

%axes('Position',[0.25, 0.37, 0.35, 0.3])

m_proj('stereographic','lat',-75,'long',180,'radius',6.5,'rec','on')

m_pcolor(chl_lon,chl_lat,feb_log);shading flat;
m_gshhs_i('patch',[.85 .85 .85])
m_grid('linestyle','-','linewidth',0.4,'box','on','tickdir','in',...
    'xtick',[165 180 195],'ytick',[-70 -72 -74 -76 -78],...
    'xticklabel',[],...
'color',[0.5 0.5 0.5],'fontsize',20)
m_gshhs_i('line','color','k')

colorbar('YTick',log10(Contours),'YTickLabel',Contours);
caxis(log10([Contours(1) Contours(length(Contours))]));
h=colorbar('YTick',log10(Contours),'YTickLabel',Contours);

set(gca,'FontSize',20)
m_text(167,-70.5,'c','fontsize',30)
m_text(193,-70.5,'Chl [mg m^{-3}]','fontsize',30, 'horizontalalignment','right')

%--------------------------------------------------------------------------
%sTA

m_proj('stereographic','lat',-75,'long',180,'radius',6.5,'rec','on')

m_tbase('contour',[-1001:1:-1000],'edgecolor','b','linewidth',1);
m_scatter(TA_lon,TA_lat, 120,sTA,'fill','linewidth',5)
m_gshhs_i('patch',[.85 .85 .85])
m_grid('linestyle','-','linewidth',0.4,'box','on','tickdir','in',...
    'xtick',[165 180 195],'ytick',[-70 -72 -74 -76 -78],...
    'xticklabel',[],'yticklabel',[],...
'color',[0.5 0.5 0.5],'fontsize',20)
m_gshhs_i('line','color','k')

h = colorbar;
set(gca, 'CLim', [2260 2360]);
set(gca,'FontSize',20)
m_text(193,-70.5,'TA [\mumol kg^{-1}]','fontsize',15, 'horizontalalignment','right')

%--------------------------------------------------------------------------
%pCO2
m_proj('stereographic','lat',-75,'long',180,'radius',6.5,'rec','on')

m_tbase('contour',[-1001:1:-1000],'edgecolor','b','linewidth',1);
m_scatter(pCO2_lon,pCO2_lat, 120,pCO2,'fill','linewidth',5)
m_gshhs_i('patch',[.85 .85 .85])
m_grid('linestyle','-','linewidth',0.4,'box','on','tickdir','in',...
    'xtick',[165 180 195],'ytick',[-70 -72 -74 -76 -78],...
    'xticklabel',[],'yticklabel',[],...
'color',[0.5 0.5 0.5],'fontsize',20)
m_gshhs_i('line','color','k')

h = colorbar;
set(gca, 'CLim', [150 450]);
set(gca,'FontSize',20)
m_text(193,-70.5,'pCO_{2} [\muatm]','fontsize',15, 'horizontalalignment','right')

%--------------------------------------------------------------------------
%Omega

m_proj('stereographic','lat',-75,'long',180,'radius',6.5,'rec','on')

m_tbase('contour',[-1001:1:-1000],'edgecolor','b','linewidth',1);
m_scatter(Omega_lon,Omega_lat, 120,Omega,'fill','linewidth',5)
m_gshhs_i('patch',[.85 .85 .85])
m_grid('linestyle','-','linewidth',0.4,'box','on','tickdir','in',...
    'xtick',[165 180 195],'ytick',[-70 -72 -74 -76 -78],...
    'yticklabel',[],'xticklabel', [],...
'color',[0.5 0.5 0.5],'fontsize',20)
m_gshhs_i('line','color','k')

h = colorbar;
set(gca, 'CLim', [1.2 2.4]);
set(gca,'FontSize',20)
m_text(193,-70.5,'\Omega_{Aragonite}','fontsize',15, 'horizontalalignment','right')

