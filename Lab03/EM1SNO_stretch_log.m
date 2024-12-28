function output_img = stretch_log(input_img, c)
    log_img = c * log(double(input_img)+1);
    minValue = double(min(log_img(:)));
    maxValue = double(max(log_img(:)));

    coeff = 255 / (maxValue - minValue);
    output_img = coeff * (log_img - minValue);
    output_img = uint8(output_img);
end
