function Hd = fivefda_armstrong
%FIVEFDA_ARMSTRONG 返回离散时间滤波器对象。

% MATLAB Code
% Generated by MATLAB(R) 9.10 and Signal Processing Toolbox 8.6.
% Generated on: 26-Oct-2022 19:50:15

% Butterworth Bandpass filter designed using FDESIGN.BANDPASS.

% All frequency values are in Hz.
Fs = 48000;  % Sampling Frequency

Fstop1 = 180;         % First Stopband Frequency
Fpass1 = 200;         % First Passband Frequency
Fpass2 = 4000;        % Second Passband Frequency
Fstop2 = 4200;        % Second Stopband Frequency
Astop1 = 200;         % First Stopband Attenuation (dB)
Apass  = 1;           % Passband Ripple (dB)
Astop2 = 500;         % Second Stopband Attenuation (dB)
match  = 'stopband';  % Band to match exactly

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.bandpass(Fstop1, Fpass1, Fpass2, Fstop2, Astop1, Apass, ...
                      Astop2, Fs);
Hd = design(h, 'butter', 'MatchExactly', match);

% [EOF]