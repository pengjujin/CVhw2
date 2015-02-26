function [ h ] = getImageFeatures( wordMap, dictionarySize )
%GETIMAGEFEATURES Summary of this function goes here
%   Detailed explanation goes here
rowvec = reshape(wordMap, [1, size(wordMap, 1)*size(wordMap, 2)]);
[h] = histc(rowvec, 1:dictionarySize);
end

