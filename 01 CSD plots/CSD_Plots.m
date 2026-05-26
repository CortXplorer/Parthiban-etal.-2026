% Parthiban etal., 2026
% Script for different CSD patterns of the animal

clear variables
close all
clc

% Loading the CSD data
load('D:\Own papers of journals\02 Foraging_Manuscript\06 Final Submission\DATA\CSD\CSD_Animal.mat')

%%%% Load the "CSD_Animal" mat file from your folder here %%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Initializing the variables
time_plot_fp = 1001:4000;  %data from -0.5s to 1s for first pokes
time_plot_lp = 7001:10000; %data from -0.5s to 1s for last pokes

scaling_factor_min = 4; 
scaling_factor_max = 3.5; % for visualizing the CSD better

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Plotting CSD of each poke category
% 1. First poke with rewards
max_lim = max(max(CSD.Last_poke_reward0(:,time_plot_lp))); min_lim = min(min(CSD.Last_poke_reward0(:,time_plot_lp)));
x_ticks = [1,1001,2001,3000]; str_x = -0.5:0.5:1; % xticks and xticklabels
y_ticks = 1:3:32; str_y = 0:150:1000; % distance btw electrodes = 50 um, total electrodes = 32
where_xline = 1001;
% plot CSD
figure;
imagesc(CSD.First_poke_reward1(:,(time_plot_fp))) % plotting only from -0.5s to 1s
colormap('jet')
colorbar
caxis([min_lim/scaling_factor_min max_lim/scaling_factor_max]);
set(gca,'XTick',x_ticks); set(gca,'xTickLabel',str_x,'fontsize',12);
set(gca,'YTick',y_ticks); set(gca,'yTickLabel',str_y,'fontsize',12);
set(gca,'TickDir','out')
xlabel('Time (s)', 'fontweight', 'bold', 'fontsize', 12);
ylabel('Cortical depth (μm)', 'fontweight', 'bold', 'fontsize', 12);
xline(where_xline,'--k','LineWidth', 2)
title('CSD_firstpokes_with_reward','Interpreter','none','fontsize',12,'fontweight', 'bold'); % interpreter = none enables underscore to be printed properly
fig = gcf;
fig.Position = [500, 100, 1000,800];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 2. First poke without rewards
max_lim = max(max(CSD.Last_poke_reward0(:,time_plot_lp))); min_lim = min(min(CSD.Last_poke_reward0(:,time_plot_lp)));
x_ticks = [1,1001,2001,3000]; str_x = -0.5:0.5:1; % xticks and xticklabels
y_ticks = 1:3:32; str_y = 0:150:1000; % distance btw electrodes = 50 um, total electrodes = 32
where_xline = 1001;
% plot CSD
figure;
imagesc(CSD.First_poke_reward0(:,(time_plot_fp))) % plotting only from -0.5s to 1s
colormap('jet')
colorbar
caxis([min_lim/scaling_factor_min max_lim/scaling_factor_max]);
set(gca,'XTick',x_ticks); set(gca,'xTickLabel',str_x,'fontsize',12);
set(gca,'YTick',y_ticks); set(gca,'yTickLabel',str_y,'fontsize',12);
set(gca,'TickDir','out')
xlabel('Time (s)', 'fontweight', 'bold', 'fontsize', 12);
ylabel('Cortical depth (μm)', 'fontweight', 'bold', 'fontsize', 12);
xline(where_xline,'--k','LineWidth', 2)
title('CSD_firstpokes_without_reward','Interpreter','none','fontsize',12,'fontweight', 'bold'); % interpreter = none enables underscore to be printed properly
fig = gcf;
fig.Position = [500, 100, 1000,800];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 3. Last rewarded pokes
max_lim = max(max(CSD.Last_poke_reward0(:,time_plot_lp))); min_lim = min(min(CSD.Last_poke_reward0(:,time_plot_lp)));
x_ticks = [1,1001,2001,3000]; str_x = -0.5:0.5:1; % xticks and xticklabels
y_ticks = 1:3:32; str_y = 0:150:1000; % distance btw electrodes = 50 um, total electrodes = 32
where_xline = 1001;
% plot CSD
figure;
imagesc(CSD.Last_reward_poke(:,(time_plot_lp))) % plotting only from -0.5s to 1s
colormap('jet')
colorbar
caxis([min_lim/scaling_factor_min max_lim/scaling_factor_max]);
set(gca,'XTick',x_ticks); set(gca,'xTickLabel',str_x,'fontsize',12);
set(gca,'YTick',y_ticks); set(gca,'yTickLabel',str_y,'fontsize',12);
set(gca,'TickDir','out')
xlabel('Time (s)', 'fontweight', 'bold', 'fontsize', 12);
ylabel('Cortical depth (μm)', 'fontweight', 'bold', 'fontsize', 12);
xline(where_xline,'--k','LineWidth', 2)
title('CSD_last_rewarded_pokes','Interpreter','none','fontsize',12,'fontweight', 'bold'); % interpreter = none enables underscore to be printed properly
fig = gcf;
fig.Position = [500, 100, 1000,800];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 4. Last poke without reward
max_lim = max(max(CSD.Last_poke_reward0(:,time_plot_lp))); min_lim = min(min(CSD.Last_poke_reward0(:,time_plot_lp)));
x_ticks = [1,1001,2001,3000]; str_x = -0.5:0.5:1; % xticks and xticklabels
y_ticks = 1:3:32; str_y = 0:150:1000; % distance btw electrodes = 50 um, total electrodes = 32
where_xline = 1001;
% plot CSD
figure;
imagesc(CSD.Last_poke_reward0(:,(time_plot_lp))) % plotting only from -0.5s to 1s
colormap('jet')
colorbar
caxis([min_lim/scaling_factor_min max_lim/scaling_factor_max]);
set(gca,'XTick',x_ticks); set(gca,'xTickLabel',str_x,'fontsize',12);
set(gca,'YTick',y_ticks); set(gca,'yTickLabel',str_y,'fontsize',12);
set(gca,'TickDir','out')
xlabel('Time (s)', 'fontweight', 'bold', 'fontsize', 12);
ylabel('Cortical depth (μm)', 'fontweight', 'bold', 'fontsize', 12);
xline(where_xline,'--k','LineWidth', 2)
title('CSD_lastpokes_without_reward','Interpreter','none','fontsize',12,'fontweight', 'bold'); % interpreter = none enables underscore to be printed properly
fig = gcf;
fig.Position = [500, 100, 1000,800];

