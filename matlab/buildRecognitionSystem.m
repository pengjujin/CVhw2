load('dictionary.mat');
load('dataset.mat');
source = '../wordmaps/';
l = length(trainLabels);
trainFeatures = [];
for i = 1:l
  img_path = [source, trainPaths{i}];
  img_path = strrep(img_path, '.jpg', '.mat');
  load(img_path);
  features = getImageFeatures(wordMap, size(dictionary,1));
  trainFeatures=[trainFeatures;features];
end    
save vision dictionary trainFeatures trainLabels
