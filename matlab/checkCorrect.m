load('result.mat');
load('dataset.mat');
correct = 0;
for i = 1:length(testPaths)
  if(testLabels(i) == result(i))
    correct = correct+1;
  end
end
disp(correct);
