function y_edgetapered = blur_edge(y)
    psf = fspecial('gaussian', 60, 10);

    otf = psf2otf(psf, size(y));

    blurred_img = abs(ifft2(otf .* fft2(y))); 

    wm = ones(70, 70); 
    wm = padarray(wm, [1 1], 0, 'both');  
    wm = imresize(wm, size(y), 'bilinear'); 

    y_edgetapered = wm .* y + (1 - wm) .* blurred_img;
end
