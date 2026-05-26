% Parthiban etal., 2026
% Script for analysis of consecutive unrewarded pokes (before spout leaving)
% observed during the probabilistic foraging task

clear variables
close all
clc

% Loading the data
load('D:\Own papers of journals\02 Foraging_Manuscript\06 Final Submission\DATA\Unrewarded_Streak\Ephys_UR_Streak.mat')

%%%% Load the "Ephys_UR_Streak" mat file from your folder here %%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Plotting the consecutive unrewarded pokes of the foraging task

% Layers for analysis
layers={'SGS1','GS1','layer5a','layer5b','layer6'};
fig_name1 = sprintf('4.65 Br');

% Overall AVRECs (Smooth)
Trim_plot_lrp_lp (UR_Pokes.z_norm.Overall,UR_Pokes.AUC.Overall, 'Bc_smooth_AVREC',fig_name1,'Overall',1,-1000,2300,1,1500,2100,-1,3)

% Layerwise Averaged CSDs (Smooth)

for layer_id = 1:length(layers)
    if strcmp(layers{layer_id}, 'SGS1')
        Trim_plot_lrp_lp (UR_Pokes.z_norm.SGS1,UR_Pokes.AUC.SGS1, 'B3_Bc_smooth_Avg_CSDs',fig_name1,layers{layer_id},1,-1500,2300,1,1500,2100,-1,2.5)

    elseif strcmp(layers{layer_id}, 'GS1')
        Trim_plot_lrp_lp (UR_Pokes.z_norm.GS1,UR_Pokes.AUC.GS1, 'B3_Bc_smooth_Avg_CSDs',fig_name1,layers{layer_id},1,-1500,2300,1,1700,2100,-1,2.5)

    elseif strcmp(layers{layer_id}, 'layer5a')
        Trim_plot_lrp_lp (UR_Pokes.z_norm.lay5a,UR_Pokes.AUC.lay5a, 'B3_Bc_smooth_Avg_CSDs',fig_name1,layers{layer_id},1,-1500,2300,1,1700,2100,-1,2.5)

    elseif strcmp(layers{layer_id}, 'layer5b')
        Trim_plot_lrp_lp (UR_Pokes.z_norm.lay5b,UR_Pokes.AUC.lay5b, 'B3_Bc_smooth_Avg_CSDs',fig_name1,layers{layer_id},1,-1500,2300,1,1700,2100,-1,2.5)

    elseif strcmp(layers{layer_id}, 'layer6')
        Trim_plot_lrp_lp (UR_Pokes.z_norm.lay6,UR_Pokes.AUC.lay6, 'B3_Bc_smooth_Avg_CSDs',fig_name1,layers{layer_id},1,-1500,2300,1,1500,2000,-1,2.5)
    end
end

