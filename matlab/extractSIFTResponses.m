function [siftResponses ] = extractSIFTResponses(I, binSize, step)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
magif = 3;
I = single(rgb2gray(I));
 I = vl_imsmooth(I, sqrt((binSize/magif)^2-0.25));
[f, d] = vl_dsift(I, 'size', binSize, 'step', step);
siftResponses = double(d');
end

