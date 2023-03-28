function Hd = butterword
Fs = 20000;  % Sampling Frequency
Fpass = 1000;        % Passband Frequency
Fstop = 4000;        % Stopband Frequency
Apass = 3;           % Passband Ripple (dB)
Astop = 15;          % Stopband Attenuation (dB)
match = 'stopband';  % Band to match exactly

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.lowpass(Fpass, Fstop, Apass, Astop, Fs);
Hd = design(h, 'butter', 'MatchExactly', match);
% [EOF]
