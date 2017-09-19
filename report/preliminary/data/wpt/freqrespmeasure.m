function [Amp, Ph] = freqrespmeasure(x, y)

% function: [Amp, Ph] = freqrespmeasure(x, y)
% x - first signal in the time domain
% y - second signal in the time domain
% Amp - freq response amplitude
% Ph - freq response phase, rad

% represent x as column-vector if it is not
if size(x, 2) > 1
    x = x';
end

% represent y as column-vector if it is not
if size(y, 2) > 1
    y = y';
end

% remove the DC component
x = x - mean(x);
y = y - mean(y);

% signals length
N = length(x);

% window preparation
win = rectwin(N);

% define the coherent amplification of the window
K = sum(win)/N;

% fft of the first signal
X = fft(x.*win);

% fft of the second signal
Y = fft(y.*win);

% spectral peaks detection
[~, indx] = max(abs(X));
[~, indy] = max(abs(Y));

% freqeuncy response amplitude
Xamp = abs(X(indx))/N/K;
Yamp = abs(Y(indy))/N/K;
Amp = Yamp/Xamp;

% frequency response phase
Ph = angle(Y(indy)) - angle(X(indx));

end