load('vision.mat');
load('dataset.mat');
source = '../images/';

model = svmtrain(trainFeatures,trainLabels,'-c 1');
img_path = [source, testPaths{1}];
img = imread(img_path);
wordMap = getVisualWords(img, dictionary);
img_hist = getImageFeatures(wordMap, size(dictionary, 1));
label = svmpredict([1], img_hist, model);
disp(label);