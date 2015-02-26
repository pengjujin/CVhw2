% CV Spring 2015 - Provided Code
% Minghuang Ma
% Batch script to compute and save dictionary.
% DO NOT MODIFY THIS FILE!

imgDir = '../images';
load('dataset.mat', 'trainPaths');

fullTrainPaths = cellfun(@(x)(fullfile(imgDir,x)), trainPaths, 'uniformoutput', false);
[dictionary] = getDictionary(fullTrainPaths);
fprintf('saving...\n');
save('dictionary.mat', 'dictionary');