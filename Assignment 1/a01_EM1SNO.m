close all;
clear;
clc;

% for i = 1:15
%     I = imread(sprintf('input\\%d.jpg', i));
%     processor(I, true);
%     disp(i)
% end


resultMatrix = zeros(4, 2);   
imageFiles =  dir(['input' '\*.jpg']); 
disp("Process started...")
for i = 1:length(imageFiles)
    I = imread(sprintf('%d.jpg', i));
    result = processor(I);
    resultMatrix = resultMatrix + result;
    fprintf("%d. image is processed\n", i)
end

fprintf('\nProcessed %d images\n', length(imageFiles));
for i = 1:size(resultMatrix, 1)
    fprintf('Question %d:   A = %d    B = %d\n', i, resultMatrix(i, 1), resultMatrix(i, 2));
end