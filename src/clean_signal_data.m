function [clean_data, missing_packets, cleaned_trials] = clean_signal_data(varargin)
% This function searches for missing data packets or artifacts in a signal 
% (represented as a moving )
% and replaces those amplitudes with NaN

% INPUTS
% =========================================================
%    signal_data   : (MxN num or cell array) array containing data to search through
%    thresh        : (num) threshold value representing detection of dropped data packets in signal
%
% OUTPUTS
% =========================================================
%    clean_data    : (MxN num or cell array) array containing cleaned data
%    missing_packets  : (1xN cell array) cell array holding list of time indices
%                           where data packets were lost for each trial
%    cleaned_trials: (1xN num) list of trials that needed to be cleaned of
%                           lost data packets
%
%
% Jonathan Shulgach
% Last updated: 5/17/2020

plot_fig=false;
verbose = false;
cleaned_trials = [];
t_packets_lost = [];
sig_t_packets_lost = [];
sig_packets_lost = [];
missing_packets = [];
t_start = [];
t_end = [];

signal_data = varargin{1};
if iscell(signal_data)==1
    clean_data = cell(size(signal_data));
    [N_chan, N_trial] = size(signal_data);
else
    temp_data = signal_data;
    [N_chan, N_data] = size(signal_data);
    N_seg = 1;
    N_trial = 1;
    signal_data = cell(1); % convert to cell
    for i=1:N_chan
        signal_data{i,1} = temp_data(i,:);
    end
    clean_data = [];
end

% Load signal data and paramters, otherwise set default values if no additional inputs
if length(varargin) > 1
    thresh = abs(varargin{2});
else
    thresh = 1000; % percent difference
end
if length(varargin) > 2
    fs=varargin{3};
else
    fs=30e3;
end
if length(varargin) > 3
    buffer = abs(varargin{4})*fs/1000;
else
    buffer = 1;
end

if verbose==true
    fprintf(" | Searching for missing data packets")
end
for trial=1:N_trial
    if verbose==true
        fprintf(['Trial ', num2str(trial),' |'])
    end
    for chan=1:N_chan
        
        temp_data = signal_data{chan, trial};
        [N_seg, N_data] = size(temp_data);
        t_max = round(N_data/fs);
        
        % In case there are multiple segments to look at, each trial and channel run contains a data array of ~120 rows of
        % data representing ~120 segments of recording from stim events. each of these runs are checked to see if any artifacts exist 
        for j=1:N_seg
            
            % Remove DC offset from signal by subtracting window mean from signal 
            window = fs/100; %10ms
            new_data = medfilt1(temp_data);
            %percentage = movmean(temp_data, window);
            
            % Calculate the percentage difference between data points to
            % find catastrophic changes in the data.
            %percentage = ((temp_data(:,2:end) - (temp_data(:,1:end-1))) ./ temp_data(:,1:end-1)).*100;
            
            for i=2:length(new_data)
                % get time indices for packet loss
                if (new_data(i) > thresh && new_data(i-1) < thresh) || (new_data(i) < -thresh && new_data(i-1) > -thresh)
                %if (temp_data(j,i) > thresh && temp_data(j,i-1) < thresh) || (temp_data(j,i) < -thresh && temp_data(j,i-1) > -thresh)
                    t_start = [t_start, i];
                    t_packets_lost = [t_packets_lost,i/fs];
                elseif (new_data(i) < thresh && new_data(i-1) > thresh) || (new_data(i) > -thresh && new_data(i-1) < -thresh)
                %elseif (temp_data(j,i) < thresh && temp_data(j,i-1) > thresh) || (temp_data(j,i) > -thresh && temp_data(j,i-1) < -thresh)
                    t_end = [t_end, i];
                    t_packets_lost = [t_packets_lost,i/fs];
                elseif (new_data(i) < -thresh && new_data(i-1) < -thresh) || (new_data(i) > thresh && new_data(i-1) > thresh) 
                %elseif (temp_data(j,i) < -thresh && temp_data(j,i-1) < -thresh) || (temp_data(j,i) > thresh && temp_data(j,i-1) > thresh)
                    t_packets_lost = [t_packets_lost,i/fs];
                end
            end
            
            % Apply linear interpolated blanking
            for i=1:length(t_start)
                if ((t_start(i)-buffer) > 0) && ((t_end(i)+buffer) < N_data)
                    sig_start = new_data(j,t_start(i)-buffer);
                    sig_end = new_data(j,t_end(i)+buffer);
                    sig_t_packets_lost = [sig_t_packets_lost; {(t_start(i)-buffer):(t_end(i)+buffer)}];
                    sig_packets_lost = [sig_packets_lost; {new_data(j,t_start(i)-buffer:t_end(i)+buffer)}];
                    new_data(j,t_start(i)-buffer:t_end(i)+buffer) = linspace(sig_start,sig_end,length(t_start(i)-buffer:t_end(i)+buffer));
                end
            end

            % Extra plot for debugging
            if isempty(temp_data)==0 && plot_fig==true
                x_time = linspace(-2,t_max,N_data);
                figure(12)
                subplot(1,2,1)
                plot(x_time, signal_data{chan, trial}')
                xlim([-2 t_max]);
                ylim([-thresh 1000]);
                %axis tight
                title('before')
                subplot(1,2,2)
                plot(x_time, new_data)
                xlim([-2 t_max]);
                ylim([-thresh 1000]);
                title('after')
                %axis tight
                drawnow
            end
            if iscell(clean_data)==1
                clean_data{chan,trial} = new_data;
            else
                clean_data(chan,:) = new_data;
            end
            
            
        end
        missing_packets{trial}.time = t_packets_lost;
        missing_packets{trial}.signals = sig_packets_lost;
        missing_packets{trial}.signals_t = sig_t_packets_lost;
    end
    if verbose==true
        fprintf("\n")
    end
end