load('vision.mat');
load('dataset.mat');
source = '../images/';
result = [];
  for i = 1:length(testPaths)
    img_path = [source, testPaths{i}];
    img = imread(img_path);
    wordMap = getVisualWords(img, dictionary);
    img_hist = getImageFeatures(wordMap, size(dictionary, 1));
    closest = pdist2(img_hist, trainFeatures);
    [M ind] = min(closest);
    result = [result; trainLabels(ind)];
  end
save result;