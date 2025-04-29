%% Figure 5 Plotting Script for "Identifying the effectiveness of face mask in a large population 
%% with a network-based fluid model"
%%
%% Authors: Akshay Anand and Kourosh Shoele
%% Florida A&M University - Florida State University, Tallahassee, FL
%% Date: April 2025
%%
%% Description: This script generates Figures 5a, 5b, and 5c from the paper, showing the 
%% percentage of exhale flux penetrating through the mask fabric for different values of 
%% mask porosity (ck) and facial features.
%%
%% Usage: Run this script from the scripts directory of the repository. It will:
%%   1. Read data from ../data/ directory
%%   2. Create ../plots/fig5/ directory if it doesn't exist
%%   3. Generate and save plots in multiple formats to the ../plots/fig5/ directory

% Clear workspace and close all figures
close all;
clear all;

% Determine repository paths for data files and output plots
repo_root = fileparts(fileparts(mfilename('fullpath'))); % Go up one level from scripts dir
data_path = fullfile(repo_root, 'data');
plots_path = fullfile(repo_root, 'plots', 'fig5');

% Create the output directory if it doesn't exist
if ~exist(plots_path, 'dir')
    fprintf('Creating output directory: %s\n', plots_path);
    [status, msg] = mkdir(plots_path);
    if ~status
        error('Failed to create output directory: %s', msg);
    end
end

% Define the files and corresponding figure letters
files = {'data_for_figure_5a.mat', 'data_for_figure_5b.mat', 'data_for_figure_5c.mat'};
fig_letters = {'a', 'b', 'c'};

% Main loop to process all figures
for i = 1:length(files)
    % Get full path to data file
    data_file = fullfile(data_path, files{i});
    
    % Load data file with error checking
    if exist(data_file, 'file')
        fprintf('Loading data from: %s\n', data_file);
        load(data_file);
    else
        error('File %s not found. Please check the data directory path.', data_file);
    end
    
    % Get the variable name dynamically
    var_name = ['Newdata_for_figure_5' fig_letters{i}];
    
    % Check if the variable exists
    if exist(var_name, 'var')
        % Call the plotting function
        plot_and_save_figure(eval(var_name), fig_letters{i}, plots_path);
        fprintf('Successfully processed Figure 5%s\n', fig_letters{i});
    else
        fprintf('Variable %s not found in file %s\n', var_name, files{i});
    end
end

fprintf('All figures have been plotted and saved to: %s\n', plots_path);

% Local function to plot and save a single figure
function plot_and_save_figure(data, fig_letter, output_path)
    %% Font settings for consistency with paper formatting
    font_name = 'Times New Roman';
    font_axes = 18;
    font_legend = 18;
    font_axestitle = 18;
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
    % Sort data by x-values for proper plotting
    x1 = data(:,1)';
    [x2,ix] = sort(x1);
    x1 = x2;
    
    % Main data series:
    % y1: +7.5% cavity size sensitivity
    % y2: Base case (original configuration)
    % y3: -7.5% cavity size sensitivity
    y1 = data(:,2)'; 
    y2 = data(:,3)'; 
    y3 = data(:,4)'; 
    y1 = y1(ix); y2 = y2(ix); y3 = y3(ix);
    
    % Prepare data for confidence band
    ydata1 = y2;
    Yupper1 = max(max(y1,y2),y3);
    Ylower1 = min(y1,min(y2,y3));
    xconf = [x1 x1(end:-1:1)];
    yconf1 = [Yupper1 Ylower1(end:-1:1)];

    % Create figure with adequate size
    figure('Position', [100, 100, 800, 600]);

    % Create confidence band (sensitivity range)
    p = fill(xconf,yconf1,'red');
    p.FaceColor = [1.0 0.8 0.8];  % Light red color
    p.EdgeColor = 'none';
    hold on;
    
    % Plot main data series
    plot(x1,ydata1,'--ok','LineWidth',1); hold on;  % Base case (dotted black)
    plot(x1,y1,'-b','LineWidth',1); hold on;        % +7.5% cavity size (blue)
    plot(x1,y3,'-r','LineWidth',1); hold on;        % -7.5% cavity size (red)
    
    % Add legend
    legend('$c_k = 1000 (kg/m^2 \times s)$', 'Interpreter','latex','Location','southwest');
    grid on

    % Setting y-label for figure 5a only (first in the sequence)
    if fig_letter == 'a'
        ylabel('$\%{Q_{m}}/{Q_{breath}}$','Interpreter','latex','FontName',font_name,'FontSize',font_axestitle)
        set(gca,'FontName','Times New Roman','FontSize',font_axes);
    end

    % Set x-axis properties
    xticks(-1.2:0.6:1.2);
    xlim([-1.2 1.2]);
    
    % Get position for annotation
    Pos = get(gca,'Position');
    Postop = Pos(2)+Pos(4);
    Pos = get(gca,'Outerposition');
    Posleft = Pos(1);

    % Add figure letter annotation
    annotation('textbox',[Posleft-0.00 Postop-0.00 0 0],'String',['$(' fig_letter ')$'], ...
    'EdgeColor','none','FontSize',font_title,'FontName',font_name,'Interpreter','latex' ,...
    'HorizontalAlignment','left','VerticalAlignment','middle' )

    % Create inset plot for position sensitivity analysis
    % This inset shows the effect of changing position (±5 mm) of cavity regions
    y1y = data(:,5)';  % +5mm position shift
    y2y = data(:,3)';  % Base case
    y3y = data(:,6)';  % -5mm position shift
    y1y = y1y(ix); y2y = y2y(ix); y3y = y3y(ix);
    
    % Prepare data for inset confidence band
    ydata1 = y2y;
    Yupypyer1 = max(max(y1y,y2y),y3y);
    Ylower1 = min(y1y,min(y2y,y3y));
    xconf = [x1 x1(end:-1:1)];
    yconf1y = [Yupypyer1 Ylower1(end:-1:1)];

    % Create inset axes
    axes('Position',[.38 .74 .5 .18]); % Position: [left bottom width height]
    
    % Create inset confidence band
    py = fill(xconf,yconf1y,'red');
    py.FaceColor = [1.0 0.8 0.8];
    py.EdgeColor = 'none';
    hold on;
    
    % Plot inset data series
    plot(x1,ydata1,'--ok','LineWidth',1); hold on;  % Base case
    plot(x1,y1y,'-b','LineWidth',1); hold on;       % +5mm shift
    plot(x1,y3y,'-r','LineWidth',1); hold on;       % -5mm shift
    grid on
    
    % Configure inset x-axis
    xticklabels({});
    xticks(-1.2:0.6:1.2);
    xlim([-1.2 1.2]);

    % Save the figure in multiple formats to the output directory
    base_filename = sprintf('figure_5%s', fig_letter);
    
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
    fprintf('Saved figure in multiple formats to %s\n', output_path);
    
    % Close the figure to prevent memory issues when processing multiple figures
    close(gcf);
end