clear all
ldim=1000;
fontname = 'Times New Roman';
set(0, 'DefaultAxesFontname', fontname,'DefaultTextFontName', fontname)
set(0, 'DefaultAxesFontSize', 16)
set(gcf, 'Position',  [680,558,360,420])
icasestart=39;
icaseend=39;
postporcessingplot=1;
Betaall=[0.001]/1000;
npointalongChannel =50;
close all
%% MASK Cases
MAXFACTOR=[1.1429    1.2857    1.4286];   %small/medium/large
mask_casenum = 2;
mask_filename = ['small', 'medium', 'large'];
% number of points along y direction for each (left to right ears)
NYALL=[30 34 37];
% tuck-in ratios
TUCKFACTOR=[0.7 0.5 0.3];
tuck_casenum = 2;
tuck_filename = ['large', 'medium', 'small'];
% size of meshes in mm
MASK_NX=7/1.6667*2.54*10;
MASK_NY=7*2.54*10;
% chnage the shape from micron to mm
ChangeCoef=1/1000;
%% Simulation parameters
%database for the faces
load PreviousCASEMOVIEadditionTKW;
load PreviousCASEMOVIEaddition_2TKW;
BASEFOLDER2='./channel_36/';
BASEFOLDER=['./channel_36/'];
nCASEmax=0;
irunrestart=0;
part3run=1;
if(part3run==1)
    ijcaseold=-10;
    ChannelCase=[];
    % read the channel data for each case, mask size and tuck-in ratios
    for icase=39
        irunp=0;
        ip=0;
        for iplace=MAXFACTOR
            ip=ip+1;
            NY=NYALL(ip);
            ip2n=0;
            for ip2=[0.5] 
                ip2n=ip2n+1;
                ip3n=0;
                for ip3=TUCKFACTOR
                    irunp=irunp+1;
                    ip3n=ip3n+1;
                    NAMESAVE_ip=[num2str(ip) '_' num2str(ip2n) '_' num2str(ip3n) '_'];
                    icaseCOPY=icase;
                    string3=[BASEFOLDER2 'Body_' num2str(icaseCOPY) '_' CASE_DATA{icase}.name '_' NAMESAVE_ip 'ChannelDATA.mat'];
                    load(string3,'Nchannel','ChannelDataBase','CenterData', 'FACE', 'MASK', 'NX','NY','S1','S2');
                    ChannelCase{icase,ip,ip3n}.ChannelDataBase=ChannelDataBase;
                    ChannelCase{icase,ip,ip3n}.Nchannel=Nchannel;
                    ChannelCase{icase,ip,ip3n}.CenterData=CenterData./ldim;
                    ChannelCase{icase,ip,ip3n}.Plot.FACE=FACE;
                    ChannelCase{icase,ip,ip3n}.Plot.MASK=MASK;
                    ChannelCase{icase,ip,ip3n}.Plot.NX=NX;
                    ChannelCase{icase,ip,ip3n}.Plot.NY=NY;
                    ChannelCase{icase,ip,ip3n}.Plot.S1=S1;
                    ChannelCase{icase,ip,ip3n}.Plot.S2=S2; 
                end
            end
        end
    end 
    %% Calculation loop
    for icase=1:N_CASE
        icaseCOPY=icase;
        if(icase>nCASEmax)
            irealization2=0;
            if(icase >=icasestart  && icase<=icaseend && irealization2>-1)
                irunp=0;
                ip=0;
                for iplace=1
                    ip=ip+mask_casenum;
                    NY=NYALL(ip);
                    ip2n=0;
                    for ip2=[0.5] %-1:1
                        ip2n=ip2n+1;
                        ip3n=0;

                        for ip3=1
                            irunp=irunp+1;
                            ip3n=ip3n+tuck_casenum;
                            NAMESAVE_ip=[num2str(ip) '_' num2str(ip2n) '_' num2str(ip3n) '_'];
                            if(irunp>=irunrestart)
                                %reterived the current channel database
                                ChannelDataBase=ChannelCase{icase,ip,ip3n}.ChannelDataBase;
                                Nchannel=ChannelCase{icase,ip,ip3n}.Nchannel;
                                CenterData=ChannelCase{icase,ip,ip3n}.CenterData;
                                FACE=ChannelCase{icase,ip,ip3n}.Plot.FACE;
                                MASK=ChannelCase{icase,ip,ip3n}.Plot.MASK;
                                NX=ChannelCase{icase,ip,ip3n}.Plot.NX;
                                NY=ChannelCase{icase,ip,ip3n}.Plot.NY;
                                S1=ChannelCase{icase,ip,ip3n}.Plot.S1;
                                S2=ChannelCase{icase,ip,ip3n}.Plot.S2;
                                string4=[BASEFOLDER2 'Body2nd_' num2str(icaseCOPY) '_' CASE_DATA{icase}.name '_' NAMESAVE_ip '_Beta' '.mat'];
                                load(string4);                                
                                for iBetas=1:length(Betaall)
                                     uout=DATABetasave{iBetas}.uout;
                                     vout=DATABetasave{iBetas}.vout; 
                                     leak_tangFperW=DATABetasave{iBetas}.leak_tangFperW;
                                     leak_normoverdAREA=DATABetasave{iBetas}.leak_normoverdAREA;
                                     leak_normV=DATABetasave{iBetas}.leak_normV;
                                     Height_all=DATABetasave{iBetas}.Height_all;                                
                                    if postporcessingplot==1
                                        S1channel=zeros(Nchannel,npointalongChannel);
                                        S2channel=zeros(Nchannel,npointalongChannel);
                                        Uchannel=-leak_tangFperW(1:Nchannel,1:npointalongChannel); 
                                        Uchannel(1:Nchannel,1)=Uchannel(1:Nchannel,2);
                                        Uchannel(1:Nchannel,npointalongChannel)=Uchannel(1:Nchannel,49);
                                         % Extracting the 3d coordinate of
                                        % the points; vortices of face and
                                        % mask
                                        for i=1:NX
                                            for j=1:NY
                                                k=(i-1)*NY+j;
                                                for l=1:3
                                                    VF{l}(i,j)=FACE.v(k,l);VM{l}(i,j)=MASK.v(k,l);   
                                                end
                                            end
                                        end
                                         lw=6;   
                                        colormap turbo %parula %  hot | turbo | hsv | colorcube
                                        cmap=colormap;
                                      Umax=max(max(Uchannel));Umin=min(min(Uchannel));
                                        for i=1:Nchannel
                                            updated_uchannel_i=Uchannel(i,:);
                                            S1channel(i,:)= ChannelDataBase{i}.xy(:,1);  %r theta => s1 and s2
                                            S2channel(i,:)= ChannelDataBase{i}.xy(:,2);
                                            for l=1:3  %x y z
                                                XYZchannel{i}(:,l)=interp2(S2,S1,VM{l},S1channel(i,:), S2channel(i,:),'cubic');  %Finding the coordinate of the points
                                            end
                                        end
                                          for  i=1:Nchannel 
                                              iupdated=i;      
                         updated_uchannel_i=Uchannel(iupdated,:);
                         updated_uchannel_i=[ updated_uchannel_i(2), updated_uchannel_i(2:end-1), updated_uchannel_i(end-1)];                      
                         Vcol=min(256,uint8(floor(updated_uchannel_i/Umax*256))+1);
                                         figure(1);hold on;
                                            for j=2:npointalongChannel
                                               line([XYZchannel{i}(j-1,1) XYZchannel{i}(j,1)], ...
                                                   [XYZchannel{i}(j-1,2) XYZchannel{i}(j,2)], ...
                                                   [XYZchannel{i}(j-1,3) XYZchannel{i}(j,3)], ...
                                                   'color',[cmap(Vcol(j),1) cmap(Vcol(j),2) cmap(Vcol(j),3) ],'linewidth',lw)   
                                             axis equal
                                            end
                                      figure(1);hold on;
                                      az = -90 ; %90 -91,90 is good!!
                                      el = 90; %125
                                     view(az, el);
                                    set(gca,'XLim',[-100 100])
                                    set(gca,'XTick',(-100:20:100))
                                    set(gca,'YLim',[-100 100])
                                    set(gca,'YTick',(-80:20:80))
                                    set(gca,'ZLim',[-100 100])
                                    set(gca,'ZTick',(-80:20:80))
                                        patch('Faces',MASK.f.v,'Vertices',MASK.v,'FaceAlpha',0.2,'EdgeAlpha',0.3,...
                                            'FaceColor',[0.058823529411765 1 1],...
                                            'EdgeColor','none')
                                        patch('Faces',FACE.f.v,'Vertices',FACE.v,'FaceAlpha',0.2,'EdgeAlpha',0.3,...
                                            'FaceColor',[0.058823529411765 0 1],...
                                            'EdgeColor','none')
                                        end
                                     figure(1)
                                   saveas(gcf, sprintf('channel_36%d_case%d.jpg', iBetas,icase))
                               end
                                disp(['CASE Done Postprocess ===',num2str(icase),'|__|',NAMESAVE_ip,'======']);
                               
                                end
%close all
                        end
                    end
                end
                
            end
            disp(['CASE Done ===',num2str(icase),'======']);
            end   
    end
    end
end












