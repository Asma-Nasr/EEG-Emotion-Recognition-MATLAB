function [filFP1, filFP2, filF7, filF3, filFZ, filF4, filF8, filT7, filC3, filCZ, filC4, filT8, filP7, filP3, filPZ, filP4, filP8, filO1, filO2] = nfilter(varargin)
% nfilter applies a bandpass filter to various input signals.

% Normalize input signals and filter them
for i = 1:nargin
    nSignals{i} = normc(varargin{i});
end

% Design the bandpass filter
[N, Wp] = ellipord([8/125 40/125], [7/125 42/125], 0.1, 60);
[B, A] = ellip(N, 0.1, 60, Wp);

% Apply the filter to each normalized signal
for i = 1:nargin
    filSignals{i} = filter(B, A, nSignals{i});
end

% Assign filtered signals to output variables
[filFP1, filFP2, filF7, filF3, filFZ, filF4, filF8, filT7, filC3, filCZ, filC4, filT8, filP7, filP3, filPZ, filP4, filP8, filO1, filO2] = deal(filSignals{:});
