load('vision.mat');
load('dataset.mat');
source = '../images/';
euclidean_result = [];
x2_result = [];
  for i = 1:length(testPaths)
    img_path = [source, testPaths{i}];
    img = imread(img_path);
    wordMap = getVisualWords(img, dictionary);
    img_hist = getImageFeatures(wordMap, size(dictionary, 1));
    euclid_close = pdist2(img_hist, trainFeatures, 'euclidean');
    [M ind] = min(euclid_close);
    euclidean_result = [euclidean_result; trainLabels(ind)];
  end
save results x2_result euclidean_result;
