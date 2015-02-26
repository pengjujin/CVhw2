function [ dictionary ] = getDictionary( imgPaths )
%GETDICTIONARY Summary of this function goes here
%   Detailed explanation goes here
alpha = 100;
K = 200;
[total_size, col] = size(imgPaths); 
d_all = [];
for n = 1:total_size
    current_path = imgPaths{n};
    img = imread(current_path);
    d = extractSIFTResponses(img,4, 8);
    perm =randperm(size(d,1));
    sel = perm(1:alpha);
    d_use = d(sel,:);
    d_all = [d_all; d_use];
end
[unused, dictionary] = kmeans(d_all, K, 'EmptyAction', 'drop');
end
