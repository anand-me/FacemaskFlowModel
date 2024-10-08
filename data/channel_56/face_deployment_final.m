% Plot mode-modified face samples
% Tso-Kang Wang, Akshay Anand 03/21/2021
clear all;
% close all

getd = @(p)path(p,path);
getd('toolbox_general/');
getd('toolbox_graph/');

%%%%% input %%%%%
alphaPCA = [0]; % weighting relative to standard deviation 
%-1.5 to 1.5 used for analytical model much higher & much lower alpha %%
%distort the facial feature % - Akshay Anand
ifeature = 4; % feature index
load(sprintf('feature_%d.mat', ifeature));
load('geodesic_distance.mat');
load('geodesic_weighting.mat');
[model msz] = load_model();
tl = model.tl; % connections
tex = model.texMU; % texture
distColor = @(X,k)mod(X/max(X), 1/k);
% Visualization parameters
fontname = 'Times New Roman';
set(0,'DefaultAxesFontName',fontname,'DefaultTextFontName',fontname);
set(0,'DefaultAxesFontSize', 8)
set(0,'defaultTextInterpreter','latex');
%z_meanface = -1000;
% Mean Face
Lface = length(meanfeature)/3;
[x_meanface, y_meanface, z_meanface] = decoupleF(meanfeature, Lface);
vertex_face = [x_meanface, y_meanface, z_meanface]';
U = U_all(:, ifeature); % geodesic distance
options.face_vertex_color = distColor(U, 1);
nmod = 200; % reaches 99.95% with 200 modes
meanmod = [x_meanface; y_meanface; z_meanface];
% PCA mode linear combination & smoothing
 figure(1)
set(gcf, 'Position',  [1171,476,560,420])
% plot_setting
for ialpha = 1:length(alphaPCA)
    %%%% Modification with weighted PCA modes %%%%
    feature_mod = meanfeature;
    for imod = 1:nmod
        gg = Zpca_mod(:, imod)*sigma(imod,imod)*alphaPCA(ialpha);
        feature_mod = feature_mod + gg;
    end
    [x_facemod, y_facemod, z_facemod] = decoupleF(feature_mod, Lface);    
   % output_face = [x_facemod, y_facemod, z_facemod]';
     %output_face = [z_facemod, x_facemod, y_facemod-10000]';
     output_face = [z_facemod, x_facemod, y_facemod-3000-3000]';%KSH 3000 comes from DZ diff for each face check ChannelCreateFile
    output_face = output_face/1000;
    %output_face = 
    plot_mesh(output_face, tl, options);
    axis equal
    colormap turbo;
    shading interp;
    plot_setting
    hold on;    
end

  az = -90 ; %90 -91,90 is good!!
  el = 90; %125
view(az, el);
%  saveas(gcf, sprintf('feature_%d.png', ifeature))
%  print('-depsc2',[name 'EPS']) %for latex	
% print('-dmeta', [name 'EMF']) %for word	
% figure(3)
% display_face (output_face, tex, tl, rp)