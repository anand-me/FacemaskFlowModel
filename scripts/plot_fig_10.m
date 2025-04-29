%% Figure 10 Plotting Script for "Identifying the effectiveness of face mask in a large population 
%% with a network-based fluid model"
%%
%% Authors: Akshay Anand and Kourosh Shoele
%% Florida A&M University - Florida State University, Tallahassee, FL
%% Date: April 2025
%%
%% Description: This script generates Figure 10 plots showing peripheral leakage jet velocities
%% at the exit of mask periphery for different facial features (nose, chin, zygomatic arch, 
%% and cheeks) at different alpha values (-1.2 and 1.2).
%%
%% Usage: Run this script from the scripts directory of the repository. It will:
%%   1. Read data from ../data/ directory
%%   2. Create ../plots/fig10/ directory if it doesn't exist
%%   3. Generate and save plots in multiple formats to the ../plots/fig10/ directory

clear all;
close all;

% Determine repository paths for data files and output plots
repo_root = fileparts(fileparts(mfilename('fullpath'))); % Go up one level from scripts dir
data_path = fullfile(repo_root, 'data');
plots_path = fullfile(repo_root, 'plots', 'fig10');

% Create the output directory if it doesn't exist
if ~exist(plots_path, 'dir')
    fprintf('Creating output directory: %s\n', plots_path);
    [status, msg] = mkdir(plots_path);
    if ~status
        error('Failed to create output directory: %s', msg);
    end
end


data_files = {
    'data_for_jet_vel_nose.mat',
    'data_for_jet_vel_chin.mat',
    'data_for_jet_vel_zygo.mat',
    'data_for_jet_vel_cheek.mat'
};

% Load all data files
data = struct();
for i = 1:length(data_files)
    file_path = fullfile(data_path, data_files{i});
    if exist(file_path, 'file')
        fprintf('Loading data from: %s\n', file_path);
        file_data = load(file_path);
        
        % Extract the field name based on the filename
        [~, filename, ~] = fileparts(data_files{i});
        field_name = strrep(filename, 'data_for_', '');
        
        % Store the data in a struct
        data.(field_name) = file_data.(filename);
    else
        error('File %s not found. Please check the data directory path.', file_path);
    end
end

% Define the feature names and alpha values
features = {'jet_vel_nose', 'jet_vel_chin', 'jet_vel_zygo', 'jet_vel_cheek'};
alpha_values = {'-1.2', '1.2'};
subplot_letters = {'a', 'b', 'c', 'd'};

% Set common plotting parameters
font_name = 'Times New Roman';
font_axes = 18;
font_legend = 12;
font_axestitle = 18;
font_title = 18;

% Define feature display names and section colors
feature_display_names = {'Nose', 'Chin', 'Zygomatic Arch', 'Cheek'};
section_colors = {[0.9 1 0.8], [1 0.9 0.9], [1 0.95 0.7]}; % Light green, light red, light yellow

% Create plots for each feature and alpha value pairing
for i = 1:length(features)
    for j = 1:length(alpha_values)
        % Create figure
        figure('Position', [100, 100, 560, 420]);
        
        % Get data for the current feature
        current_data = data.(features{i});
        
        % Determine data columns based on alpha value
        if strcmp(alpha_values{j}, '-1.2')
            data_cols = [2, 3, 4]; % Data for alpha = -1.2
        else
            data_cols = [5, 6, 7]; % Data for alpha = 1.2
        end
        
        % Create color-coded background for the three facial regions
        % Chin (channels 1-8), Cheeks (channels 9-16), Nose (channels 17-24)
        ax = gca;
        
        % Chin section (1-8) - light green
        rectangle('Position', [1, 0, 8, 2.5], 'FaceColor', section_colors{1}, 'EdgeColor', 'none');
        hold on;
        
        % Cheeks section (9-16) - light red
        rectangle('Position', [9, 0, 8, 2.5], 'FaceColor', section_colors{2}, 'EdgeColor', 'none');
        
        % Nose section (17-24) - light yellow
        rectangle('Position', [17, 0, 8, 2.5], 'FaceColor', section_colors{3}, 'EdgeColor', 'none');
        
        % Plot data for section 1 (1-8) - Chin region
        plot(current_data(1:8, 1), current_data(1:8, data_cols(1)), '-k', 'LineWidth', 1); hold on;
        plot(current_data(1:8, 1), current_data(1:8, data_cols(2)), '-b', 'LineWidth', 1); hold on;
        plot(current_data(1:8, 1), current_data(1:8, data_cols(3)), '-r', 'LineWidth', 1); hold on;
        
        % Plot data for section 2 (9-16) - Cheeks region
        plot(current_data(9:16, 1), current_data(9:16, data_cols(1)), '-k', 'LineWidth', 1); hold on;
        plot(current_data(9:16, 1), current_data(9:16, data_cols(2)), '-b', 'LineWidth', 1); hold on;
        plot(current_data(9:16, 1), current_data(9:16, data_cols(3)), '-r', 'LineWidth', 1); hold on;
        
        % Plot data for section 3 (17-24) - Nose region
        % Per request, only plot black and blue lines (no red line) for channels 17-24
        plot(current_data(17:24, 1), current_data(17:24, data_cols(1)), '-k', 'LineWidth', 1); hold on;
        plot(current_data(17:24, 1), current_data(17:24, data_cols(2)), '-b', 'LineWidth', 1); hold on;
        % Red line is intentionally omitted for the nose region (17-24)
        
        % Add section labels in the middle of each colored section
        text(4, 0.1, 'Chin', 'FontName', font_name, 'FontSize', 12, 'HorizontalAlignment', 'center');
        text(12, 0.1, 'Cheeks', 'FontName', font_name, 'FontSize', 12, 'HorizontalAlignment', 'center');
        text(20, 0.1, 'Nose', 'FontName', font_name, 'FontSize', 12, 'HorizontalAlignment', 'center');
        
        % Add labels
        xlabel({'$i$'}, 'Interpreter', 'latex', 'FontName', font_name, 'FontSize', font_axestitle);
        xticks([1 4 8 12 16 20 24]);
        xlim([1 24]);
        ylabel({'$V_{jet} (m/s)$'}, 'Interpreter', 'latex', 'FontName', font_name, 'FontSize', font_axestitle);
        ylim([0 2.5]);
        
        % Add subtitle with (i) or (ii) to indicate alpha value
        if strcmp(alpha_values{j}, '-1.2')
            subtitle_text = '(i)';
        else
            subtitle_text = '(ii)';
        end
        
        % Place the subtitle in the upper left corner
        text(2, 2.2, subtitle_text, 'FontName', font_name, 'FontSize', 14, 'FontWeight', 'bold');
        
        % Apply consistent font settings
        set(gca, 'FontName', 'Times New Roman', 'FontSize', font_axes);
        
        % Add legend on the first plot only (or add it to all if needed)
        if i == 1 && j == 1
            legend('No clips', 'k_L = 10', 'k_L = 1000', 'Interpreter', 'latex', 'Location', 'northeast');
        end
        
        % Add annotation for subplot letter
        Pos = get(gca, 'Position');
        Postop = Pos(2) + Pos(4);
        Pos = get(gca, 'Outerposition');
        Posleft = Pos(1);
        
        annotation('textbox', [Posleft-0.00 Postop-0.00 0 0], 'String', ['$(' subplot_letters{i} ')$'], ...
            'EdgeColor', 'none', 'FontSize', font_title, 'FontName', font_name, 'Interpreter', 'latex', ...
            'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle');
        
        % Create filename for saving
        suffix = '';
        if strcmp(alpha_values{j}, '-1.2')
            suffix = '_neg';
        else
            suffix = '_pos';
        end
        
        % Create base filename
        base_filename = sprintf('figure_10%s_%s%s', subplot_letters{i}, features{i}, suffix);
        
        % Create file paths for each format
        fig_file = fullfile(plots_path, [base_filename '.fig']);
        eps_file = fullfile(plots_path, [base_filename '.eps']);
        jpg_file = fullfile(plots_path, [base_filename '.jpg']);
        png_file = fullfile(plots_path, [base_filename '.png']);
        emf_file = fullfile(plots_path, [base_filename '.emf']);
        
        % Save all formats
        saveas(gcf, fig_file);                   % MATLAB figure
        saveas(gcf, eps_file, 'epsc');           % EPS for publication
        saveas(gcf, jpg_file, 'jpg');            % JPG for presentations
        saveas(gcf, png_file, 'png');            % PNG for web/presentations
        saveas(gcf, emf_file, 'emf');            % EMF for MS Office
        
        % Report successful save
        fprintf('Saved Figure 10%s (%s, alpha = %s, subplot %s) to %s\n', ...
                subplot_letters{i}, feature_display_names{i}, alpha_values{j}, subtitle_text, plots_path);
        
        % Close the figure
        close(gcf);
    end
end

% Create the consolidated figure (2x4 layout) to match the paper figure
figure('Position', [100, 100, 1200, 800]);

subplot_count = 1;
for i = 1:length(features)
    for j = 1:length(alpha_values)
        % Create subplot
        subplot(2, 4, subplot_count);
        subplot_count = subplot_count + 1;
        
        % Get data for the current feature
        current_data = data.(features{i});
        
        % Determine data columns based on alpha value
        if strcmp(alpha_values{j}, '-1.2')
            data_cols = [2, 3, 4]; % Data for alpha = -1.2
            subtitle_text = '(i)';
        else
            data_cols = [5, 6, 7]; % Data for alpha = 1.2
            subtitle_text = '(ii)';
        end
        
        % Create color-coded background for the three facial regions
        ax = gca;
        
        % Chin section (1-8) - light green
        rectangle('Position', [1, 0, 8, 2.5], 'FaceColor', section_colors{1}, 'EdgeColor', 'none');
        hold on;
        
        % Cheeks section (9-16) - light red
        rectangle('Position', [9, 0, 8, 2.5], 'FaceColor', section_colors{2}, 'EdgeColor', 'none');
        
        % Nose section (17-24) - light yellow
        rectangle('Position', [17, 0, 8, 2.5], 'FaceColor', section_colors{3}, 'EdgeColor', 'none');
        
        % Plot data for section 1 (1-8) - Chin region
        plot(current_data(1:8, 1), current_data(1:8, data_cols(1)), '-k', 'LineWidth', 1); hold on;
        plot(current_data(1:8, 1), current_data(1:8, data_cols(2)), '-b', 'LineWidth', 1); hold on;
        plot(current_data(1:8, 1), current_data(1:8, data_cols(3)), '-r', 'LineWidth', 1); hold on;
        
        % Plot data for section 2 (9-16) - Cheeks region
        plot(current_data(9:16, 1), current_data(9:16, data_cols(1)), '-k', 'LineWidth', 1); hold on;
        plot(current_data(9:16, 1), current_data(9:16, data_cols(2)), '-b', 'LineWidth', 1); hold on;
        plot(current_data(9:16, 1), current_data(9:16, data_cols(3)), '-r', 'LineWidth', 1); hold on;
        
        % Plot data for section 3 (17-24) - Nose region
        % Per request, only plot black and blue lines (no red line) for channels 17-24
        plot(current_data(17:24, 1), current_data(17:24, data_cols(1)), '-k', 'LineWidth', 1); hold on;
        plot(current_data(17:24, 1), current_data(17:24, data_cols(2)), '-b', 'LineWidth', 1); hold on;
        % Red line is intentionally omitted for the nose region (17-24)
        
        % Add x-label
        xlabel({'$i$'}, 'Interpreter', 'latex', 'FontName', font_name, 'FontSize', 10);
        xticks([1 4 8 12 16 20 24]);
        xlim([1 24]);
        
        % Add y-label for leftmost subplots
        if mod(subplot_count-1, 4) == 1
            ylabel({'$V_{jet} (m/s)$'}, 'Interpreter', 'latex', 'FontName', font_name, 'FontSize', 10);
        end
        ylim([0 2.5]);
        
        % Add subtitle (i) or (ii)
        text(2, 2.2, subtitle_text, 'FontName', font_name, 'FontSize', 10, 'FontWeight', 'bold');
        
        % Apply consistent font settings
        set(gca, 'FontName', 'Times New Roman', 'FontSize', 8);
        
        % Add legend on the first subplot only
        if i == 1 && j == 1
            legend('No clips', 'k_L = 10', 'k_L = 1000', 'Interpreter', 'latex', 'FontSize', 8, 'Location', 'northeast');
        end
        
        % Add section labels only if there's enough space
        text(4, 0.1, 'Chin', 'FontName', font_name, 'FontSize', 8, 'HorizontalAlignment', 'center');
        text(12, 0.1, 'Cheeks', 'FontName', font_name, 'FontSize', 8, 'HorizontalAlignment', 'center');
        text(20, 0.1, 'Nose', 'FontName', font_name, 'FontSize', 8, 'HorizontalAlignment', 'center');
    end
end

% Add feature headers above the plots
annotation('textbox', [0.25, 0.95, 0.1, 0.05], 'String', 'Nose', 'FontName', font_name, ...
    'FontSize', 14, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'EdgeColor', 'none');

annotation('textbox', [0.75, 0.95, 0.1, 0.05], 'String', 'Chin', 'FontName', font_name, ...
    'FontSize', 14, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'EdgeColor', 'none');

annotation('textbox', [0.25, 0.5, 0.1, 0.05], 'String', 'Zygomatic Arch', 'FontName', font_name, ...
    'FontSize', 14, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'EdgeColor', 'none');

annotation('textbox', [0.75, 0.5, 0.1, 0.05], 'String', 'Cheek', 'FontName', font_name, ...
    'FontSize', 14, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'EdgeColor', 'none');

% Add alpha value indicators
annotation('textbox', [0.1, 0.95, 0.2, 0.05], 'String', '$\alpha = -1.2$', 'FontName', font_name, ...
    'FontSize', 12, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'EdgeColor', 'none', 'Interpreter', 'latex');

annotation('textbox', [0.6, 0.95, 0.2, 0.05], 'String', '$\alpha = 1.2$', 'FontName', font_name, ...
    'FontSize', 12, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'EdgeColor', 'none', 'Interpreter', 'latex');

annotation('textbox', [0.1, 0.5, 0.2, 0.05], 'String', '$\alpha = -1.2$', 'FontName', font_name, ...
    'FontSize', 12, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'EdgeColor', 'none', 'Interpreter', 'latex');

annotation('textbox', [0.6, 0.5, 0.2, 0.05], 'String', '$\alpha = 1.2$', 'FontName', font_name, ...
    'FontSize', 12, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'EdgeColor', 'none', 'Interpreter', 'latex');

% Add subplot letters
annotation('textbox', [0.05, 0.9, 0.05, 0.05], 'String', '$(a)$', 'FontName', font_name, ...
    'FontSize', 14, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'EdgeColor', 'none', 'Interpreter', 'latex');

annotation('textbox', [0.05, 0.45, 0.05, 0.05], 'String', '$(c)$', 'FontName', font_name, ...
    'FontSize', 14, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'EdgeColor', 'none', 'Interpreter', 'latex');

annotation('textbox', [0.55, 0.9, 0.05, 0.05], 'String', '$(b)$', 'FontName', font_name, ...
    'FontSize', 14, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'EdgeColor', 'none', 'Interpreter', 'latex');

annotation('textbox', [0.55, 0.45, 0.05, 0.05], 'String', '$(d)$', 'FontName', font_name, ...
    'FontSize', 14, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'EdgeColor', 'none', 'Interpreter', 'latex');

% Save the consolidated figure
consolidated_filename = 'figure_10_consolidated';
fig_file = fullfile(plots_path, [consolidated_filename '.fig']);
eps_file = fullfile(plots_path, [consolidated_filename '.eps']);
jpg_file = fullfile(plots_path, [consolidated_filename '.jpg']);
png_file = fullfile(plots_path, [consolidated_filename '.png']);
emf_file = fullfile(plots_path, [consolidated_filename '.emf']);

saveas(gcf, fig_file);                   % MATLAB figure
saveas(gcf, eps_file, 'epsc');           % EPS for publication
saveas(gcf, jpg_file, 'jpg');            % JPG for presentations
saveas(gcf, png_file, 'png');            % PNG for web/presentations
saveas(gcf, emf_file, 'emf');            % EMF for MS Office

fprintf('Saved consolidated Figure 10 to %s\n', plots_path);
close(gcf);

fprintf('All Figure 10 plots have been saved to: %s\n', plots_path);