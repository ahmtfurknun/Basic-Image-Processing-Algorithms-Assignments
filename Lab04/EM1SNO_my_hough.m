function [H] = my_hough(input_img)
    [width, heigth] = size(input_img);
    r_max = ceil(sqrt(width^2 + heigth^2));
    H = zeros(2*r_max+1, 180);

    for w = 1:width
        for h = 1:heigth
            if input_img(w, h) == 1
                for theta = 1:180
                    radius = round(w * cosd(theta) + h * sind(theta));
                    H(radius+r_max+1, theta) = H(radius+r_max+1, theta) + 1;
                end
            end
        end
    end
end





