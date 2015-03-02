load('results.mat');
load('dataset.mat');
ecorrect = 0;
xcorrect = 0;
for i = 1:length(testPaths)
  if(testLabels(i) == euclidean_result(i))
    ecorrect = ecorrect+1;
  end
  if(testLabels(i) == x2_result(i))
    xcorrect = xcorrect+1;
  end
end
disp(ecorrect);
disp(xcorrect);
