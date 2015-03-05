addpath('release');
load('vision.mat');
load('dataset.mat');
source = '../images/';
model = svmtrain(trainLabels,trainFeatures,'-s 0 -t 1 -c 1 -b 1 -q');
test_features=[];

for i =1:length(testLabels)
    img_path = [source, testPaths{i}];
    img = imread(img_path);
    wordMap = getVisualWords(img, dictionary);
    img_hist = getImageFeatures(wordMap, size(dictionary, 1));
    test_features = [test_features; img_hist];
end

[predict,accur,p]=svmpredict(testLabels, test_features, model, '-b 1');
[C  order] =confusionmat(testLabels, predict);
