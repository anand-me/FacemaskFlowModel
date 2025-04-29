%% Akshay Anand
%% Script to plot and save Figures 5a, 5b, and 5c
close all;
clear all;



current_path = fileparts(mfilename('fullpath'));
parent_path = fileparts(current_path);
base_path = fullfile(parent_path, 'data');
% Define the files and corresponding figure letters
files = {'data_for_figure_5a.mat', 'data_for_figure_5b.mat', 'data_for_figure_5c.mat'};
fig_letters = {'a', 'b', 'c'};

% Main loop to process all figures
for i = 1:length(files)

    data_file = fullfile(base_path, files{i});
    
    if exist(data_file, 'file')
        load(data_file);
    else
        error('File %s not found.', data_file);
    end
    
    % Get the variable name dynamically
    var_name = ['Newdata_for_figure_5' fig_letters{i}];
    
    % Check if the variable exists
    if exist(var_name, 'var')
        % Call the plotting function
        plot_and_save_figure(eval(var_name), fig_letters{i});
    else
        fprintf('Variable %s not found in file %s\n', var_name, files{i});
    end
end

fprintf('All figures have been plotted and saved.\n');

% Local function to plot and save a single figure
function plot_and_save_figure(data, fig_letter)
    %% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    font_name='Times New Roman';
    font_axes=18;
    font_legend=18;
    font_axestitle=18;
    font_title=14;

    %% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    marginleft=0.2;
    marginright=0.1;
    marginbottom=0.2;
    margintop=0.1;

    %% setting height and width of the plot
    widthIn =5.3/2;
    heightIn=2.1;

    % Plot main figure
    x1 = data(:,1)';
    [x2,ix] = sort(x1);
    x1 = x2;
    y1 = data(:,2)'; % + 7.5
    y2 = data(:,3)'; % 0
    y3 = data(:,4)'; % - 7.5
    y1 = y1(ix); y2 = y2(ix); y3 = y3(ix);
    ydata1 = y2;
    Yupper1 = max(max(y1,y2),y3);
    Ylower1 = min(y1,min(y2,y3));
    xconf = [x1 x1(end:-1:1)];
    yconf1 = [Yupper1 Ylower1(end:-1:1)];

    figure('Position', [100, 100, 800, 600]);

    p = fill(xconf,yconf1,'red');
    p.FaceColor = [1.0 0.8 0.8];
    p.EdgeColor = 'none';
    hold on;
    plot(x1,ydata1,'--ok','LineWidth',1); hold on;
    plot(x1,y1,'-b','LineWidth',1); hold on;
    plot(x1,y3,'-r','LineWidth',1); hold on;
    legend('$c_k = 1000 (kg/m^2 \times s)$', 'Interpreter','latex','Location','southwest');
    grid on

    % setting y-label and y-tick
    if fig_letter == 'a'
        ylabel('$\%{Q_{m}}/{Q_{breath}}$','Interpreter','latex','FontName',font_name,'FontSize',font_axestitle)
        set(gca,'FontName','Times New Roman','FontSize',font_axes);
    end

    xticks(-1.2:0.6:1.2);
    xlim([-1.2 1.2]);
    Pos = get(gca,'Position');
    Postop = Pos(2)+Pos(4);
    Pos = get(gca,'Outerposition');
    Posleft = Pos(1);

    % Figure annotation
    annotation('textbox',[Posleft-0.00 Postop-0.00 0 0],'String',['$(' fig_letter ')$'], ...
    'EdgeColor','none','FontSize',font_title,'FontName',font_name,'Interpreter','latex' ,...
    'HorizontalAlignment','left','VerticalAlignment','middle' )

    % shift in y sensitivity
    y1y = data(:,5)';
    y2y = data(:,3)';
    y3y = data(:,6)';
    y1y = y1y(ix); y2y = y2y(ix); y3y = y3y(ix);
    ydata1 = y2y;
    Yupypyer1 = max(max(y1y,y2y),y3y);
    Ylower1 = min(y1y,min(y2y,y3y));
    xconf = [x1 x1(end:-1:1)];
    yconf1y = [Yupypyer1 Ylower1(end:-1:1)];

    axes('Position',[.38 .74 .5 .18]); % working % top | down | left |
    py = fill(xconf,yconf1y,'red');
    py.FaceColor = [1.0 0.8 0.8];
    py.EdgeColor = 'none';
    hold on;
    plot(x1,ydata1,'--ok','LineWidth',1); hold on;
    plot(x1,y1y,'-b','LineWidth',1); hold on;
    plot(x1,y3y,'-r','LineWidth',1); hold on;
    grid on
    xticklabels({});
    xticks(-1.2:0.6:1.2);
    xlim([-1.2 1.2]);

    % Save the figure in different formats
    saveas(gcf, ['figure_5' fig_letter '.fig']); % Save as .fig
    saveas(gcf, ['figure_5' fig_letter '.eps'], 'epsc'); % Save as .eps
    saveas(gcf, ['figure_5' fig_letter '.jpg'], 'jpg'); % Save as .jpg
    saveas(gcf, ['figure_5' fig_letter '.png'], 'png'); % Save as .png
    saveas(gcf, ['figure_5' fig_letter '.emf'], 'emf'); % Save as .emf
    close(gcf);
end