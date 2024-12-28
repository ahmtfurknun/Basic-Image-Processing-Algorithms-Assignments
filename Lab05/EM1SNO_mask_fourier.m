function newF = mask_fourier(F, x, y, r)
    F_shifted = fftshift(F);
    [N1, N2] = size(F_shifted);

    x = round(x);
    y = round(y);

    for i = 1:length(x)
        y_1 = max(1, y(i) - r);
        y_2 = min(N1, y(i) + r);

        x_1 = max(1, x(i) - r);
        x_2 = min(N2, x(i) + r);

        F_shifted(y_1:y_2, x_1:x_2) = 0 + 0i;
    end
  
    
    newF = ifftshift(F_shifted);
end
