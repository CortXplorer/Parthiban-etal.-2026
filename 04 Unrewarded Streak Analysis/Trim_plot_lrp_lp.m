% Function for plotting the overall curves from -0.5 to 1s and plotting the
% subplots for 5 time windows instead of 6

% For lr_lp analysis

function Trim_plot_lrp_lp (norm_data,Tim_win_data, wh_tit,fig_name1,layer,stats,a,b,ons,start_value,end_value,c,d)

% Initializing few matrices
colors = [0.4660 0.6740 0.1880; 0.8500 0.3250 0.0980; 0.9290 0.6940 0.1250; 0.6630 0.6313 0.7083];
time_lfp = linspace(-0.5,1,size(norm_data(1001:4000),2)); % linearly spaced time samples from -1s to +2 seconds
colors1 = [0.6630 0.6313 0.7083; 0.9290 0.6940 0.1250; 0.8500 0.3250 0.0980; 0.4660 0.6740 0.1880];
xticks = [time_lfp(1),time_lfp(801),time_lfp(1001),time_lfp(1201),time_lfp(2001),time_lfp(3000)];
xticks_lb = [-0.5,-0.1,0,0.1,0.5,1];

% 1. Plotting the shaded error bar plots of all 4 pokes in one plot
all_fig = figure;

% Calculating standard errors here
hold on
shadedErrorBar(time_lfp,squeeze(norm_data(1,1001:4000,:))',{@nanmean,@(x)nanstd(x,0,1) ./ sqrt(size(x,1))},{'color', colors(4,:)},1);
shadedErrorBar(time_lfp,squeeze(norm_data(2,1001:4000,:))',{@nanmean,@(x)nanstd(x,0,1) ./ sqrt(size(x,1))},{'color', colors(3,:)},1);
shadedErrorBar(time_lfp,squeeze(norm_data(3,1001:4000,:))',{@nanmean,@(x)nanstd(x,0,1) ./ sqrt(size(x,1))},{'color', colors(2,:)},1);
shadedErrorBar(time_lfp,squeeze(norm_data(4,1001:4000,:))',{@nanmean,@(x)nanstd(x,0,1) ./ sqrt(size(x,1))},{'color', colors(1,:)},1);
hold off
all_fig.Position = [100, 100, 800, 1000];  % x=100, y=100, width=800px, height=600px

% Customize the plot
axis tight
xline(0,'--k','LineWidth', 2)
set(gca, 'TickDir', 'out');  % Ticks outward
set(gca, 'FontSize', 12);    % Tick labels fontsize
set(gca, 'Box', 'off');      % No ticks in top and right side
set(gca,'XTick',xticks)
ylim([c d])
ax = gca;
ax.XAxis.LineWidth = 2; % Thickness for the x-axis tick lines
ax.YAxis.LineWidth = 2; % Thickness for the y-axis tick lines
% Legends
legend('','','','\color[rgb]{0.6630 0.6313 0.7083} n-3','','','','\color[rgb]{0.9290 0.6940 0.1250} n-2','','','', ...
    '\color[rgb]{0.8500 0.3250 0.0980} n-1','','','','\color[rgb]{0.4660 0.6740 0.1880} n','FontSize', 12)
legend('boxoff')
% Set the axis lines in front of the plot
ax.Layer = 'top';
set(gca, 'XTickLabel', xticks_lb, 'FontSize', 12, 'FontWeight', 'bold');
set(gca, 'YTickLabel', get(gca, 'YTickLabel'), 'FontSize', 12, 'FontWeight', 'bold');
xlabel('Time (s)', 'fontweight', 'bold', 'fontsize', 18);
ylabel('Z-norm. Scores', 'fontweight', 'bold', 'fontsize', 18);
fig_title = sprintf('LRP_to_LP_analysis_%s: %s: %s',wh_tit,fig_name1,layer); % generating the figure title
title(fig_title,'Interpreter','none','fontsize',18,'fontweight', 'bold'); % interpreter = none enables underscore to be printed properly
tb = axtoolbar('default'); tb.Visible = 'off';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 2. Plotting the subplots of different time points (4 pokes) with statistics (Boxplots)
% plotting only the first 5 time windows

% Initializing time windows
super_earlyphase_time_forplot = '(-500 to -100 ms)';
pre_earlyphase_time_forplot = '(-100 to 0 ms)';
earlyphase_time_forplot = '(0 to 100 ms)';
latephase_time_forplot = '(100 to 500 ms)';
latephase2_time_forplot = '(500 ms to 1s)';

figure('WindowState', 'maximized');
tl = tiledlayout(1,5);

%%% Super earlyphase %%%
nexttile
hold on
bset1 = boxplot(Tim_win_data(:,:,1),'Widths',0.4);
set(bset1,{'linew'},{2})
h1 = findobj(gca,'Tag','Box');
for j1=1:length(h1)
    patch(get(h1(j1),'XData'),get(h1(j1),'YData'),colors(j1,:),'FaceAlpha',0.6); %setting different colors for box plots
end

% Customize the axes
axis tickaligned
set(gca, 'TickDir', 'in');  % Ticks outward
set(gca, 'FontSize', 12,'FontWeight','bold');    % Tick labels fontsize
set(gca, 'Box', 'off');      % No ticks in top and right side
set(gca,'XTickLabel','')
% Set the tick lines thicker
ax1 = gca;
ax1.XAxis.LineWidth = 2; % Thickness for the x-axis tick lines
ax1.YAxis.LineWidth = 2; % Thickness for the y-axis tick lines
ax1.Layer = 'top';
tit1 = sprintf('%s',super_earlyphase_time_forplot);
title(tit1,'FontSize', 14,'FontWeight','bold')
yline(0,'--k','LineWidth', 1)
% xlabel(super_earlyphase_time_forplot, 'fontweight', 'bold', 'fontsize', 14);
% ylabel('RMS - Z scores', 'fontweight', 'bold', 'fontsize', 14);
tb = axtoolbar('default'); tb.Visible = 'off';

if stats == 1
    %Statistics and adding significance stars
    Sigstar_super_earlyphase = bonfer_ttest2(Tim_win_data(:,:,1));
    %Plotting the significance stars in the plot
    sigstarplot_AUC_v2(Sigstar_super_earlyphase,ons,start_value,end_value)
    ylim([a b])
elseif stats == 0
    ylim([a b])
end
hold off
set(gca,'XTick',[])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Pre earlyphase %%%
nexttile
hold on
bset2 = boxplot(Tim_win_data(:,:,2),'Widths',0.4);
set(bset2,{'linew'},{2})
h2 = findobj(gca,'Tag','Box');
for j1=1:length(h2)
    patch(get(h2(j1),'XData'),get(h2(j1),'YData'),colors(j1,:),'FaceAlpha',0.6); %setting different colors for box plots
end

% Customize the axes
axis tickaligned
set(gca, 'TickDir', 'in');  % Ticks outward
set(gca, 'FontSize', 12,'FontWeight','bold');    % Tick labels fontsize
set(gca, 'Box', 'off');      % No ticks in top and right side
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')
% Set the tick lines thicker
ax1 = gca;
ax1.XAxis.LineWidth = 2; % Thickness for the x-axis tick lines
ax1.YAxis.LineWidth = 2; % Thickness for the y-axis tick lines
ax1.Layer = 'top';
tit1 = sprintf('%s',pre_earlyphase_time_forplot);
title(tit1,'FontSize', 14,'FontWeight','bold')
yline(0,'--k','LineWidth', 1)
% xlabel(pre_earlyphase_time_forplot, 'fontweight', 'bold', 'fontsize', 14);
% ylabel('RMS - Z scores', 'fontweight', 'bold', 'fontsize', 14);
tb = axtoolbar('default'); tb.Visible = 'off';

if stats == 1
    %Statistics and adding significance stars
    Sigstar_pre_earlyphase = bonfer_ttest2(Tim_win_data(:,:,2));
    %Plotting the significance stars in the plot
    sigstarplot_AUC_v2(Sigstar_pre_earlyphase,ons,start_value,end_value)
    ylim([a b])
elseif stats == 0
    ylim([a b])
end
hold off
set(gca,'XTick',[])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Earlyphase %%%
nexttile
hold on
bset3 = boxplot(Tim_win_data(:,:,3),'Widths',0.4);
set(bset3,{'linew'},{2})
h3 = findobj(gca,'Tag','Box');
for j1=1:length(h3)
    patch(get(h3(j1),'XData'),get(h3(j1),'YData'),colors(j1,:),'FaceAlpha',0.6); %setting different colors for box plots
end

% Customize the axes
axis tickaligned
set(gca, 'TickDir', 'in');  % Ticks outward
set(gca, 'FontSize', 12,'FontWeight','bold');    % Tick labels fontsize
set(gca, 'Box', 'off');      % No ticks in top and right side
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')
% Set the tick lines thicker
ax1 = gca;
ax1.XAxis.LineWidth = 2; % Thickness for the x-axis tick lines
ax1.YAxis.LineWidth = 2; % Thickness for the y-axis tick lines
ax1.Layer = 'top';
tit1 = sprintf('%s',earlyphase_time_forplot);
title(tit1,'FontSize', 14,'FontWeight','bold')
yline(0,'--k','LineWidth', 1)
% xlabel(earlyphase_time_forplot, 'fontweight', 'bold', 'fontsize', 14);
% ylabel('RMS - Z scores', 'fontweight', 'bold', 'fontsize', 14);
tb = axtoolbar('default'); tb.Visible = 'off';

if stats == 1
    %Statistics and adding significance stars
    Sigstar_earlyphase = bonfer_ttest2(Tim_win_data(:,:,3));
    %Plotting the significance stars in the plot
    sigstarplot_AUC_v2(Sigstar_earlyphase,ons,start_value,end_value)
    ylim([a b])
elseif stats == 0
    ylim([a b])
end
hold off
set(gca,'XTick',[])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Latephase %%%
nexttile
hold on
bset4 = boxplot(Tim_win_data(:,:,4),'Widths',0.4);
set(bset4,{'linew'},{2})
h4 = findobj(gca,'Tag','Box');
for j1=1:length(h4)
    patch(get(h4(j1),'XData'),get(h4(j1),'YData'),colors(j1,:),'FaceAlpha',0.6); %setting different colors for box plots
end

% Customize the axes
axis tickaligned
set(gca, 'TickDir', 'in');  % Ticks outward
set(gca, 'FontSize', 12,'FontWeight','bold');    % Tick labels fontsize
set(gca, 'Box', 'off');      % No ticks in top and right side
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')
% Set the tick lines thicker
ax1 = gca;
ax1.XAxis.LineWidth = 2; % Thickness for the x-axis tick lines
ax1.YAxis.LineWidth = 2; % Thickness for the y-axis tick lines
ax1.Layer = 'top';
tit1 = sprintf('%s',latephase_time_forplot);
title(tit1,'FontSize', 14,'FontWeight','bold')
yline(0,'--k','LineWidth', 1)
% xlabel(latephase_time_forplot, 'fontweight', 'bold', 'fontsize', 14);
% ylabel('RMS - Z scores', 'fontweight', 'bold', 'fontsize', 14);
tb = axtoolbar('default'); tb.Visible = 'off';

if stats == 1
    %Statistics and adding significance stars
    Sigstar_latephase = bonfer_ttest2(Tim_win_data(:,:,4));
    %Plotting the significance stars in the plot
    sigstarplot_AUC_v2(Sigstar_latephase,ons,start_value,end_value)
    ylim([a b])
elseif stats == 0
    ylim([a b])
end
hold off
set(gca,'XTick',[])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Latephase II %%%
nexttile
hold on
bset5 = boxplot(Tim_win_data(:,:,5),'Widths',0.4);
set(bset5,{'linew'},{2})
h5 = findobj(gca,'Tag','Box');
for j1=1:length(h5)
    patch(get(h5(j1),'XData'),get(h5(j1),'YData'),colors(j1,:),'FaceAlpha',0.6); %setting different colors for box plots
end

% Customize the axes
axis tickaligned
set(gca, 'TickDir', 'in');  % Ticks outward
set(gca, 'FontSize', 12,'FontWeight','bold');    % Tick labels fontsize
set(gca, 'Box', 'off');      % No ticks in top and right side
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')
% Set the tick lines thicker
ax1 = gca;
ax1.XAxis.LineWidth = 2; % Thickness for the x-axis tick lines
ax1.YAxis.LineWidth = 2; % Thickness for the y-axis tick lines
ax1.Layer = 'top';
tit1 = sprintf('%s',latephase2_time_forplot);
title(tit1,'FontSize', 14,'FontWeight','bold')
yline(0,'--k','LineWidth', 1)
% xlabel(latephase2_time_forplot, 'fontweight', 'bold', 'fontsize', 14);
% ylabel('RMS - Z scores', 'fontweight', 'bold', 'fontsize', 14);
tb = axtoolbar('default'); tb.Visible = 'off';

if stats == 1
    %Statistics and adding significance stars
    Sigstar_latephase2 = bonfer_ttest2(Tim_win_data(:,:,5));
    %Plotting the significance stars in the plot
    sigstarplot_AUC_v2(Sigstar_latephase2,ons,start_value,end_value)
    ylim([a b])
elseif stats == 0
    ylim([a b])
end
hold off
set(gca,'XTick',[])

% Customize the whole plot
xlabel(tl,'Pokes before leaving','FontSize',18,'FontWeight','bold','FontName','Arial')
ylabel(tl,'AUC','FontSize',18,'FontWeight','bold','FontName','Arial')
fig_grp_tit = sprintf('LRP_to_LP_analysis: %s: %s: %s',wh_tit,fig_name1,layer);
title(tl,fig_grp_tit,'FontSize',18,'FontWeight','bold','FontName','Arial','Interpreter','none')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 3. Plotting the subplots of different time points (4 pokes) with statistics (Scatter plots)
% plotting only the first 5 time windows

num_groups = size(Tim_win_data, 2); % No. of groups
x_positions = 1:num_groups;  % x_positions

figure('WindowState', 'maximized');
tl = tiledlayout(1,5);

%%% Super earlyphase %%%
data1 =  Tim_win_data(:,:,1); % Super_earlyphase data
mean_vals1 = mean(data1,'omitnan');     % mean of the data
SE_vals1 = std(data1) ./ sqrt(size(data1,1));   % SE of the data

% Create figure
nexttile
hold on

% Scatter plot of individual data points with different colors
for i = 1:num_groups
    scatter(repmat(x_positions(i), size(data1,1), 1), data1(:,i), 60, colors1(i,:), 'filled', 'MarkerFaceAlpha', 0.7);  % scatter plot
end

% Plot mean values as larger markers with the same color
for i = 1:num_groups
    plot(x_positions(i), mean_vals1(i), 'o', 'MarkerSize', 12, 'MarkerFaceColor', colors1(i,:), 'MarkerEdgeColor', 'k'); % mean
end

% Add error bars (mean ± SE)
errorbar(x_positions, mean_vals1, SE_vals1, 'k', 'LineStyle', 'none', 'LineWidth', 1.5);  % errorbars

% Adding lineplots
plot(mean_vals1,'color', 'k', 'LineWidth', 1.5);

% Customize the axes
axis tickaligned
set(gca, 'TickDir', 'in');  % Ticks outward
set(gca, 'FontSize', 12,'FontWeight','bold');    % Tick labels fontsize
set(gca, 'Box', 'off');      % No ticks in top and right side
set(gca,'XTick',x_positions)
set(gca,'XTickLabel','')
% Set the tick lines thicker
ax1 = gca;
ax1.XAxis.LineWidth = 2; % Thickness for the x-axis tick lines
ax1.YAxis.LineWidth = 2; % Thickness for the y-axis tick lines
ax1.Layer = 'top';
tit1 = sprintf('%s',super_earlyphase_time_forplot);
title(tit1,'FontSize', 14,'FontWeight','bold')
yline(0,'--k','LineWidth', 1)
xl=xlim; % getting the limits from the plot
xlim([xl(1)-0.5,xl(2)+0.5])
tb = axtoolbar('default'); tb.Visible = 'off';

if stats == 1
    %Statistics and adding significance stars
    Sigstar_super_earlyphase = bonfer_ttest2(Tim_win_data(:,:,1));
    %Plotting the significance stars in the plot
    sigstarplot_AUC_v2(Sigstar_super_earlyphase,ons,start_value,end_value)
    ylim([a b])
elseif stats == 0
    ylim([a b])
end
hold off
set(gca,'XTick',[])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Pre earlyphase %%%
data2 =  Tim_win_data(:,:,2); % Super_earlyphase data
mean_vals2 = mean(data2,'omitnan');     % mean of the data
SE_vals2 = std(data2) ./ sqrt(size(data2,1));   % SE of the data

% Create figure
nexttile
hold on

% Scatter plot of individual data points with different colors1
for i = 1:num_groups
    scatter(repmat(x_positions(i), size(data2,1), 1), data2(:,i), 60, colors1(i,:), 'filled', 'MarkerFaceAlpha', 0.7);  % scatter plot
end

% Plot mean values as larger markers with the same color
for i = 1:num_groups
    plot(x_positions(i), mean_vals2(i), 'o', 'MarkerSize', 12, 'MarkerFaceColor', colors1(i,:), 'MarkerEdgeColor', 'k'); % mean
end

% Add error bars (mean ± SE)
errorbar(x_positions, mean_vals2, SE_vals2, 'k', 'LineStyle', 'none', 'LineWidth', 1.5);  % errorbars

% Adding lineplots
plot(mean_vals2,'color', 'k', 'LineWidth', 1.5);

% Customize the axes
axis tickaligned
set(gca, 'TickDir', 'in');  % Ticks outward
set(gca, 'FontSize', 12,'FontWeight','bold');    % Tick labels fontsize
set(gca, 'Box', 'off');      % No ticks in top and right side
set(gca,'XTick',x_positions)
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')
% Set the tick lines thicker
ax1 = gca;
ax1.XAxis.LineWidth = 2; % Thickness for the x-axis tick lines
ax1.YAxis.LineWidth = 2; % Thickness for the y-axis tick lines
ax1.Layer = 'top';
tit1 = sprintf('%s',pre_earlyphase_time_forplot);
title(tit1,'FontSize', 14,'FontWeight','bold')
yline(0,'--k','LineWidth', 1)
xl=xlim; % getting the limits from the plot
xlim([xl(1)-0.5,xl(2)+0.5])
tb = axtoolbar('default'); tb.Visible = 'off';

if stats == 1
    %Statistics and adding significance stars
    Sigstar_pre_earlyphase = bonfer_ttest2(Tim_win_data(:,:,2));
    %Plotting the significance stars in the plot
    sigstarplot_AUC_v2(Sigstar_pre_earlyphase,ons,start_value,end_value)
    ylim([a b])
elseif stats == 0
    ylim([a b])
end
hold off
set(gca,'XTick',[])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Earlyphase %%%
data3 =  Tim_win_data(:,:,3); % Super_earlyphase data
mean_vals3 = mean(data3,'omitnan');     % mean of the data
SE_vals3 = std(data3) ./ sqrt(size(data3,1));   % SE of the data

% Create figure
nexttile
hold on

% Scatter plot of individual data points with different colors
for i = 1:num_groups
    scatter(repmat(x_positions(i), size(data3,1), 1), data3(:,i), 60, colors1(i,:), 'filled', 'MarkerFaceAlpha', 0.7);  % scatter plot
end

% Plot mean values as larger markers with the same color
for i = 1:num_groups
    plot(x_positions(i), mean_vals3(i), 'o', 'MarkerSize', 12, 'MarkerFaceColor', colors1(i,:), 'MarkerEdgeColor', 'k'); % mean
end

% Add error bars (mean ± SE)
errorbar(x_positions, mean_vals3, SE_vals3, 'k', 'LineStyle', 'none', 'LineWidth', 1.5);  % errorbars

% Adding lineplots
plot(mean_vals3,'color', 'k', 'LineWidth', 1.5);

% Customize the axes
axis tickaligned
set(gca, 'TickDir', 'in');  % Ticks outward
set(gca, 'FontSize', 12,'FontWeight','bold');    % Tick labels fontsize
set(gca, 'Box', 'off');      % No ticks in top and right side
set(gca,'XTick',x_positions)
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')
% Set the tick lines thicker
ax1 = gca;
ax1.XAxis.LineWidth = 2; % Thickness for the x-axis tick lines
ax1.YAxis.LineWidth = 2; % Thickness for the y-axis tick lines
ax1.Layer = 'top';
tit1 = sprintf('%s',earlyphase_time_forplot);
title(tit1,'FontSize', 14,'FontWeight','bold')
yline(0,'--k','LineWidth', 1)
xl=xlim; % getting the limits from the plot
xlim([xl(1)-0.5,xl(2)+0.5])
tb = axtoolbar('default'); tb.Visible = 'off';

if stats == 1
    %Statistics and adding significance stars
    Sigstar_earlyphase = bonfer_ttest2(Tim_win_data(:,:,3));
    %Plotting the significance stars in the plot
    sigstarplot_AUC_v2(Sigstar_earlyphase,ons,start_value,end_value)
    ylim([a b])
elseif stats == 0
    ylim([a b])
end
hold off
set(gca,'XTick',[])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Latephase %%%
data4 =  Tim_win_data(:,:,4); % Super_earlyphase data
mean_vals4 = mean(data4,'omitnan');     % mean of the data
SE_vals4 = std(data4) ./ sqrt(size(data4,1));   % SE of the data

% Create figure
nexttile
hold on

% Scatter plot of individual data points with different colors
for i = 1:num_groups
    scatter(repmat(x_positions(i), size(data4,1), 1), data4(:,i), 60, colors1(i,:), 'filled', 'MarkerFaceAlpha', 0.7);  % scatter plot
end

% Plot mean values as larger markers with the same color
for i = 1:num_groups
    plot(x_positions(i), mean_vals4(i), 'o', 'MarkerSize', 12, 'MarkerFaceColor', colors1(i,:), 'MarkerEdgeColor', 'k'); % mean
end

% Add error bars (mean ± SE)
errorbar(x_positions, mean_vals4, SE_vals4, 'k', 'LineStyle', 'none', 'LineWidth', 1.5);  % errorbars

% Adding lineplots
plot(mean_vals4,'color', 'k', 'LineWidth', 1.5);

% Customize the axes
axis tickaligned
set(gca, 'TickDir', 'in');  % Ticks outward
set(gca, 'FontSize', 12,'FontWeight','bold');    % Tick labels fontsize
set(gca, 'Box', 'off');      % No ticks in top and right side
set(gca,'XTick',x_positions)
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')
% Set the tick lines thicker
ax1 = gca;
ax1.XAxis.LineWidth = 2; % Thickness for the x-axis tick lines
ax1.YAxis.LineWidth = 2; % Thickness for the y-axis tick lines
ax1.Layer = 'top';
tit1 = sprintf('%s',latephase_time_forplot);
title(tit1,'FontSize', 14,'FontWeight','bold')
yline(0,'--k','LineWidth', 1)
xl=xlim; % getting the limits from the plot
xlim([xl(1)-0.5,xl(2)+0.5])
tb = axtoolbar('default'); tb.Visible = 'off';

if stats == 1
    %Statistics and adding significance stars
    Sigstar_latephase = bonfer_ttest2(Tim_win_data(:,:,4));
    %Plotting the significance stars in the plot
    sigstarplot_AUC_v2(Sigstar_latephase,ons,start_value,end_value)
    ylim([a b])
elseif stats == 0
    ylim([a b])
end
hold off
set(gca,'XTick',[])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Latephase II %%%
data5 =  Tim_win_data(:,:,5); % Super_earlyphase data
mean_vals5 = mean(data5,'omitnan');     % mean of the data
SE_vals5 = std(data5) ./ sqrt(size(data5,1));   % SE of the data

% Create figure
nexttile
hold on

% Scatter plot of individual data points with different colors
for i = 1:num_groups
    scatter(repmat(x_positions(i), size(data5,1), 1), data5(:,i), 60, colors1(i,:), 'filled', 'MarkerFaceAlpha', 0.7);  % scatter plot
end

% Plot mean values as larger markers with the same color
for i = 1:num_groups
    plot(x_positions(i), mean_vals5(i), 'o', 'MarkerSize', 12, 'MarkerFaceColor', colors1(i,:), 'MarkerEdgeColor', 'k'); % mean
end

% Add error bars (mean ± SE)
errorbar(x_positions, mean_vals5, SE_vals5, 'k', 'LineStyle', 'none', 'LineWidth', 1.5);  % errorbars

% Adding lineplots
plot(mean_vals5,'color', 'k', 'LineWidth', 1.5);

% Customize the axes
axis tickaligned
set(gca, 'TickDir', 'in');  % Ticks outward
set(gca, 'FontSize', 12,'FontWeight','bold');    % Tick labels fontsize
set(gca, 'Box', 'off');      % No ticks in top and right side
set(gca,'XTick',x_positions)
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')
% Set the tick lines thicker
ax1 = gca;
ax1.XAxis.LineWidth = 2; % Thickness for the x-axis tick lines
ax1.YAxis.LineWidth = 2; % Thickness for the y-axis tick lines
ax1.Layer = 'top';
tit1 = sprintf('%s',latephase2_time_forplot);
title(tit1,'FontSize', 14,'FontWeight','bold')
yline(0,'--k','LineWidth', 1)
xl=xlim; % getting the limits from the plot
xlim([xl(1)-0.5,xl(2)+0.5])
tb = axtoolbar('default'); tb.Visible = 'off';

if stats == 1
    %Statistics and adding significance stars
    Sigstar_latephase2 = bonfer_ttest2(Tim_win_data(:,:,5));
    %Plotting the significance stars in the plot
    sigstarplot_AUC_v2(Sigstar_latephase2,ons,start_value,end_value)
    ylim([a b])
elseif stats == 0
    ylim([a b])
end
hold off
set(gca,'XTick',[])

% Customize the whole plot
xlabel(tl,'Pokes before leaving','FontSize',18,'FontWeight','bold','FontName','Arial')
ylabel(tl,'AUC','FontSize',18,'FontWeight','bold','FontName','Arial')
fig_grp_tit = sprintf('LRP_to_LP_analysis: %s: %s: %s',wh_tit,fig_name1,layer);
title(tl,fig_grp_tit,'FontSize',18,'FontWeight','bold','FontName','Arial','Interpreter','none')

end