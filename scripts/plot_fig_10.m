% ~~~~~~~~~~~ plot for fig 10  ~~~~~~~~~~~~~~~~~~ 
%% Akshay Anand
clear all;close all;
load('data_for_jet_vel_nose.mat');
load('data_for_jet_vel_chin.mat');
load('data_for_jet_vel_zygo.mat');
load('data_for_jet_vel_cheek.mat');
%%
font_name='Times New Roman';
font_axes=18;
font_legend=4; 
font_axestitle=18;
font_title=18;
% ~~~~~~~~ setting page margin ~~~~~~~~~~~~~~~~~~~~~~~~~
marginleft=0.2;
marginright=0.1;
marginbottom=0.2;
margintop=0.1;
%% setting height and width of the plot || usually half of the page || height 1.8 to 2.6 is fairly well
widthIn =5.3/2;  
heightIn=2.1;   
figure(1)
set(gcf, 'Position',  [1171,476,560,420])
%% nose || alpha  = - 1.2
plot(data_for_jet_vel_nose(1:8),data_for_jet_vel_nose(1:8,2),'-k','LineWidth',1); hold on;
plot(data_for_jet_vel_nose(9:16),data_for_jet_vel_nose(9:16,2),'-k','LineWidth',1); hold on;
plot(data_for_jet_vel_nose(17:24),data_for_jet_vel_nose(17:24,2),'-k','LineWidth',1); hold on;
plot(data_for_jet_vel_nose(1:8),data_for_jet_vel_nose(1:8,3),'-b','LineWidth',1); hold on;
plot(data_for_jet_vel_nose(9:16),data_for_jet_vel_nose(9:16,3),'-b','LineWidth',1); hold on;
plot(data_for_jet_vel_nose(17:24),data_for_jet_vel_nose(17:24,3),'-b','LineWidth',1); hold on;
plot(data_for_jet_vel_nose(1:8),data_for_jet_vel_nose(1:8,4),'-r','LineWidth',1); hold on;
plot(data_for_jet_vel_nose(9:16),data_for_jet_vel_nose(9:16,4),'-r','LineWidth',1); hold on;
xlabel({'$i$'},'Interpreter','latex','FontName',font_name,...	 'interpreter','latex','FontSize',font_axestitle)
  'interpreter','latex','FontSize',font_axestitle);
 xticks([1 4 8 12 16 20 24]); % Explicitly specify the desired tick positions
 ylabel({'$V_{jet} (m/s)$'},'Interpreter','latex','FontName',font_name,...	 'interpreter','latex','FontSize',font_axestitle)
  'interpreter','latex','FontSize',font_axestitle);
 Pos =get(gca,'Position');
 Postop=Pos(2)+Pos(4);
 Pos=get(gca,'Outerposition');
 Posleft=Pos(1);
%% ~~~~~~~~ Figure annotation ~~~~~~~~~~~~~~~~~~~~~~~~~
  annotation('textbox',[Posleft-0.00 Postop-0.00 0 0],'String','$(a)$', ...
     'EdgeColor','none','FontSize',font_title,'FontName',font_name,'Interpreter','latex' ,...
     'HorizontalAlignment','left','VerticalAlignment','middle'  )
%% nose || alpha  = + 1.2 
  figure(2)
set(gcf, 'Position',  [1171,476,560,420])
plot(data_for_jet_vel_nose(1:8),data_for_jet_vel_nose(1:8,5),'-k','LineWidth',1); hold on;
plot(data_for_jet_vel_nose(9:16),data_for_jet_vel_nose(9:16,5),'-k','LineWidth',1); hold on;
plot(data_for_jet_vel_nose(17:24),data_for_jet_vel_nose(17:24,5),'-k','LineWidth',1); hold on;
plot(data_for_jet_vel_nose(1:8),data_for_jet_vel_nose(1:8,6),'-b','LineWidth',1); hold on;
plot(data_for_jet_vel_nose(9:16),data_for_jet_vel_nose(9:16,6),'-b','LineWidth',1); hold on;
plot(data_for_jet_vel_nose(17:24),data_for_jet_vel_nose(17:24,6),'-b','LineWidth',1); hold on;
plot(data_for_jet_vel_nose(1:8),data_for_jet_vel_nose(1:8,7),'-r','LineWidth',1); hold on;
plot(data_for_jet_vel_nose(9:16),data_for_jet_vel_nose(9:16,7),'-r','LineWidth',1); hold on;
xlabel({'$i$'},'Interpreter','latex','FontName',font_name,...	 'interpreter','latex','FontSize',font_axestitle)
  'interpreter','latex','FontSize',font_axestitle);
 xticks([1 4 8 12 16 20 24]); % Explicitly specify the desired tick positions
 figure(3)
set(gcf, 'Position',  [1171,476,560,420])
%% chin || alpha  = - 1.2
plot(data_for_jet_vel_chin(1:8),data_for_jet_vel_chin(1:8,2),'-k','LineWidth',1); hold on;
plot(data_for_jet_vel_chin(9:16),data_for_jet_vel_chin(9:16,2),'-k','LineWidth',1); hold on;
plot(data_for_jet_vel_chin(17:24),data_for_jet_vel_chin(17:24,2),'-k','LineWidth',1); hold on;
plot(data_for_jet_vel_chin(1:8),data_for_jet_vel_chin(1:8,3),'-b','LineWidth',1); hold on;
plot(data_for_jet_vel_chin(9:16),data_for_jet_vel_chin(9:16,3),'-b','LineWidth',1); hold on;
plot(data_for_jet_vel_chin(17:24),data_for_jet_vel_chin(17:24,3),'-b','LineWidth',1); hold on;
plot(data_for_jet_vel_chin(1:8),data_for_jet_vel_chin(1:8,4),'-r','LineWidth',1); hold on;
plot(data_for_jet_vel_chin(9:16),data_for_jet_vel_chin(9:16,4),'-r','LineWidth',1); hold on;
xlabel({'$i$'},'Interpreter','latex','FontName',font_name,...	 'interpreter','latex','FontSize',font_axestitle)
  'interpreter','latex','FontSize',font_axestitle);
 xticks([1 4 8 12 16 20 24]); 
 ylabel({'$V_{jet} (m/s)$'},'Interpreter','latex','FontName',font_name,...	 'interpreter','latex','FontSize',font_axestitle)
  'interpreter','latex','FontSize',font_axestitle);
%% ~~~~~~~~ Figure annotation ~~~~~~~~~~~~~~~~~~~~~~~~~
  annotation('textbox',[Posleft-0.00 Postop-0.00 0 0],'String','$(b)$', ...
     'EdgeColor','none','FontSize',font_title,'FontName',font_name,'Interpreter','latex' ,...
     'HorizontalAlignment','left','VerticalAlignment','middle')
  %% chin || alpha  = + 1.2
  figure(4)
set(gcf, 'Position',  [1171,476,560,420])
plot(data_for_jet_vel_chin(1:8),data_for_jet_vel_chin(1:8,5),'-k','LineWidth',1); hold on;
plot(data_for_jet_vel_chin(9:16),data_for_jet_vel_chin(9:16,5),'-k','LineWidth',1); hold on;
plot(data_for_jet_vel_chin(17:24),data_for_jet_vel_chin(17:24,5),'-k','LineWidth',1); hold on;
plot(data_for_jet_vel_chin(1:8),data_for_jet_vel_chin(1:8,6),'-b','LineWidth',1); hold on;
plot(data_for_jet_vel_chin(9:16),data_for_jet_vel_chin(9:16,6),'-b','LineWidth',1); hold on;
plot(data_for_jet_vel_chin(17:24),data_for_jet_vel_chin(17:24,6),'-b','LineWidth',1); hold on;
plot(data_for_jet_vel_chin(1:8),data_for_jet_vel_chin(1:8,7),'-r','LineWidth',1); hold on;
plot(data_for_jet_vel_chin(9:16),data_for_jet_vel_chin(9:16,7),'-r','LineWidth',1); hold on;
xlabel({'$i$'},'Interpreter','latex','FontName',font_name,...	 'interpreter','latex','FontSize',font_axestitle)
  'interpreter','latex','FontSize',font_axestitle);
 xticks([1 4 8 12 16 20 24]); 
%% zygo || alpha  = - 1.2
 figure(5)
set(gcf, 'Position',  [1171,476,560,420])
plot(data_for_jet_vel_zygo(1:8),data_for_jet_vel_zygo(1:8,2),'-k','LineWidth',1); hold on;
plot(data_for_jet_vel_zygo(9:16),data_for_jet_vel_zygo(9:16,2),'-k','LineWidth',1); hold on;
plot(data_for_jet_vel_zygo(17:24),data_for_jet_vel_zygo(17:24,2),'-k','LineWidth',1); hold on;
plot(data_for_jet_vel_zygo(1:8),data_for_jet_vel_zygo(1:8,3),'-b','LineWidth',1); hold on;
plot(data_for_jet_vel_zygo(9:16),data_for_jet_vel_zygo(9:16,3),'-b','LineWidth',1); hold on;
plot(data_for_jet_vel_zygo(17:24),data_for_jet_vel_zygo(17:24,3),'-b','LineWidth',1); hold on;
plot(data_for_jet_vel_zygo(1:8),data_for_jet_vel_zygo(1:8,4),'-r','LineWidth',1); hold on;
plot(data_for_jet_vel_zygo(9:16),data_for_jet_vel_zygo(9:16,4),'-r','LineWidth',1); hold on;
xlabel({'$i$'},'Interpreter','latex','FontName',font_name,...	 'interpreter','latex','FontSize',font_axestitle)
  'interpreter','latex','FontSize',font_axestitle);
 xticks([1 4 8 12 16 20 24]); 
 ylabel({'$V_{jet} (m/s)$'},'Interpreter','latex','FontName',font_name,...	 'interpreter','latex','FontSize',font_axestitle)
  'interpreter','latex','FontSize',font_axestitle);
%% ~~~~~~~~ Figure annotation ~~~~~~~~~~~~~~~~~~~~~~~~~
  annotation('textbox',[Posleft-0.00 Postop-0.00 0 0],'String','$(c)$', ...
     'EdgeColor','none','FontSize',font_title,'FontName',font_name,'Interpreter','latex' ,...
     'HorizontalAlignment','left','VerticalAlignment','middle'  )
%% zygo || alpha  = + 1.2
  figure(6)
set(gcf, 'Position',  [1171,476,560,420])
plot(data_for_jet_vel_zygo(1:8),data_for_jet_vel_zygo(1:8,5),'-k','LineWidth',1); hold on;
plot(data_for_jet_vel_zygo(9:16),data_for_jet_vel_zygo(9:16,5),'-k','LineWidth',1); hold on;
plot(data_for_jet_vel_zygo(17:24),data_for_jet_vel_zygo(17:24,5),'-k','LineWidth',1); hold on;
plot(data_for_jet_vel_zygo(1:8),data_for_jet_vel_zygo(1:8,6),'-b','LineWidth',1); hold on;
plot(data_for_jet_vel_zygo(9:16),data_for_jet_vel_zygo(9:16,6),'-b','LineWidth',1); hold on;
plot(data_for_jet_vel_zygo(17:24),data_for_jet_vel_zygo(17:24,6),'-b','LineWidth',1); hold on;
plot(data_for_jet_vel_zygo(1:8),data_for_jet_vel_zygo(1:8,7),'-r','LineWidth',1); hold on;
plot(data_for_jet_vel_zygo(9:16),data_for_jet_vel_zygo(9:16,7),'-r','LineWidth',1); hold on;
xlabel({'$i$'},'Interpreter','latex','FontName',font_name,...	 'interpreter','latex','FontSize',font_axestitle)
  'interpreter','latex','FontSize',font_axestitle);
 xticks([1 4 8 12 16 20 24]); 
 %% cheek || alpha  = - 1.2
 figure(7)
set(gcf, 'Position',  [1171,476,560,420])
plot(data_for_jet_vel_cheek(1:8),data_for_jet_vel_cheek(1:8,2),'-k','LineWidth',1); hold on;
plot(data_for_jet_vel_cheek(9:16),data_for_jet_vel_cheek(9:16,2),'-k','LineWidth',1); hold on;
plot(data_for_jet_vel_cheek(17:24),data_for_jet_vel_cheek(17:24,2),'-k','LineWidth',1); hold on;
plot(data_for_jet_vel_cheek(1:8),data_for_jet_vel_cheek(1:8,3),'-b','LineWidth',1); hold on;
plot(data_for_jet_vel_cheek(9:16),data_for_jet_vel_cheek(9:16,3),'-b','LineWidth',1); hold on;
plot(data_for_jet_vel_cheek(17:24),data_for_jet_vel_cheek(17:24,3),'-b','LineWidth',1); hold on;
plot(data_for_jet_vel_cheek(1:8),data_for_jet_vel_cheek(1:8,4),'-r','LineWidth',1); hold on;
plot(data_for_jet_vel_cheek(9:16),data_for_jet_vel_cheek(9:16,4),'-r','LineWidth',1); hold on;
xlabel({'$i$'},'Interpreter','latex','FontName',font_name,...	 'interpreter','latex','FontSize',font_axestitle)
  'interpreter','latex','FontSize',font_axestitle);
 xticks([1 4 8 12 16 20 24]); % Explicitly specify the desired tick positions
 ylabel({'$V_{jet} (m/s)$'},'Interpreter','latex','FontName',font_name,...	 'interpreter','latex','FontSize',font_axestitle)
  'interpreter','latex','FontSize',font_axestitle);
%% ~~~~~~~~ Figure annotation ~~~~~~~~~~~~~~~~~~~~~~~~~
  annotation('textbox',[Posleft-0.00 Postop-0.00 0 0],'String','$(d)$', ...
     'EdgeColor','none','FontSize',font_title,'FontName',font_name,'Interpreter','latex' ,...
     'HorizontalAlignment','left','VerticalAlignment','middle'  )
%% cheek || alpha  = + 1.2
  figure(8)
set(gcf, 'Position',  [1171,476,560,420])
plot(data_for_jet_vel_cheek(1:8),data_for_jet_vel_cheek(1:8,5),'-k','LineWidth',1); hold on;
plot(data_for_jet_vel_cheek(9:16),data_for_jet_vel_cheek(9:16,5),'-k','LineWidth',1); hold on;
plot(data_for_jet_vel_cheek(17:24),data_for_jet_vel_cheek(17:24,5),'-k','LineWidth',1); hold on;
plot(data_for_jet_vel_cheek(1:8),data_for_jet_vel_cheek(1:8,6),'-b','LineWidth',1); hold on;
plot(data_for_jet_vel_cheek(9:16),data_for_jet_vel_cheek(9:16,6),'-b','LineWidth',1); hold on;
plot(data_for_jet_vel_cheek(17:24),data_for_jet_vel_cheek(17:24,6),'-b','LineWidth',1); hold on;
plot(data_for_jet_vel_cheek(1:8),data_for_jet_vel_cheek(1:8,7),'-r','LineWidth',1); hold on;
plot(data_for_jet_vel_cheek(9:16),data_for_jet_vel_cheek(9:16,7),'-r','LineWidth',1); hold on;
xlabel({'$i$'},'Interpreter','latex','FontName',font_name,...	 'interpreter','latex','FontSize',font_axestitle)
  'interpreter','latex','FontSize',font_axestitle);
 xticks([1 4 8 12 16 20 24]);

%% Save figures for nose, chin, zygo, and cheek at different alpha values

% Set the common directory and filenames
filename_base = {'Jet_Vel_Nose_-1.2', 'Jet_Vel_Nose_1.2', ...
                 'Jet_Vel_Chin_-1.2', 'Jet_Vel_Chin_1.2', ...
                 'Jet_Vel_Zygo_-1.2', 'Jet_Vel_Zygo_1.2', ...
                 'Jet_Vel_Cheek_-1.2', 'Jet_Vel_Cheek_1.2'};

% Loop over the figure numbers and save each one
for fig_num = 1:8
    figure(fig_num);
    % Save as .fig
    saveas(gcf, [filename_base{fig_num} '.fig']);
    
    % Save as .jpg
    saveas(gcf, [filename_base{fig_num} '.jpg']);
    
    % Save as .eps
    print(gcf, '-depsc', [filename_base{fig_num} '.eps']);
end
