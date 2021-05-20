% Make a noisy sine wave signal
x = 1 : 300;
[y, Fs] = audioread('in.wav');
noisySound = y + 0.01 * randn(length(y), 1);
subplot(2,1,1);
plot(noisySound, 'b-', 'LineWidth', 2);
title('Noisy Signal');
% Enlarge figure to full screen.
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
% Give a name to the title bar.
set(gcf, 'Name', 'Demo by Ramtin', 'NumberTitle', 'Off') 
% Now smooth with a Savitzky-Golay sliding polynomial filter
windowWidth = 27;
polynomialOrder = 3;
smoothY = sgolayfilt(y, polynomialOrder, windowWidth);
subplot(2,1,2);
plot(smoothY, 'b-', 'LineWidth', 2);
title('Smoothed Signal');
promptMessage = sprintf('کدام صدا را میخواهید بشنوید؟');
titleBarCaption = 'Specify Sound';
button = questdlg(promptMessage, titleBarCaption, 'بدون نویز', 'با نویز', 'بدون نویز');
audiowrite('withoutNoise.wav',smoothY,Fs);
audiowrite('withNoise.wav',noisySound,Fs);
if strcmpi(button, 'بدون نویز')
  % Play the perfect sound.
  soundsc(smoothY, Fs);
else
  % Play the noisy sound.
  soundsc(noisySound, Fs);
end