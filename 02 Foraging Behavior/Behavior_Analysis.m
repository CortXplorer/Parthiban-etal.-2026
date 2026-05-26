% Parthiban etal., 2026
% Script for different behavioral parameters of the probabilistic foraging task

clear variables
close all
clc

% Loading the Behavioral data
load('D:\Own papers of journals\02 Foraging_Manuscript\06 Final Submission\DATA\Behavior\Behavior_Foraging.mat')

%%%% Load the "Behavior_Foraging" mat file from your folder here %%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Plotting for different behavioral parameters
% Boxplots

% Initializing the variables for plotting
colors = [0.15, 0.15, 0.15; 0.45, 0.45, 0.45; 0.85, 0.85, 0.85];
Grps = {'A = 0.5','A = 0.75','A = 1'};
x_ticks = 1:1:3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('WindowState', 'maximized');
tl = tiledlayout(2,3);

% 1. Time spent in the spout
nexttile
hold on
bset1 = boxplot(Behavior.Resident_Time,'Widths',0.4);
set(bset1,{'linew'},{2})
h1 = findobj(gca,'Tag','Box');
for j1=1:length(h1)
    patch(get(h1(j1),'XData'),get(h1(j1),'YData'),colors(j1,:),'FaceAlpha',0.6); %setting different colors for box plots
end

% Customize the axes
axis tickaligned
set(gca, 'TickDir', 'out');  % Ticks outward
set(gca, 'FontSize', 12,'FontWeight','bold');    % Tick labels fontsize
set(gca, 'Box', 'off');      % No ticks in top and right side
set(gca,'XTickLabel',Grps)
% Set the tick lines thicker
ax1 = gca;
ax1.XAxis.LineWidth = 2; % Thickness for the x-axis tick lines
ax1.YAxis.LineWidth = 2; % Thickness for the y-axis tick lines
ax1.Layer = 'top';
title('Residence Time','FontSize', 18,'FontWeight','bold','Interpreter','none')
% xlabel('Starting Probabilities', 'fontweight', 'bold', 'fontsize', 18);
ylabel('Time (s)', 'fontweight', 'bold', 'fontsize', 18,'Interpreter','none');
xl=xlim; % getting the limits from the plot
xlim([xl(1)-0.5,xl(2)+0.5])
tb = axtoolbar('default'); tb.Visible = 'off';

%Statistics and adding significance stars
Sigstar_Fin_MM = bonfer_ttest2(Behavior.Resident_Time);
%Plotting the significance stars in the plot
sigstarplot_AUC_v2_beh(Sigstar_Fin_MM,1,26,32)
ylim([5 32])
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 2. Total hit pokes
nexttile
hold on
bset1 = boxplot(Behavior.Total_Valid_Pokes,'Widths',0.4);
set(bset1,{'linew'},{2})
h1 = findobj(gca,'Tag','Box');
for j1=1:length(h1)
    patch(get(h1(j1),'XData'),get(h1(j1),'YData'),colors(j1,:),'FaceAlpha',0.6); %setting different colors for box plots
end

% Customize the axes
axis tickaligned
set(gca, 'TickDir', 'out');  % Ticks outward
set(gca, 'FontSize', 12,'FontWeight','bold');    % Tick labels fontsize
set(gca, 'Box', 'off');      % No ticks in top and right side
set(gca,'XTickLabel',Grps)
% Set the tick lines thicker
ax1 = gca;
ax1.XAxis.LineWidth = 2; % Thickness for the x-axis tick lines
ax1.YAxis.LineWidth = 2; % Thickness for the y-axis tick lines
ax1.Layer = 'top';
title('Total hit pokes','FontSize', 18,'FontWeight','bold','Interpreter','none')
% xlabel('Starting Probabilities', 'fontweight', 'bold', 'fontsize', 18);
ylabel('Pokes', 'fontweight', 'bold', 'fontsize', 18,'Interpreter','none');
xl=xlim; % getting the limits from the plot
xlim([xl(1)-0.5,xl(2)+0.5])
tb = axtoolbar('default'); tb.Visible = 'off';

%Statistics and adding significance stars
Sigstar_Fin_MM = bonfer_ttest2(Behavior.Total_Valid_Pokes);
%Plotting the significance stars in the plot
sigstarplot_AUC_v2_beh(Sigstar_Fin_MM,1,12,15)
ylim([5 14])
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 3. Rewards
nexttile
hold on
bset1 = boxplot(Behavior.Rewards,'Widths',0.4);
set(bset1,{'linew'},{2})
h1 = findobj(gca,'Tag','Box');
for j1=1:length(h1)
    patch(get(h1(j1),'XData'),get(h1(j1),'YData'),colors(j1,:),'FaceAlpha',0.6); %setting different colors for box plots
end

% Customize the axes
axis tickaligned
set(gca, 'TickDir', 'out');  % Ticks outward
set(gca, 'FontSize', 12,'FontWeight','bold');    % Tick labels fontsize
set(gca, 'Box', 'off');      % No ticks in top and right side
set(gca,'XTickLabel',Grps)
% Set the tick lines thicker
ax1 = gca;
ax1.XAxis.LineWidth = 2; % Thickness for the x-axis tick lines
ax1.YAxis.LineWidth = 2; % Thickness for the y-axis tick lines
ax1.Layer = 'top';
title('Rewards','FontSize', 18,'FontWeight','bold','Interpreter','none')
% xlabel('Starting Probabilities', 'fontweight', 'bold', 'fontsize', 18);
ylabel('No. of Rewards', 'fontweight', 'bold', 'fontsize', 18,'Interpreter','none');
xl=xlim; % getting the limits from the plot
xlim([xl(1)-0.5,xl(2)+0.5])
tb = axtoolbar('default'); tb.Visible = 'off';

%Statistics and adding significance stars
Sigstar_Fin_MM = bonfer_ttest2(Behavior.Rewards);
%Plotting the significance stars in the plot
sigstarplot_AUC_v2_beh(Sigstar_Fin_MM,1,5.5,8)
ylim([1 7])
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 4. Hit poke rate
nexttile
hold on
bset1 = boxplot(Behavior.Valid_Poke_Rate,'Widths',0.4);
set(bset1,{'linew'},{2})
h1 = findobj(gca,'Tag','Box');
for j1=1:length(h1)
    patch(get(h1(j1),'XData'),get(h1(j1),'YData'),colors(j1,:),'FaceAlpha',0.6); %setting different colors for box plots
end

% Customize the axes
axis tickaligned
set(gca, 'TickDir', 'out');  % Ticks outward
set(gca, 'FontSize', 12,'FontWeight','bold');    % Tick labels fontsize
set(gca, 'Box', 'off');      % No ticks in top and right side
set(gca,'XTickLabel',Grps)
% Set the tick lines thicker
ax1 = gca;
ax1.XAxis.LineWidth = 2; % Thickness for the x-axis tick lines
ax1.YAxis.LineWidth = 2; % Thickness for the y-axis tick lines
ax1.Layer = 'top';
title('Hit poke rate','FontSize', 18,'FontWeight','bold','Interpreter','none')
% xlabel('Starting Probabilities', 'fontweight', 'bold', 'fontsize', 18);
ylabel('Pokes/s', 'fontweight', 'bold', 'fontsize', 18,'Interpreter','none');
xl=xlim; % getting the limits from the plot
xlim([xl(1)-0.5,xl(2)+0.5])
tb = axtoolbar('default'); tb.Visible = 'off';

%Statistics and adding significance stars
Sigstar_Fin_MM = bonfer_ttest2(Behavior.Valid_Poke_Rate);
%Plotting the significance stars in the plot
sigstarplot_AUC_v2_beh(Sigstar_Fin_MM,1,0.9,1.1)
ylim([0.4 1.1])
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 5. Consectuvie unrewarded hit pokes
nexttile
hold on
bset1 = boxplot(Behavior.Unrewarded_Streak,'Widths',0.4);
set(bset1,{'linew'},{2})
h1 = findobj(gca,'Tag','Box');
for j1=1:length(h1)
    patch(get(h1(j1),'XData'),get(h1(j1),'YData'),colors(j1,:),'FaceAlpha',0.6); %setting different colors for box plots
end

% Customize the axes
axis tickaligned
set(gca, 'TickDir', 'out');  % Ticks outward
set(gca, 'FontSize', 12,'FontWeight','bold');    % Tick labels fontsize
set(gca, 'Box', 'off');      % No ticks in top and right side
set(gca,'XTickLabel',Grps)
% Set the tick lines thicker
ax1 = gca;
ax1.XAxis.LineWidth = 2; % Thickness for the x-axis tick lines
ax1.YAxis.LineWidth = 2; % Thickness for the y-axis tick lines
ax1.Layer = 'top';
title('Unrewarded Streak','FontSize', 18,'FontWeight','bold','Interpreter','none')
% xlabel('Starting Probabilities', 'fontweight', 'bold', 'fontsize', 18);
ylabel('No. of pokes', 'fontweight', 'bold', 'fontsize', 18,'Interpreter','none');
xl=xlim; % getting the limits from the plot
xlim([xl(1)-0.5,xl(2)+0.5])
tb = axtoolbar('default'); tb.Visible = 'off';

%Statistics and adding significance stars
Sigstar_Fin_MM = bonfer_ttest2(Behavior.Unrewarded_Streak);
%Plotting the significance stars in the plot
sigstarplot_AUC_v2_beh(Sigstar_Fin_MM,1,4,5)
ylim([1.5 4.5])
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 6. Giving up time
nexttile
hold on
bset1 = boxplot(Behavior.Giving_Up_Time,'Widths',0.4);
set(bset1,{'linew'},{2})
h1 = findobj(gca,'Tag','Box');
for j1=1:length(h1)
    patch(get(h1(j1),'XData'),get(h1(j1),'YData'),colors(j1,:),'FaceAlpha',0.6); %setting different colors for box plots
end

% Customize the axes
axis tickaligned
set(gca, 'TickDir', 'out');  % Ticks outward
set(gca, 'FontSize', 12,'FontWeight','bold');    % Tick labels fontsize
set(gca, 'Box', 'off');      % No ticks in top and right side
set(gca,'XTickLabel',Grps)
% Set the tick lines thicker
ax1 = gca;
ax1.XAxis.LineWidth = 2; % Thickness for the x-axis tick lines
ax1.YAxis.LineWidth = 2; % Thickness for the y-axis tick lines
ax1.Layer = 'top';
title('Giving up time','FontSize', 18,'FontWeight','bold','Interpreter','none')
% xlabel('Starting Probabilities', 'fontweight', 'bold', 'fontsize', 18);
ylabel('Time (s)', 'fontweight', 'bold', 'fontsize', 18,'Interpreter','none');
xl=xlim; % getting the limits from the plot
xlim([xl(1)-0.5,xl(2)+0.5])
tb = axtoolbar('default'); tb.Visible = 'off';

%Statistics and adding significance stars
Sigstar_Fin_MM = bonfer_ttest2(Behavior.Giving_Up_Time);
%Plotting the significance stars in the plot
sigstarplot_AUC_v2_beh(Sigstar_Fin_MM,1,8,11)
ylim([3 10])
hold off

% Customize the whole plot
xlabel(tl,'Starting Probabilities','FontSize',18,'FontWeight','bold','FontName','Arial')
title(tl,'Foraging - Behavioral analysis','FontSize',18,'FontWeight','bold','FontName','Arial','Interpreter','none')

fig = gcf;
fig.Color = 'w';                          % white background for the figure

axs = findall(fig,'Type','axes');
for ax = axs'
    ax.Color = 'w';                       % white plot box background
    ax.XColor = 'k'; ax.YColor = 'k';     % black axis/tick labels
    ax.Title.Color = 'k';                 % black title text
    ax.LabelFontSizeMultiplier = 1.1;
end























