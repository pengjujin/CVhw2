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
[c_euclid, order]=confusionmat(testLabels, euclidean_result);
[c_x2, order]=confusionmat(testLabels, x2_result);
disp(c_euclid);
disp(c_x2);
disp(ecorrect/length(testPaths));
disp(xcorrect/length(testPaths));
