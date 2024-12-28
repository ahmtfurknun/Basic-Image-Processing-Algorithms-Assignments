function [TH] = threshold(IMG, level)
    if size(IMG, 3) ~= 1
        warning('Input image is not grayscale. It will be converted to grayscale');
        IMG = rgb2gray(IMG);
    end
    TH = IMG >= level;
    TH = TH * 255;
end







