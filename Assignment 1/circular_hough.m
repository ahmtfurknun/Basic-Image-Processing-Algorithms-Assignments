function [H] = circular_hough(input_img, r)
    [width, height] = size(input_img);
    H = zeros(width, height);

    for w = 1:width
        for h = 1:height
            if input_img(w, h) == 1
                for theta = 0:360
                    a = round(w - r * cosd(theta));  
                    b = round(h - r * sind(theta));

                    if a > 0 && a <= width && b > 0 && b <= height
                        H(a, b) = H(a, b) + 1;
                    end
                end
            end
        end
    end
end





