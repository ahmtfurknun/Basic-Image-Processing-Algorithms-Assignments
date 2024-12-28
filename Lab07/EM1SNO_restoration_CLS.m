function [x_tilde] = restoration_CLS(y, h, alpha, c)

    Y = fft2(y);

    H = psf2otf(h, size(Y));  
    C = psf2otf(c, size(Y));  

    R = conj(H) ./ (abs(H).^2 + alpha * abs(C).^2);  
    x_tilde = abs(ifft2(Y .* R));
end
