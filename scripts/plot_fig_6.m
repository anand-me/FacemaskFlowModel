% Master script to run all Figure 6 plots
%% Akshay Anand
% Master script to run all Figure 6 plots

% Clear workspace and close all figures
clear all;
close all;

% List of scripts to run
scripts = {'plot_6a', 'plot_6b', 'plot_6c', 'plot_6d', 'plot_6e', 'plot_6f'};

% Loop through and run each script
for i = 1:length(scripts)
    try
        disp(['Running script: ' scripts{i}]);
        run(scripts{i});
        disp(['Completed: ' scripts{i}]);
    catch ME
       
    end
end

disp('All figure scripts have been executed.');



