function restored = richardson_lucy(input, psf, iterations)
    input = im2double(input);
    otf = psf2otf(psf, size(input));
    restored = input;

    for i = 1:iterations
        est = ifft2(fft2(restored) .* otf);
        ratio = input ./ (est + eps); % Avoid division by zero
        restored = restored .* ifft2(fft2(ratio) .* conj(otf));
    end

    restored = real(restored);
end

% R-L with stopping criteria
% function restored = richardson_lucy(input, psf, max_iterations, stop_threshold)
%     input = im2double(input);
% 
%     otf = psf2otf(psf, size(input));
%     restored = input;
% 
%     log_kernel = fspecial('log', 5 , 0.5); % 5x5 kernel, sigma=0.5
% 
%     for i = 1:max_iterations
%         est = ifft2(fft2(restored) .* otf);
%         ratio = input ./ (est + eps); % Avoid division by zero
%         restored = restored .* ifft2(fft2(ratio) .* conj(otf));
%         restored = real(restored);
% 
%         log_filtered = imfilter(restored, log_kernel, 'replicate');
%         max_intensity = max(abs(log_filtered(:)));
% 
%         if max_intensity > stop_threshold
%             disp(fprintf("Richardson-Lucy Iterations:%d", i))
%             break;
%         end
%     end
% end
