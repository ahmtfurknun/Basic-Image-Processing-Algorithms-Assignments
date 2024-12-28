function output_img = histogram_stretch(input_img)
    minValue = double(min(input_img(:)));
    maxValue = double(max(input_img(:)));
    coeff = 255 / (maxValue - minValue);
    output_img = coeff * (input_img - minValue);
    output_img = uint8(output_img);
end
