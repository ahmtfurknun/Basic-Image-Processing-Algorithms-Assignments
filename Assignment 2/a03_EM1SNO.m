clear; clc; close all;

idx = 2;
input_image = imread(sprintf('input/degraded_img_%d.png', idx)); 
input_image = imresize(input_image, 0.5);
imu_data = load('input/input_data.mat'); 

len = double(imu_data.input_data{idx}.len) * 0.5;
theta = double(imu_data.input_data{idx}.theta);

psf = fspecial('motion', len, theta);

%Step 1: Richardson-Lucy Deconvolution
max_iterations = 100;
stop_threshold = 10;
restored_image = richardson_lucy(input_image, psf, max_iterations);

dot_image = zeros(101, 101); 
dot_image(51, 51) = 1;     
psf_visualized = imfilter(dot_image, psf, 'conv', 'same'); 

figure;
subplot(1, 3, 1); imshow(input_image); title('Original Image');
subplot(1, 3, 2); imshow(psf_visualized, []); title('PSF on a Single Dot');
subplot(1, 3, 3); imshow(restored_image); title(sprintf('Restored Image: Theta:%d Len:%.1f', theta, len));


%Step 2: Wallis Filter for Local Contrast Enhancement
desired_mean = 0.5;
desired_std = 0.25;
amax = 5;
p = 0.05;
w=100;
enhanced_image = wallis_filter(restored_image, desired_mean, desired_std, amax, p, w);

figure;
subplot(1, 2, 1); imshow(restored_image); title('Restored (R-L deconv.) image');
subplot(1, 2, 2);imshow(enhanced_image); title('Wallis-filtered deconvolved image');

% Step 3: Texture-Based Segmentation using Laws Filter
segmented_image = texture_segmentation(enhanced_image, true); 
%true for using saved model, false for re-training with textures in "samples" folder

figure;
imagesc(segmented_image); title('Segmentation map');


% Step 4: Blob Detection and Highlighting
[highlighted_image, blob_info] = blob_detection(segmented_image);

figure;
imshow(highlighted_image); title('Binary car segmentation map');

fprintf('There are %d cars in the image', numel(blob_info));
fprintf('Blob Locations:\n');
for i = 1:numel(blob_info)
    fprintf('Car %d: (x, y) = (%.2f, %.2f)\n', i, blob_info(i).Centroid(1), blob_info(i).Centroid(2));
end
