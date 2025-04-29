%% Figure 6 Plotting Script for "Identifying the effectiveness of face mask in a large population 
%% with a network-based fluid model"
%%
%% Authors: Akshay Anand and Kourosh Shoele
%% Florida A&M University - Florida State University, Tallahassee, FL
%% Date: April 2025
%%
%% Description: This script generates Figures 6a-f from the paper, showing the contribution 
%% of through-mask leakages from the cavity and channel network distributed along the 
%% periphery of the mask for different porosity values.
%%
%% Usage: Run this script from the scripts directory of the repository. It will:
%%   1. Read data from ../data/ directory
%%   2. Create ../plots/fig6/ directory if it doesn't exist
%%   3. Generate and save plots in multiple formats to the ../plots/fig6/ directory

close all;
clear all;

% Determine repository paths for data files and output plots
repo_root = fileparts(fileparts(mfilename('fullpath'))); % Go up one level from scripts dir
data_path = fullfile(repo_root, 'data');
plots_path = fullfile(repo_root, 'plots', 'fig6');

% Create the output directory if it doesn't exist
if ~exist(plots_path, 'dir')
    fprintf('Creating output directory: %s\n', plots_path);
    [status, msg] = mkdir(plots_path);
    if ~status
        error('Failed to create output directory: %s', msg);
    end
end

data_file = fullfile(data_path, 'data_for_figure_6.mat');

% Check if the file exists before loading
if exist(data_file, 'file')
    fprintf('Loading data from: %s\n', data_file);
    load(data_file);
else
    error('File %s not found. Please check the data directory path.', data_file);
end


% Define the figure letters and corresponding data indices
fig_letters = {'a', 'b', 'c', 'd', 'e', 'f'};
data_pairs = {[2, 3], [4, 5], [6, 7], [8, 9], [10, 11], [12, 13]};
title_values = {'100', '500', '1000', '100', '500', '1000'};
ylabel_indices = [1, 0, 0, 1, 0, 0]; % 1 for figures that need y-label, 0 for others

% Main loop to process all figures
for i = 1:length(fig_letters)
    % Get data indices for the current figure
    data_idx = data_pairs{i};
    
    % Get title value and y-label flag
    ck_value = title_values{i};
    needs_ylabel = ylabel_indices(i);
    
    % Call the plotting function
    plot_and_save_figure(data_for_figure_6, fig_letters{i}, data_idx, ck_value, needs_ylabel, plots_path);
    fprintf('Successfully processed Figure 6%s\n', fig_letters{i});
end

fprintf('All figures have been plotted and saved to: %s\n', plots_path);

% Function to plot and save a single figure
function plot_and_save_figure(data, fig_letter, data_indices, ck_value, needs_ylabel, output_path)
    %% Font settings for consistency with paper formatting
    font_name = 'Times New Roman';
    font_axes = 18;
    font_legend = 18;
    font_axestitle = 12;
    font_title = 14;

    %% Margin settings for proper layout
    marginleft = 0.2;
    marginright = 0.1;
    marginbottom = 0.2;
    margintop = 0.1;

    %% Setting height and width of the plot
    widthIn = 5.3/2;
    heightIn = 2.1;

    % Extract and prepare data
    x1 = data(:,1)';
    [x2, ix] = sort(x1);
    x1 = x2;
    
    % Extract data series based on provided indices
    y1 = data(:, data_indices(1))';
    y2 = data(:, data_indices(2))';
    
    % Apply sorting
    y1 = y1(ix);
    y2 = y2(ix);
    
    % Create figure with adequate size
    figure('Position', [100, 100, 800, 600]);
    
    % Plot data series
    plot(x1, y1, '^b', 'LineWidth', 1); hold on;
    plot(x1, y2, 'ok', 'LineWidth', 1); hold on;
    
    % Add legend
    leg = legend('$Q_{m,cav}$', '$Q_{m,c}$', 'Interpreter', 'latex', 'Location', 'southwest');
    title(leg, ['$c_k = ' ck_value ' $ $(kg/m^2 \times s)$'], 'Interpreter', 'latex', 'FontSize', font_axestitle);
    grid on;
    
    % Add y-label for select figures (a and d)
    if needs_ylabel
        ylabel('$\%$', 'Interpreter', 'latex', 'FontName', font_name, 'FontSize', font_axestitle);
    end
    
    % Add x-label for all figures
    xlabel({'$\alpha$'}, 'Interpreter', 'latex', 'FontName', font_name, 'FontSize', font_axestitle);
    
    % Set x-axis properties
    xticks(-1.2:0.6:1.2);
    xlim([-1.2 1.2]);
    
    % Apply consistent font settings
    set(gca, 'FontName', 'Times New Roman', 'FontSize', font_axes);
    
    % Get position for annotation
    Pos = get(gca, 'Position');
    Postop = Pos(2) + Pos(4);
    Pos = get(gca, 'Outerposition');
    Posleft = Pos(1);

    % Add figure letter annotation
    annotation('textbox', [Posleft-0.00 Postop-0.00 0 0], 'String', ['$(' fig_letter ')$'], ...
        'EdgeColor', 'none', 'FontSize', font_title, 'FontName', font_name, 'Interpreter', 'latex', ...
        'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle');
    
    % Save the figure in multiple formats to the output directory
    base_filename = sprintf('figure_6%s', fig_letter);
    
    % Create file paths for each format
    fig_file = fullfile(output_path, [base_filename '.fig']);
    eps_file = fullfile(output_path, [base_filename '.eps']);
    jpg_file = fullfile(output_path, [base_filename '.jpg']);
    png_file = fullfile(output_path, [base_filename '.png']);
    emf_file = fullfile(output_path, [base_filename '.emf']);
    
    % Save all formats
    saveas(gcf, fig_file);                   % MATLAB figure
    saveas(gcf, eps_file, 'epsc');           % EPS for publication
    saveas(gcf, jpg_file, 'jpg');            % JPG for presentations
    saveas(gcf, png_file, 'png');            % PNG for web/presentations
    saveas(gcf, emf_file, 'emf');            % EMF for MS Office
    
    % Report successful save
    fprintf('Saved figure 6%s in multiple formats to %s\n', fig_letter, output_path);
    
    % Close the figure to prevent memory issues when processing multiple figures
    close(gcf);
end