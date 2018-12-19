function Hd = firLS(sampling,first, second)
%FIRLS Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.2 and the Signal Processing Toolbox 7.4.
% Generated on: 19-Dec-2018 18:00:19

% Equiripple Bandpass filter designed using the FIRPM function.

% All frequency values are in Hz.
Fs = sampling;  % Sampling Frequency

N      = 60;   % Order
Fstop1 = first - 10;  % First Stopband Frequency
Fpass1 = first;  % First Passband Frequency
Fpass2 = second;  % Second Passband Frequency
Fstop2 = second + 10;  % Second Stopband Frequency
Wstop1 = 1;    % First Stopband Weight
Wpass  = 1;    % Passband Weight
Wstop2 = 1;    % Second Stopband Weight
dens   = 20;   % Density Factor

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, [0 Fstop1 Fpass1 Fpass2 Fstop2 Fs/2]/(Fs/2), [0 0 1 1 0 ...
           0], [Wstop1 Wpass Wstop2], {dens});
Hd = dfilt.dffir(b);

% [EOF]
