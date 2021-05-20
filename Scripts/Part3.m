[y, Fs] = audioread('in.wav');
sound(echo_gen(y,Fs,0.8,1),Fs);
function echo_sound = echo_gen(in,fs,delay,gain)  
samples = round(fs*delay)  ;
ds = floor(samples);
signal = zeros(length(in)+ds,1);
signal(1:length(in))=in(1:length(in));
echo_signal =zeros(length(in)+ds,1);
echo_signal(ds+(1:length(in*gain)))=in(1:length(in))*gain;
echo_sound= signal + echo_signal;
p= max(abs(echo_sound)); 
 if p>1 
     echo_sound=echo_sound ./ p; 
 end
end