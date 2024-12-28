function output_img = myconv(input_img, kernel)
    r1 = floor(size(kernel,1) / 2); 
    r2 = floor(size(kernel,2) / 2); 
    
    padded = padarray(input_img, [r1,r2], 0);
    kernel = rot90(kernel, 2);

    height = size(input_img,1);
    width = size(input_img, 2);

    output_img = zeros(size(input_img));
    
    for h = 1:height
        for w = 1:width
            sub = padded(h:h+2*r1, w:w+2*r2);
            output_img(h,w) = sum(sub.*kernel, "all");
        end
    end
end
