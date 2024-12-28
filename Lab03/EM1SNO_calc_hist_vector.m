function hist_vector = calc_hist_vector(input_img)
    hist_vector = zeros([256 1]);

    height = size(input_img,1);
    width = size(input_img, 2);

    for h = 1:height
        for w = 1:width
            idx = input_img(h, w) + 1;
            hist_vector(idx) = hist_vector(idx) + 1;
        end
    end
end
