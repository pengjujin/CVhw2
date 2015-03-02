% CV Spring 2015 - Provided Code
% Minghuang Ma
% Batch script to compute and save word maps for all images.

% set the number of parallel workers
numOfCores = 6;

%*******************************************
%     STOP! DO NOT MODIFY CODE BELOW!      %
%*******************************************

source = '../images/';
target = '../wordmaps/';

% close current pools
try
    fprintf('Closing any pools...if any\n');
    %delete(gcp('nocreate'))
    matlabpool close
catch ME
    disp(ME.message);
end

fprintf('Starting a pool of workers with %d cores\n', numOfCores);
%parpool('local',numOfCores);
matlabpool('local',numOfCores);
%load data
load('dataset.mat','allPaths', 'categories');
load('dictionary.mat','dictionary');

% create output directories
if ~exist(target,'dir')
    mkdir(target);
end

for cate = categories
    if ~exist([target,cate{1}],'dir')
        mkdir([target,cate{1}]);
    end
end

%This is a peculiarity of loading inside of a function with parfor. We need to 
%tell MATLAB that these variables exist and should be passed to worker pools.
%dictionary = dictionary;

% calculate and save visual word maps
% matlab can't save/load inside parfor
l = length(allPaths);
wordMaps = cell(l,1);
parfor i=1:l
    fprintf('Converting to visual words %s\n', allPaths{i});
    I = imread([source, allPaths{i}]);
    wordMaps{i} = getVisualWords(I, dictionary);
end

fprintf('saving...\n');
for i=1:l
    wordMap = wordMaps{i};
    save([target, strrep(allPaths{i},'.jpg','.mat')],'wordMap');
end

%close the pool
fprintf('Closing the pool\n');
delete(gcp('nocreate'))
