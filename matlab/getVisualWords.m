function [ wordMap ] = getVisualWords( I, dictionary )
%GETVISUALWORDS Summary of this function goes here
%   Detailed explanation goes here
d = extractSIFTResponses(I, 4,1);
D = pdist2(d, dictionary);
original_size = size(I);
new_r = original_size(1)-12;
new_c = original_size(2)-12;
[M, ret] = min(D, [],2); 
wordMap = reshape(ret, [new_r, new_c]);
end

