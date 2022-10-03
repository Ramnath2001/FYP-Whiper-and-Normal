path = 'D:\FYP\Dataset\Wtimit Audio FYP\whisper';
files = dir (strcat(path,'\*.wav'));
for k = 1:length(files)
    baseFileName = files(k).name;
    fullFileName = fullfile(path, baseFileName);
    fprintf(1, 'Now reading %s\n', fullFileName);
    % all of your actions for filtering and plotting go here
    
    [y,fs] = audioread(fullFileName);
    window = hamming(512);
    noverlap=256;
    nfft=1024;
    [S,F,T,P] = spectrogram(y(:,1),window,noverlap,nfft,fs,'yaxis');
    surf(T,F,10*log10(P),'edgecolor','none'); axis tight; view(0,90);
    colormap(hot);
    set(gca,'clim',[-80 -30]);
    set(gca, 'Visible', 'off')
    ax = gca;
    saveFilePath = 'D:\FYP\Images\whisper\';
    saveFileName = strcat(baseFileName(1:9),'.png');
    exportgraphics(ax, strcat(saveFilePath, saveFileName));
end