function [binary_mask, blob_info] = blob_detection(segmented_image)

    binary_mask = segmented_image == 2;
    binary_mask = imfill(binary_mask,'holes');

    binary_mask = bwareaopen(binary_mask, 1100, 8);
    SE = strel("square",10);
    binary_mask = imclose(binary_mask,SE);
   
    blob_info = regionprops(bwconncomp(binary_mask), 'BoundingBox', 'Centroid');

    for i = 1:length(blob_info)
        binary_mask = insertShape(double(binary_mask), 'Rectangle', ...
            blob_info(i).BoundingBox, 'Color', 'red', LineWidth=5);
    end
end