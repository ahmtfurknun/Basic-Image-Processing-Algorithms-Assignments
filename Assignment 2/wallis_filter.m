function enhanced = wallis_filter(image, desired_mean, desired_std, amax, p, W)
    image = im2double(image);
    
    [rows, cols, channels] = size(image);
    enhanced = zeros(rows, cols, channels);

    if mod(W,2)==0
        W = W+1;
    end

    for ch = 1:channels
        channel = image(:, :, ch);

        kernel = ones(W);

        M = conv2(channel, kernel, 'same') / (W^2);
        
        D = conv2((channel - M).^2, kernel, 'same') / (W^2);
        D = sqrt(D);

        G = (channel-M) .* amax .* desired_std ./ (amax .* D + desired_std) + (p * desired_mean + (1-p) * M);
        G(G<0) = 0;
        G(G>1) = 1;
        enhanced(:, :, ch) = G;
    end
end
