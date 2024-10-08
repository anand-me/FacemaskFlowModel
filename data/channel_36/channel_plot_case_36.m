clear all;
close all;

% Basic setup
ldim = 1000;
fontname = 'Times New Roman';
set(0, 'DefaultAxesFontname', fontname, 'DefaultTextFontName', fontname)
set(0, 'DefaultAxesFontSize', 16)
set(gcf, 'Position', [680, 558, 360, 420])

% Constants
Betaall = [0.001] / 1000;
npointalongChannel = 50;

% Set case information
icase = 39;
NAMESAVE_ip = '2_1_2_';

% Construct filenames
channelDataFile = ['Body_' num2str(icase) '_nose_' NAMESAVE_ip 'ChannelDATA.mat'];
betaDataFile = ['Body2nd_' num2str(icase) '_nose_' NAMESAVE_ip '_Beta.mat'];

% Load channel data
if ~exist(channelDataFile, 'file')
    error('Channel data file not found: %s', channelDataFile);
end
load(channelDataFile, 'Nchannel', 'ChannelDataBase', 'CenterData', 'FACE', 'MASK', 'NX', 'NY', 'S1', 'S2');

% Adjust CenterData
CenterData = CenterData ./ ldim;

% Load Beta data
if ~exist(betaDataFile, 'file')
    error('Beta data file not found: %s', betaDataFile);
end
load(betaDataFile);

% Process and plot data
for iBetas = 1:length(Betaall)
    uout = DATABetasave{iBetas}.uout;
    vout = DATABetasave{iBetas}.vout;
    leak_tangFperW = DATABetasave{iBetas}.leak_tangFperW;
    leak_normoverdAREA = DATABetasave{iBetas}.leak_normoverdAREA;
    leak_normV = DATABetasave{iBetas}.leak_normV;
    Height_all = DATABetasave{iBetas}.Height_all;

    % Prepare data for plotting
    S1channel = zeros(Nchannel, npointalongChannel);
    S2channel = zeros(Nchannel, npointalongChannel);
    Uchannel = abs(leak_tangFperW(1:Nchannel, 1:npointalongChannel));
    Uchannel(:, 1) = Uchannel(:, 2);
    Uchannel(:, npointalongChannel) = Uchannel(:, 49);

    % Extract 3D coordinates
    VF = cell(1,3);
    VM = cell(1,3);
    for i = 1:NX
        for j = 1:NY
            k = (i-1)*NY + j;
            for l = 1:3
                VF{l}(i,j) = FACE.v(k,l);
                VM{l}(i,j) = MASK.v(k,l);
            end
        end
    end

    % Plotting setup
    lw = 6;
    colormap turbo
    cmap = colormap;
    Umax = max(max(Uchannel));
    Umin = min(min(Uchannel));

    % Prepare channel data
    XYZchannel = cell(1, Nchannel);
    for i = 1:Nchannel
        S1channel(i,:) = ChannelDataBase{i}.xy(:,1);
        S2channel(i,:) = ChannelDataBase{i}.xy(:,2);
        for l = 1:3
            XYZchannel{i}(:,l) = interp2(S2, S1, VM{l}, S1channel(i,:), S2channel(i,:), 'cubic');
        end
    end

    % Plot channels
    figure(1); hold on;
    for i = 1:Nchannel
        updated_uchannel_i = Uchannel(i,:);
        updated_uchannel_i = [updated_uchannel_i(2), updated_uchannel_i(2:end-1), updated_uchannel_i(end-1)];
        Vcol = min(256, uint8(floor(updated_uchannel_i/Umax*256))+1);

        for j = 2:npointalongChannel
            line([XYZchannel{i}(j-1,1) XYZchannel{i}(j,1)], ...
                 [XYZchannel{i}(j-1,2) XYZchannel{i}(j,2)], ...
                 [XYZchannel{i}(j-1,3) XYZchannel{i}(j,3)], ...
                 'color', [cmap(Vcol(j),1) cmap(Vcol(j),2) cmap(Vcol(j),3)], 'linewidth', lw)
        end
    end

    % Set view and axes
    az = -90;
    el = 90;
    view(az, el);
    axis equal
    set(gca, 'XLim', [-100 100], 'XTick', -100:20:100)
    set(gca, 'YLim', [-100 100], 'YTick', -80:20:80)
    set(gca, 'ZLim', [-100 100], 'ZTick', -80:20:80)

    % Add face and mask patches
    patch('Faces', MASK.f.v, 'Vertices', MASK.v, 'FaceAlpha', 0.2, 'EdgeAlpha', 0.3, ...
          'FaceColor', [0.058823529411765 1 1], 'EdgeColor', 'none')
    patch('Faces', FACE.f.v, 'Vertices', FACE.v, 'FaceAlpha', 0.2, 'EdgeAlpha', 0.3, ...
          'FaceColor', [0.058823529411765 0 1], 'EdgeColor', 'none')

    % Save figure
     saveas(gcf, sprintf('channel_36_%d_case%d.fig', iBetas,icase))
end

disp(['CASE Done Postprocess ===', num2str(icase), '|__|', NAMESAVE_ip, '======']);