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
    %%%%% implementing chi-square distance

    m = size(img_hist,1);  n = size(trainFeatures,1);
    mOnes = ones(1,m); D = zeros(m,n);
    for i=1:n
      yi = trainFeatures(i,:);  
      yiRep = yi( mOnes, : );
      s = yiRep + img_hist;    
      d = yiRep - img_hist;
      x2_close(:,i) = sum( d.^2 ./ (s+eps), 2 );
    end
    x2_close = x2_close/2;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    [S euc_ind] = min(euclid_close);
    [K x2_ind] = min(x2_close);
    euclidean_result = [euclidean_result; trainLabels(euc_ind)];
    x2_result = [x2_result; trainLabels(x2_ind)];
  end

  [C_euclidean d1] = confusionmat(testLabels, euclidean_result);
  [C_x2 d2] = confusionmat(testLabels, x2_result);
