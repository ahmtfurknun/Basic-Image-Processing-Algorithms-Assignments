function [O] = image_segmenter(I, k)
    [h, w, ~] = size(I);
    S = reshape(I, [], 3);
    [LUT, M, ~] = mykmeans(S, k); 

    S_segmented = M(LUT, :); 

    O = reshape(S_segmented, h, w, 3);
end
