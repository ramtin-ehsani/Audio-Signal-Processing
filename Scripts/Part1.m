[y, Fs] = audioread('in.wav');
sound(y,Fs);
histogram(y, 'FaceColor', 'blue');
grid on;