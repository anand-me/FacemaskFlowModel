fontname = 'Times New Roman';								
set(0,'DefaultAxesFontName',fontname,'DefaultTextFontName',fontname);								
set(0,'DefaultAxesFontSize', 16)								
set(0,'defaultTextInterpreter','latex');								
set(gcf, 'Position',  [100, 100, 550, 400])								
 %set(gcf, 'Position',  [50, 50, 200, 200])1 0.5 0								
 figure(1)
plot(alpha,(iBetas(:,2)),'-o','LineWidth',2,'MarkerFaceColor',[0 0 0],'MarkerSize',8);hold on;	%-4
grid on; 	
 set(gca,'XLim',[-1.2 1.2])		
   set(gca,'YLim',[0 1E-08])	
 set(gca,'XTick',(-1.5:0.3:1.5))
  xlabel('$\beta$','Interpreter','latex') %(Shape Coefficient)													
ylabel('$Q$ $(m^3/s)$','Interpreter','latex') 
legend({'$10^-5$'},'interpreter','latex','Orientation','vertical','Location','northeast');
 figure(2)
plot(alpha,(iBetas(:,2)),'-o','LineWidth',2,'MarkerFaceColor',[0 0 0],'MarkerSize',8);hold on;	%-3
grid on; 	
 set(gca,'XLim',[-1.2 1.2])
    set(gca,'YLim',[0 1E-06])	
 set(gca,'XTick',(-1.2:0.3:1.2))
  xlabel('$\beta$','Interpreter','latex') %(Shape Coefficient)													
ylabel('$Q$ $(m^3/s)$','Interpreter','latex') 
legend({'$10^-3$'},'interpreter','latex','Orientation','vertical','Location','northeast');
  figure(3)
plot(alpha,(iBetas(:,4)),'-o','LineWidth',2,'MarkerFaceColor',[0 0 0],'MarkerSize',8);hold on;		%-1																						
 grid on; 													
 set(gca,'XLim',[-1.2 1.2])			
 set(gca,'YLim',[0 1E-06])	
 set(gca,'XTick',(-1.5:0.3:1.5))													
 xlabel('$\beta$','Interpreter','latex') %(Shape Coefficient)													
ylabel('$Q$ $(m^3/s)$','Interpreter','latex') 	
legend({'$10^-1$'},'interpreter','latex','Orientation','vertical','Location','northeast');

%~~~~~~~~~~~~~~~~~~~~~~~~~
%   figure(3)
%   plot(alpha,(iBetas(:,2)),'-s','LineWidth',2,'MarkerFaceColor',[0 0 0],'MarkerSize',8);hold on;		%-1				
% plot(alpha,(iBetas(:,3)),'-o','LineWidth',2,'MarkerFaceColor',[0 0 0],'MarkerSize',8);hold on;		%-1																						
% plot(alpha,(iBetas(:,4)),'-d','LineWidth',2,'MarkerFaceColor',[0 1 0],'MarkerSize',8);hold on;		%-1																						
% grid on; 													
%  set(gca,'XLim',[-1.5 1.5])	
%   xlabel('$\beta$','Interpreter','latex') %(Shape Coefficient)													
% ylabel('$Q$ $(m^3/s)$','Interpreter','latex') 	
% legend('$10^-5$','$10^-3$','$10^-1$','interpreter','latex','Location','best')	