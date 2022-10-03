[y,fs] = audioread('Dataset/Wtimit Audio FYP/normal/s101u004n.wav');
window = hamming(512);
noverlap=256;
nfft=1024;

[S,F,T,P] = spectrogram(y(:,1),window,noverlap,nfft,fs,'yaxis');
surf(T,F,10*log10(P),'edgecolor','none'); axis tight; view(0,90);
colormap(hot);
set(gca,'clim',[-80 -30]);
xlabel("Time (sec)");
ylabel("Frequency (Hz)");
title("spectrogram of normal audio signal");
% set(gca, 'Visible', 'off')
ax = gca;
exportgraphics(ax, 'normal.jpg');