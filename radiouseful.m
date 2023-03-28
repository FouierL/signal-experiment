fs=8000;
recorder = audiorecorder
disp('Start speaking.')
recordblocking(recorder,10);
disp('End of Recording.');
y = getaudiodata(recorder)
soundsc(y,fs);
stem(y)