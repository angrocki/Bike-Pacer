function  s = freq2milage(f, r)
% Convert freqency to miles per hour
%
%   f = input freqency in Hz
%   r = bike radius in inches
    s = (f * 2 * 3600 *pi*r)/ 63360 ;
end 
