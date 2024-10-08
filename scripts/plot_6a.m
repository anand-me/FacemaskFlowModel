% ~~~~~~~~~~~ plot for 6a  ~~~~~~~~~~~~~~~~~~ 
close all;
clear all;
%% ~~~~~~~~~~~ for PoF/JFM Journal ~~~~~~~~~~~~~~~~~~ 
font_name='Times New Roman';
font_axes=18;
font_legend=18;
font_axestitle=12;
font_title=14;
%% ~~~~~~~~ setting page margin ~~~~~~~~~~~~~~~~~~~~~~~~~
marginleft=0.2;
marginright=0.1;
marginbottom=0.2;
margintop=0.1;
%% setting height and width of the plot || usually half of the page || height 1.8 to 2.6 is fairly well
widthIn =5.3/2;  
heightIn=2.1;    
load ('D:\Breathing\Paper\PLOSOne\Figs\Fig_6\data_for_figure_6.mat')
x1=(data_for_figure_8(:,1))';
[x2,ix]=sort(x1);
x1=x2;
y1=(data_for_figure_8(:,2))';y2=(data_for_figure_8(:,3))';
y1=y1(ix);y2=y2(ix);
%%
figure(1)
plot(x1,y1,'^b','LineWidth',1); hold on;
plot(x1,y2,'ok','LineWidth',1); hold on;
%% ~~~~~~~~ Define Legend ~~~~~~~~~~~~~~~~~~~~~~~~~
% legend('$Q_{m,cav}$', '$Q_{m,c}$', 'Interpreter','latex','Location','southwest');
  legend('' ,'' );
    leg = legend('show');
     title(leg,'$c_k = 100 $ $(kg/m^2 \times s)$', 'Interpreter','latex');
grid on
%% setting y-lable and y-tick
ylabel('$\%$','Interpreter','latex','FontName',font_name,'FontSize',font_axestitle)
set(gca,'FontName','Times New Roman','FontSize',font_axes);
%% setting x-lable and x-tick
xlabel({'$\alpha$'},'Interpreter','latex','FontName',font_name,...	 
 'interpreter','latex','FontSize',font_axestitle);
xticks([-1.2:0.6:1.2]);
xlim([-1.2 1.2])
 Pos =get(gca,'Position');
 Postop=Pos(2)+Pos(4);
 Pos=get(gca,'Outerposition');
 Posleft=Pos(1);
%% ~~~~~~~~ Figure annotation ~~~~~~~~~~~~~~~~~~~~~~~~~
annotation('textbox',[Posleft-0.00 Postop-0.00 0 0],'String','$(a)$', ...
    'EdgeColor','none','FontSize',font_title,'FontName',font_name,'Interpreter','latex' ,...
    'HorizontalAlignment','left','VerticalAlignment','middle'  )
figure(1)
h1 = plot(x1,y1,'^b','LineWidth',1); hold on;
h2 = plot(x1,y2,'ok','LineWidth',1); hold on;
leg = legend('$Q_{m,cav}$', '$Q_{m,c}$', 'Interpreter', 'latex', 'Location', 'southwest');
title(leg, '$c_k = 100 $ $(kg/m^2 \times s)$', 'Interpreter', 'latex', 'FontSize', font_axestitle);
set(h1, 'HandleVisibility', 'off');
set(h2, 'HandleVisibility', 'off');
grid on;
set(gca, 'FontName', 'Times New Roman', 'FontSize', font_axes);
xlabel({'$\alpha$'}, 'Interpreter', 'latex', 'FontName', font_name, 'interpreter', 'latex', 'FontSize', font_axestitle);
xticks([-1.2:0.6:1.2]);
xlim([-1.2 1.2]);
saveas(gcf, 'figure_6a.fig');  % Save as .fig
saveas(gcf, 'figure_6a.eps', 'epsc'); 
saveas(gcf, 'figure_6a.jpg', 'jpg');  
saveas(gcf, 'figure_6a.png', 'png');  
saveas(gcf, 'figure_6a.emf', 'emf');  







