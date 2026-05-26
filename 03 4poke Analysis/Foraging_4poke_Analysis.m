% Parthiban etal., 2026
% Script for analysis of 4 different pokes observed during the probabilistic foraging task

clear variables
close all
clc

% Loading the data
load('D:\Own papers of journals\02 Foraging_Manuscript\06 Final Submission\DATA\4Pokes\Ephys_4Pokes.mat')

%%%% Load the "Ephys_4Pokes" mat file from your folder here %%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Plotting the 4 different pokes of the foraging task

% Layers for analysis
layers={'SGS1','GS1','layer5a','layer5b','layer6'};
fig_name1 = sprintf('4.65 Br');

% Overall AVRECs (Smooth)
Trim_plot_4pokes (Four_Pokes.z_norm.Overall,Four_Pokes.AUC.Overall, 'Bc_smooth_AVREC',fig_name1,'Overall',1,-1500,3300,1,2000,3000,-1.2,3.5)

% Layerwise Averaged CSDs (Smooth)

for layer_id = 1:length(layers)
    if strcmp(layers{layer_id}, 'SGS1')
        Trim_plot_4pokes (Four_Pokes.z_norm.SGS1,Four_Pokes.AUC.SGS1, 'Best3ch_Bc_smooth_Averaged_CSDs',fig_name1,layers{layer_id},1,-1500,3300,1,2000,3000,-1.2,3)

    elseif strcmp(layers{layer_id}, 'GS1')
        Trim_plot_4pokes (Four_Pokes.z_norm.GS1,Four_Pokes.AUC.GS1, 'Best3ch_Bc_smooth_Averaged_CSDs',fig_name1,layers{layer_id},1,-1500,3300,1,2000,3000,-1.2,3)

    elseif strcmp(layers{layer_id}, 'layer5a')
        Trim_plot_4pokes (Four_Pokes.z_norm.lay5a,Four_Pokes.AUC.lay5a, 'Best3ch_Bc_smooth_Averaged_CSDs',fig_name1,layers{layer_id},1,-1500,3300,1,2000,3000,-1.2,3)

    elseif strcmp(layers{layer_id}, 'layer5b')
        Trim_plot_4pokes (Four_Pokes.z_norm.lay5b,Four_Pokes.AUC.lay5b, 'Best3ch_Bc_smooth_Averaged_CSDs',fig_name1,layers{layer_id},1,-1500,3300,1,2000,3000,-1.2,3)

    elseif strcmp(layers{layer_id}, 'layer6')
        Trim_plot_4pokes (Four_Pokes.z_norm.lay6,Four_Pokes.AUC.lay6, 'Best3ch_Bc_smooth_Averaged_CSDs',fig_name1,layers{layer_id},1,-1500,3300,1,2000,3000,-1.2,3)
    end
end



