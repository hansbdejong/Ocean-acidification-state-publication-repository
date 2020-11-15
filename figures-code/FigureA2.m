% Plots Figure A2

% current directory
cd('C:\')

% Loads the data
data = xlsread('SO4P_Omega');
Omega = data(:,12);
Depth = data(:,14);

% plots the data
axes('Position',[0.3, 0.15, 0.45, 0.8])
scatter(Omega(1:1883),Depth(1:1883),100,'b','markerfacecolor','b','MarkerEdgeColor','k')
set(gca,'YDir','Reverse')

% Formats the plot
ylim([0 1000])
xlim([0.8 1.8])
ylabel('Depth (m)', 'fontsize',18)
xlabel('\Omega_{Aragonite}', 'fontsize',18)
text(0.83,100,'\Omega_{Ar}= 1.08 \rightarrow', 'fontsize', 18)
set(gca,'Xtick',0.8:0.2:1.8)
set(gca,'Ytick',0:200:1000)
hold on

% vertical line at Omega = 1.08
x = [1.08 1.08]
y = [0 1000]
plot(x,y,'--k','linewidth',2)
box on
set(gca, 'fontsize', 18)
