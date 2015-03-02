load('vision.mat');
load('dataset.mat');
source = '../images/';
numLabels = 8;
model = cell(numLabels, 1);
for k = 1:numLabels
    model{k} = svmtrain(double(trainLabels==k),trainFeatures,'-b 1 -t 0 -q');
end
test_features=[];
for i =1:testPaths
    img_path = [source, trainPaths{i}];
    img = imread(img_path);
    wordMap = getVisualWords(img, dictionary);
    img_hist = getImageFeatures(wordMap, size(dictionary, 1));
    test_features = [test_features; img_hist];
end

prob = zeros(200, numLabels);
for k=1:numLabels
    [predict,accur,p]=svmpredict(double(testLabels==k), test_featurse, model{k}, '-b 1');
%     prob(:,k)=p(:,model{k}.Label==1);
end
